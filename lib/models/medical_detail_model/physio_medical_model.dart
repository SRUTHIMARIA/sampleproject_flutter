// To parse this JSON data, do
//
//     final addOrUpdateMedicalResponseModel = addOrUpdateMedicalResponseModelFromJson(jsonString);

import 'dart:convert';

PhysioOrMedicalResponseModel addOrUpdateMedicalResponseModelFromJson(String str) => PhysioOrMedicalResponseModel.fromJson(json.decode(str));

String addOrUpdateMedicalResponseModelToJson(PhysioOrMedicalResponseModel data) => json.encode(data.toJson());

class PhysioOrMedicalResponseModel {
  PhysioOrMedicalResponseModel({
    required this.info,
    required this.saveNextPage,
    required this.details,
  });

  final String info;
  final bool saveNextPage;
  final String details;

  factory PhysioOrMedicalResponseModel.fromJson(Map<String, dynamic> json) => PhysioOrMedicalResponseModel(
    info: json["info"],
    saveNextPage: json["saveNextPage"],
    details: json["details"],

  );

  Map<String, dynamic> toJson() => {
    "info": info,
    "saveNextPage": saveNextPage,
    "details": details,
  };
}


