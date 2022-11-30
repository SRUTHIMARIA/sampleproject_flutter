// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
  });

  final String email;
  final String password;
  final String first_name;
  final String last_name;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    email: json["email"] ?? '',
    password: json["password"] ?? '',
    first_name: json["first_name"] ?? '',
    last_name: json["last_name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "first_name": first_name,
    "last_name": last_name,
  };
}




// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class RegisterUser {
//   String? email;
//   String? password;
//   String? first_name;
//   String? last_name;
//
//   RegisterUser({
//     this.email,
//     this.password,
//     this.first_name,
//     this.last_name,
//   });
//
//   RegisterUser.fromJson(Map<String, dynamic> json)
//       : email = json['email'],
//         password = json['password'],
//         first_name = json['first_name'],
//         last_name = json['last_name'];
//
//   Map<String, dynamic> toJson() => {
//         'email': email,
//         'password': password,
//         'first_name': first_name,
//         'last_name': last_name,
//       };
// }
