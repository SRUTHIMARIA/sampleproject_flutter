// To parse this JSON data, do
//
//     final getFeedbackModel = getFeedbackModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetStudentFeedbackModel getStudentFeedbackModelFromJson(String str) => GetStudentFeedbackModel.fromJson(json.decode(str));

String getStudentFeedbackModelToJson(GetStudentFeedbackModel data) => json.encode(data.toJson());

class GetStudentFeedbackModel {
  GetStudentFeedbackModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final String data;

  factory GetStudentFeedbackModel.fromJson(Map<String, dynamic> json) => GetStudentFeedbackModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
