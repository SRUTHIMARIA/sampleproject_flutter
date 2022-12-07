// To parse this JSON data, do
//
//     final getSelfEvalutionModel = getSelfEvalutionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetSelfEvalutionModel getSelfEvalutionModelFromJson(String str) => GetSelfEvalutionModel.fromJson(json.decode(str));

String getSelfEvalutionModelToJson(GetSelfEvalutionModel data) => json.encode(data.toJson());

class GetSelfEvalutionModel {
  GetSelfEvalutionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory GetSelfEvalutionModel.fromJson(Map<String, dynamic> json) => GetSelfEvalutionModel(
    status: json["status"] ?? false,
    message: json["message"]?? '',
    data:
    // json['data'] == null
    //     ? Data.fromJson(json["data"]),

       Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.motivatedBy,
    required this.myValues,
    required this.inspiredBy,
  });

  final String motivatedBy;
  final String myValues;
  final List<dynamic> inspiredBy;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    motivatedBy: json["motivated_by"] ?? '',
    myValues: json["my_values"]?? '',
    inspiredBy: json["data"]==null? [] :List<dynamic>.from(json["inspired_by"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "motivated_by": motivatedBy,
    "my_values": myValues,
    "inspired_by": List<dynamic>.from(inspiredBy.map((x) => x)),
  };
}
