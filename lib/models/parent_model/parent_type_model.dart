// To parse this JSON data, do
//
//     final parentTypeModel = parentTypeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ParentTypeModel parentTypeModelFromJson(String str) => ParentTypeModel.fromJson(json.decode(str));

String parentTypeModelToJson(ParentTypeModel data) => json.encode(data.toJson());

class ParentTypeModel {
  ParentTypeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Data> data;

  factory ParentTypeModel.fromJson(Map<String, dynamic> json) => ParentTypeModel(
    status: json["status"],
    message: json["message"],
    data: json["data"]==null? [] :List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.name,
    required this.dob,
    required this.phone,
    required this.relation,
    required this.email,
  });

  final String name;
  final DateTime dob;
  final String phone;
  final String relation;
  final String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    dob: DateTime.parse(json["dob"]),
    phone: json["phone"],
    relation: json["relation"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "relation": relation,
    "email": email,
  };
}
