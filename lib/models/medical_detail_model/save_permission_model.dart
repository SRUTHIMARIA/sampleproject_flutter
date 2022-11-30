// To parse this JSON data, do
//
//     final addOrUpdateMedicalResponseModel = addOrUpdateMedicalResponseModelFromJson(jsonString);

import 'dart:convert';

SavePermissionResponseModel savePermissionResponseModelFromJson(String str) => SavePermissionResponseModel.fromJson(json.decode(str));

String savePermissionResponseModelToJson(SavePermissionResponseModel data) => json.encode(data.toJson());

class SavePermissionResponseModel {
  SavePermissionResponseModel({
    required this.permission_status,
    required this.saveNextPage,
  });

  final String permission_status;
  final bool saveNextPage;


  factory SavePermissionResponseModel.fromJson(Map<String, dynamic> json) => SavePermissionResponseModel(
    permission_status: json["permission_status"],
    saveNextPage: json["saveNextPage"],


  );

  Map<String, dynamic> toJson() => {
    "permission_status": permission_status,
    "saveNextPage": saveNextPage,
  };
}


