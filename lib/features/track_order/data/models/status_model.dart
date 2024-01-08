import 'dart:convert';

import '../../domain/entities/status_entity.dart';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel extends StatusEntity {
  const StatusModel({
    required String date,
    required String time,
    required String title,
    required String desc,
  }) : super(
          date: date,
          time: time,
          title: title,
          desc: desc,
        );

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        date: json["date"],
        time: json["time"],
        title: json["title"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "title": title,
        "desc": desc,
      };
}
