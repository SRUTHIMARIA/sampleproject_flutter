// To parse this JSON data, do
//
//     final selfEvalutionModel = selfEvalutionModelFromJson(jsonString);

import 'dart:convert';

SelfEvaluationModel selfEvalutionModelFromJson(String str) => SelfEvaluationModel.fromJson(json.decode(str));

String selfEvalutionModelToJson(SelfEvaluationModel data) => json.encode(data.toJson());

class SelfEvaluationModel {
  SelfEvaluationModel({
    required this.myValues,
    required this.motivatedBy,
    required this.saveNextPage,
    required this.inspiredBy,
  });

  final String myValues;
  final String motivatedBy;
  final bool saveNextPage;
  final List<dynamic> inspiredBy;

  factory SelfEvaluationModel.fromJson(Map<String, dynamic> json) => SelfEvaluationModel(
    myValues: json["my_values"] ?? '',
    motivatedBy: json["motivated_by"]??'',
    saveNextPage: json["saveNextPage"] ??'',
    inspiredBy: json["data"]==null? [] :List<dynamic>.from(json["inspired_by"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "my_values": myValues,
    "motivated_by": motivatedBy,
    "saveNextPage": saveNextPage,
    "inspired_by": List<dynamic>.from(inspiredBy.map((x) => x)),
  };
}
