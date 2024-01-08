import 'package:dreamsoft/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/util/map_style.dart';
import '../pages/order_track_map.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175.h,
      margin: EdgeInsets.symmetric(vertical: 25.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.10),
            offset: const Offset(0, 2),
            blurRadius: 10
          )
        ]
      ),
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.79872040607907, 31.00182610837371),
          zoom: 13
        ),
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        tiltGesturesEnabled: false,
        onTap: (argument) => Navigator.push(context,MaterialPageRoute(builder: (context) => const OrderTrackingMap())),
        compassEnabled: false,
        scrollGesturesEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId("ID"),
            position:const LatLng(30.79872040607907, 31.00182610837371),
            icon: BitmapDescriptor.fromBytes(currentLocationMarker!)
          )
        },
        onMapCreated: (GoogleMapController controller) {controller.setMapStyle(mapStyle);},
      ),
    );
  }
}
