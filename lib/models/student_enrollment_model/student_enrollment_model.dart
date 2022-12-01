// To parse this JSON data, do
//
//     final studentEnrollmentModel = studentEnrollmentModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StudentEnrollmentModel studentEnrollmentModelFromJson(String str) => StudentEnrollmentModel.fromJson(json.decode(str));

String studentEnrollmentModelToJson(StudentEnrollmentModel data) => json.encode(data.toJson());

class StudentEnrollmentModel {
  StudentEnrollmentModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory StudentEnrollmentModel.fromJson(Map<String, dynamic> json) => StudentEnrollmentModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    @required this.nextPage,
  });

  final dynamic nextPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "nextPage": nextPage,
  };
}
