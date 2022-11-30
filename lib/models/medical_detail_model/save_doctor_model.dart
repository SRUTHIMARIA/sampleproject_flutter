// To parse this JSON data, do
//
//     final addOrUpdateMedicalResponseModel = addOrUpdateMedicalResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SaveDoctorResponseModel saveDoctorResponseModelFromJson(String str) => SaveDoctorResponseModel.fromJson(json.decode(str));

String saveDoctorResponseModelToJson(SaveDoctorResponseModel data) => json.encode(data.toJson());

class SaveDoctorResponseModel {
  SaveDoctorResponseModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.saveNextPage,
    required this.skip,
  });

  final String name;
  final String email;
  final String phone;
  final bool saveNextPage;
  final bool skip;

  factory SaveDoctorResponseModel.fromJson(Map<String, dynamic> json) => SaveDoctorResponseModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    saveNextPage: json["saveNextPage"],
    skip: json["skip"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "saveNextPage": saveNextPage,
    "skip": skip,
  };
}


