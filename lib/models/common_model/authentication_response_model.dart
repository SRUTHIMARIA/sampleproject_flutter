class AuthenticationResponseModel {
  AuthenticationResponseModel({
    required this.payload,
    required this.statusCode,
    required this.success,
    required this.statusMessage,
  });

  final _Payload payload;
  final int statusCode;
  final bool success;
  final String statusMessage;

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) => AuthenticationResponseModel(
    payload: (json["payload"] == null)
        ? _Payload(fullName: "", token: "", quickBloxId: 0)
        : _Payload.fromJson(json["payload"]),
    statusCode: json["statusCode"] ?? 0,
    success: json["success"] ?? false,
    statusMessage: json["statusMessage"] ?? "Error",
  );
}

class _Payload {
  _Payload({
    required this.fullName,
    required this.token,
    required this.quickBloxId,
  });

  final String fullName;
  final String token;
  final int quickBloxId;

  factory _Payload.fromJson(Map<String, dynamic> json) => _Payload(
    fullName: json["full_name"] ?? "",
    token: json["token"] ?? "",
    quickBloxId: json["quick_blox_user_id"] ?? 0,
  );
}