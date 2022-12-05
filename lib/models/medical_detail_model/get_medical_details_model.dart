// To parse this JSON data, do
//
//     final getMedicalDetailsModel = getMedicalDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMedicalDetailsModel getMedicalDetailsModelFromJson(String str) => GetMedicalDetailsModel.fromJson(json.decode(str));

String getMedicalDetailsModelToJson(GetMedicalDetailsModel data) => json.encode(data.toJson());

class GetMedicalDetailsModel {
  GetMedicalDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<dynamic> data;

  factory GetMedicalDetailsModel.fromJson(Map<String, dynamic> json) => GetMedicalDetailsModel(
    status: json["status"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}




// import 'dart:convert';
//
// GetMedicalDetailsModel getMedicalDetailsModelFromJson(String str) => GetMedicalDetailsModel.fromJson(json.decode(str));
//
// String getMedicalDetailsModelToJson(GetMedicalDetailsModel data) => json.encode(data.toJson());
//
// class GetMedicalDetailsModel {
//   GetMedicalDetailsModel({
//     required this.params,
//   });
//
//   String params;
//
//   factory GetMedicalDetailsModel.fromJson(Map<String, dynamic> json) => GetMedicalDetailsModel(
//     params: json['params'] ?? '',
//   );
//
//   Map<String, dynamic> toJson() => {
//     'type': params,
//   };
// }
