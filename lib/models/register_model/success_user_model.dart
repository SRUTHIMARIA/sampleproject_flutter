import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SuccessUser {
  bool success;
  String message;
  String token;

  SuccessUser({ required this.success, required this.message, required this.token});


  SuccessUser.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        token = json['token'];



  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
    'token' : token,
  };
}