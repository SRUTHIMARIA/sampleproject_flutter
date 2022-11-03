import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SuccessModel {
  int status;
  String message;
  int key;

  SuccessModel({ required this.status, required this.message, required this.key});

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