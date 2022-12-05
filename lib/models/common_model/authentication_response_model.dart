// class AuthenticationResponseModel {

// To parse this JSON data, do
//
//     final SignUpModel = SignUpModelFromJson(jsonString);


// To parse this JSON data, do
//
//     final loginSuccessModel = loginSuccessModelFromJson(jsonString);

import 'package:meta/meta.dart';




class LoginSuccessModel {
  LoginSuccessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
    status: json["status"],
    message: json["message"] ?? '',
    data:  Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.token,
  });

  final String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

//
//
//
// class LoginSuccessModel {
//   LoginSuccessModel({
//     required this.status,
//     required this.statusCode,
//     required this.message,
//     required this.token,
//     required this.id,
//   });
//
//   bool status;
//   int statusCode;
//   String message;
//   String token;
//   int id;
//
//   factory LoginSuccessModel.fromJson(Map<String, dynamic> json) => LoginSuccessModel(
//     status: json['status'] ?? false,
//     statusCode: json['statusCode'] ?? 400,
//     message: json['message'] ?? '',
//     token: json['token'] ?? '',
//     id: json['id'] ?? 0,
//   );
//
//   Map<String, dynamic> toJson() => {
//     'status': status,
//     'statusCode': statusCode,
//     'message': message,
//     'token': token,
//     'id': id,
//   };
// }




//   AuthenticationResponseModel({
//     required this.payload,
//     required this.statusCode,
//     required this.success,
//     required this.statusMessage,
//   });
//
//   final _Payload payload;
//   final int statusCode;
//   final bool success;
//   final String statusMessage;
//
//   factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) => AuthenticationResponseModel(
//     payload: (json["payload"] == null)
//         ? _Payload(fullName: "", token: "", quickBloxId: 0)
//         : _Payload.fromJson(json["payload"]),
//     statusCode: json["statusCode"] ?? 0,
//     success: json["success"] ?? false,
//     statusMessage: json["statusMessage"] ?? "Error",
//   );
// }
//
// class _Payload {
//   _Payload({
//     required this.fullName,
//     required this.token,
//     required this.quickBloxId,
//   });
//
//   final String fullName;
//   final String token;
//   final int quickBloxId;
//
//   factory _Payload.fromJson(Map<String, dynamic> json) => _Payload(
//     fullName: json["full_name"] ?? "",
//     token: json["token"] ?? "",
//     quickBloxId: json["quick_blox_user_id"] ?? 0,
//   );
// }
