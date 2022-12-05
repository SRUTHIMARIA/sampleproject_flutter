// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StudentFeedbackModel studentFeedbackModelFromJson(String str) => StudentFeedbackModel.fromJson(json.decode(str));

String studentFeedbackModelToJson(StudentFeedbackModel data) => json.encode(data.toJson());

class StudentFeedbackModel {
  StudentFeedbackModel({
    required this.feedback,
    required this.saveNextPage,
  });

  final String feedback;
  final bool saveNextPage;

  factory StudentFeedbackModel.fromJson(Map<String, dynamic> json) => StudentFeedbackModel(
    feedback: json["feedback"] ?? '',
    saveNextPage: json["saveNextPage"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "feedback": feedback,
    "saveNextPage": saveNextPage,
  };
}
