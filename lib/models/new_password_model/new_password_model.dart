import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NewPasswordModel {
  String? key;
  String? password;
  String? password_confirmation;

  NewPasswordModel({
    this.key,
    this.password,
    this.password_confirmation,
  });

  NewPasswordModel.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        password = json['password'],
        password_confirmation = json['password_confirmation'];

  Map<String, dynamic> toJson() => {
    'key': key,
    'password': password,
    'password_confirmation':password_confirmation,

  };
}
