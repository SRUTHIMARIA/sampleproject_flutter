// To parse this JSON data, do
//
//     final getAgeStudentsModel = getAgeStudentsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAgeStudentsModel getAgeStudentsModelFromJson(String str) => GetAgeStudentsModel.fromJson(json.decode(str));

String getAgeStudentsModelToJson(GetAgeStudentsModel data) => json.encode(data.toJson());

class GetAgeStudentsModel {
  GetAgeStudentsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final String data;

  factory GetAgeStudentsModel.fromJson(Map<String, dynamic> json) => GetAgeStudentsModel(
    status: json["status"],
    message: json["message"] ?? '',
    data: json["data"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
