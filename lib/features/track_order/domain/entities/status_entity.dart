import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  final String date;
  final String time;
  final String title;
  final String desc;

  const StatusEntity({
    required this.date,
    required this.time,
    required this.title,
    required this.desc,
  });

  @override
  List<Object?> get props => [date, time, title, desc];
}
