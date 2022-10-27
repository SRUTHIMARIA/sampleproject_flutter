import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OtpModel {
  int? key;
  int? otp;

  OtpModel({
    this.key,
    this.otp,
  });

  OtpModel.fromJson(Map<String, dynamic> json) : key = json['key'],otp = json['otp'];

  Map<String, dynamic> toJson() => {
    'key': key,
    'otp': otp,
  };
}
