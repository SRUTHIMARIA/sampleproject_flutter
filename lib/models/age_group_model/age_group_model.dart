// To parse this JSON data, do
//
//     final ageGroupModel = ageGroupModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AgeGroupModel ageGroupModelFromJson(String str) => AgeGroupModel.fromJson(json.decode(str));

String ageGroupModelToJson(AgeGroupModel data) => json.encode(data.toJson());

class AgeGroupModel {
  AgeGroupModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory AgeGroupModel.fromJson(Map<String, dynamic> json) => AgeGroupModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.count,
    required this.image,
    required this.selected,
  });

  final int id;
  final String count;
  final String image;
  final bool selected;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    count: json["count"],
    image: json["image"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "count": count,
    "image": image,
    "selected": selected,
  };
}
