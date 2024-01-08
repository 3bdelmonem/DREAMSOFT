import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/status_entity.dart';

part 'track_order_state.dart';

class TrackOrderCubit extends Cubit<TrackOrderState> {
  TrackOrderCubit() : super(TrackOrderInitial());
  List<StatusEntity> orderStatus = [
    const StatusEntity(
      date: "June 26",
      time: "11:00",
      title: "Package have been received",
      desc: "Tamil Nadu",
    ),
    const StatusEntity(
      date: "June 25",
      time: "20:30",
      title: "Arrived at destination area",
      desc: "end of tracking delivery tomorrow",
    ),
    const StatusEntity(
      date: "June 24",
      time: "09:45",
      title: "Accepted by GHL",
      desc: "Delhi - India",
    ),
    const StatusEntity(
      date: "June 22",
      time: "13:05",
      title: "Arrived at destination",
      desc: "Washington - llinois",
    ),
  ];
}
