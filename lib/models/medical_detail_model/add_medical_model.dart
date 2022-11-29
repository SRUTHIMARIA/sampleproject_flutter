// To parse this JSON data, do
//
//     final addOrUpdateMedicalResponseModel = addOrUpdateMedicalResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddOrUpdateMedicalResponseModel addOrUpdateMedicalResponseModelFromJson(String str) => AddOrUpdateMedicalResponseModel.fromJson(json.decode(str));

String addOrUpdateMedicalResponseModelToJson(AddOrUpdateMedicalResponseModel data) => json.encode(data.toJson());

class AddOrUpdateMedicalResponseModel {
  AddOrUpdateMedicalResponseModel({
    required this.moreDetail,
    required this.saveNextPage,
    required this.type,
    required this.detail,
    required this.protocol,
  });

  final String moreDetail;
  final bool saveNextPage;
  final String type;
  final String detail;
  final String protocol;

  factory AddOrUpdateMedicalResponseModel.fromJson(Map<String, dynamic> json) => AddOrUpdateMedicalResponseModel(
    moreDetail: json["more_detail"],
    saveNextPage: json["saveNextPage"],
    type: json["type"],
    detail: json["detail"],
    protocol: json["protocol"],
  );

  Map<String, dynamic> toJson() => {
    "more_detail": moreDetail,
    "saveNextPage": saveNextPage,
    "type": type,
    "detail": detail,
    "protocol": protocol,
  };
}


