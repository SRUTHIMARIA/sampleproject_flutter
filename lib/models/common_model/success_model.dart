import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SuccessModel {
  int? status;
  String? message;
  int? key;

  SuccessModel({ this.status, this.message, this.key});

  SuccessModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        key = json['key'];

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'key' : key,
  };
}