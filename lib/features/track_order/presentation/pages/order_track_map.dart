import 'dart:async';
import 'package:dreamsoft/core/styles/styles.dart';
import 'package:dreamsoft/core/widgets/circle-widget.dart';
import 'package:dreamsoft/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/map_style.dart';

class OrderTrackingMap extends StatefulWidget {
  static LatLng _latlng = const LatLng(30.79872040607907, 31.00182610837371);
  const OrderTrackingMap({super.key});

  @override
  State<OrderTrackingMap> createState() => _OrderTrackingMapState();
}

String googleAPiKey = "AIzaSyA-aI9Cp6CeXcyV86RVc2JZRzkj9UfBHGY";

class _OrderTrackingMapState extends State<OrderTrackingMap> {
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> _controller = Completer();
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  Map<MarkerId, Marker> markers = {};

  _getUserLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      final GoogleMapController controller = await _controller.future;
      OrderTrackingMap._latlng = LatLng(position.latitude, position.longitude);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(position.latitude, position.longitude), zoom: 16),
        ),
      );
    } else {
      throw Exception('Error');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    controller.setMapStyle(mapStyle);
    googleMapController = controller;
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(OrderTrackingMap._latlng.latitude,
          OrderTrackingMap._latlng.longitude),
      const PointLatLng(30.79872040607907, 31.00182610837371),
      travelMode: TravelMode.driving,
      optimizeWaypoints: true,
      avoidTolls: true,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");

    Polyline polyline = Polyline(
        width: 5,
        polylineId: id,
        zIndex: -50,
        color: black,
        geodesic: true,
        jointType: JointType.round,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  addMarks() async {
    _addMarker(
      LatLng(OrderTrackingMap._latlng.latitude, OrderTrackingMap._latlng.longitude),
      "origin",
      BitmapDescriptor.fromBytes(destinationLocationMarker!),
      "start");

    _addMarker(
      const LatLng(30.79872040607907, 31.00182610837371),
      "destination",
      BitmapDescriptor.fromBytes(currentLocationMarker!),
      "end",
    );
  }

  _addMarker(
      LatLng position, String id, BitmapDescriptor descriptor, String title) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
  }
  @override
  void initState() {
    _getUserLocation();
    addMarks();
    _getPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        appBarWidget: [
          CircleWidget(
            onTap: () => Navigator.pop(context),
            shadow: true,
            color: white,
            child: const Icon(Icons.close)
          ),
          Text("Finding Collection Point", style: TextStyles.textViewBlack20),
          CircleWidget(
            onTap: () async {
              var currentZoomLevel = await googleMapController.getZoomLevel();
              currentZoomLevel = currentZoomLevel + 0.5;
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: const LatLng(30.79872040607907, 31.00182610837371),
                    zoom: currentZoomLevel,
                  ),
                ),
              );
            },
            shadow: true,
            color: white,
            child: const Icon(Icons.connecting_airports_rounded)
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            tilt: 0.0,
            target: OrderTrackingMap._latlng,
            zoom: 10.0,
          ),
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: false,
          tiltGesturesEnabled: true,
          compassEnabled: false,
          trafficEnabled: false,
          markers: Set<Marker>.of(markers.values),
          polylines: Set<Polyline>.of(polylines.values),
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }
}
