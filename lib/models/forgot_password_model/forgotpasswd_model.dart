import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ForgotPasswordModel {
  String? email;

  ForgotPasswordModel({
    this.email,
  });

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) : email = json['email'];

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
