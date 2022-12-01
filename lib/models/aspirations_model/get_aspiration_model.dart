// To parse this JSON data, do
//
//     final getAspirationsModel = getAspirationsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAspirationsModel getAspirationsModelFromJson(String str) => GetAspirationsModel.fromJson(json.decode(str));

String getAspirationsModelToJson(GetAspirationsModel data) => json.encode(data.toJson());

class GetAspirationsModel {
  GetAspirationsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data? data;

  factory GetAspirationsModel.fromJson(Map<String, dynamic> json) => GetAspirationsModel(
    status: json["status"] ?? false,
    message: json["message"] ?? '',
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    required this.inSixMonths,
    required this.inTwelveMonths,
  });

  final String inSixMonths;
  final String inTwelveMonths;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    inSixMonths: json["in_six_months"] ?? '',
    inTwelveMonths: json["in_twelve_months"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "in_six_months": inSixMonths,
    "in_twelve_months": inTwelveMonths,
  };
}
