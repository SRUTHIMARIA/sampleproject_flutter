import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginUser {
  String? email;
  String? password;
  String? device_token;


  LoginUser({
    this.email,
    this.password,
    this.device_token,

  });

  LoginUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        device_token  = json['device_token '];


  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'device_token ': device_token,

  };
}
