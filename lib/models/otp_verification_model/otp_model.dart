
// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
     required this.key,
    required this.otp,
  });

   String key;
  final String otp;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    key: json["key"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "otp": otp,
  };
}



// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class OtpModel {
//   int? key;
//   String? otp;
//
//   OtpModel({
//     this.key,
//     this.otp,
//   });
//
//   OtpModel.fromJson(Map<String, dynamic> json) : key = json['key'],otp = json['otp'];
//
//   Map<String, dynamic> toJson() => {
//     'key': key,
//     'otp': otp,
//   };
// }
