// To parse this JSON data, do
//
//     final addOrUpdateMedicalResponseModel = addOrUpdateMedicalResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SaveDoctorPermissionResponseModel saveDoctorPermissionResponseModelFromJson(String str) => SaveDoctorPermissionResponseModel.fromJson(json.decode(str));

String saveDoctorPermissionResponseModelToJson(SaveDoctorPermissionResponseModel data) => json.encode(data.toJson());

class SaveDoctorPermissionResponseModel {
  SaveDoctorPermissionResponseModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.saveNextPage,
    required this.skip,
  });

  final String name;
  final bool email;
  final String phone;
  final String saveNextPage;
  final String skip;

  factory SaveDoctorPermissionResponseModel.fromJson(Map<String, dynamic> json) => SaveDoctorPermissionResponseModel(
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


