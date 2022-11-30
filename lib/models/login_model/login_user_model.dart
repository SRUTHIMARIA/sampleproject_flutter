// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  final String email;
  final String password;
  final String deviceToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    email: json["email"] ?? '',
    password: json["password"] ?? '',
    deviceToken: json["device_token "] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_token ": deviceToken,
  };
}




// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class LoginUser {
//   String email;
//   String password;
//  String device_token;
//
//
//   LoginUser({
//     required this.email,
//     required this.password,
//    required this.device_token,
//
//   });
//
//   LoginUser.fromJson(Map<String, dynamic> json)
//       : email = json['email'],
//         password = json['password'],
//        device_token  = json['device_token '];
//
//
//   Map<String, dynamic> toJson() => {
//     'email': email,
//     'password': password,
//    'device_token ': device_token,
//
//   };
// }
