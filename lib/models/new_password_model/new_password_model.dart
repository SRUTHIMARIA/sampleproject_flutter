import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NewPasswordModel {
  String? key;
  String? newPassword;
  String? confirm;

  NewPasswordModel({
    this.key,
    this.newPassword,
    this.confirm,
  });

  NewPasswordModel.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        newPassword = json['newPassword'],
        confirm = json['confirm'];

  Map<String, dynamic> toJson() => {
    'key': key,
    'newPassword': newPassword,
    'confirm':confirm,

  };
}
