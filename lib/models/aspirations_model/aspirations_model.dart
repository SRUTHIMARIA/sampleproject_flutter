// To parse this JSON data, do
//
//     final aspirationsModel = aspirationsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AspirationsModel aspirationsModelFromJson(String str) => AspirationsModel.fromJson(json.decode(str));

String aspirationsModelToJson(AspirationsModel data) => json.encode(data.toJson());

class AspirationsModel {
  AspirationsModel({
    required this.inSixMonths,
    required this.saveNextPage,
    required this.inTwelveMonths,
  });

  final String inSixMonths;
  final bool saveNextPage;
  final String inTwelveMonths;

  factory AspirationsModel.fromJson(Map<String, dynamic> json) => AspirationsModel(
    inSixMonths: json["in_six_months"] ?? '',
    saveNextPage: json["saveNextPage"] ?? '',
    inTwelveMonths: json["in_twelve_months"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "in_six_months": inSixMonths,
    "saveNextPage": saveNextPage,
    "in_twelve_months": inTwelveMonths,
  };
}
