import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterUser {
  String? email;
  String? password;
  String? first_name;
  String? last_name;

  RegisterUser({
    this.email,
    this.password,
    this.first_name,
    this.last_name,
  });

  RegisterUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        first_name = json['first_name'],
        last_name = json['last_name'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
      };
}
