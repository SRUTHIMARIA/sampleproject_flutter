import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ForgotPassword {
  String? email;

  ForgotPassword({
    this.email,
  });

  ForgotPassword.fromJson(Map<String, dynamic> json) : email = json['email'];

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
