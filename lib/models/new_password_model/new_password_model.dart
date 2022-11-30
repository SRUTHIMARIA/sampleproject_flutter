
// To parse this JSON data, do
//
//     final newPasswordModel = newPasswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewPasswordModel newPasswordModelFromJson(String str) => NewPasswordModel.fromJson(json.decode(str));

String newPasswordModelToJson(NewPasswordModel data) => json.encode(data.toJson());

class NewPasswordModel {
  NewPasswordModel({
    required this.password,
    required this.key,
    required this.passwordConfirmation,
  });

  final String password;
  final String key;
  final String passwordConfirmation;

  factory NewPasswordModel.fromJson(Map<String, dynamic> json) => NewPasswordModel(
    password: json["password"],
    key: json["key"],
    passwordConfirmation: json["password_confirmation"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "key": key,
    "password_confirmation": passwordConfirmation,
  };
}


// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class NewPasswordModel {
//   String? key;
//   String? password;
//   String? password_confirmation;
//
//   NewPasswordModel({
//     this.key,
//     this.password,
//     this.password_confirmation,
//   });
//
//   NewPasswordModel.fromJson(Map<String, dynamic> json)
//       : key = json['key'],
//         password = json['password'],
//         password_confirmation = json['password_confirmation'];
//
//   Map<String, dynamic> toJson() => {
//     'key': key,
//     'password': password,
//     'password_confirmation':password_confirmation,
//
//   };
// }
