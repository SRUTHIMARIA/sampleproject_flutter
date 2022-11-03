class ApiErrorResponseModel {
  ApiErrorResponseModel({
    required this.payload,
    required this.statusCode,
    required this.success,
    required this.statusMessage,
  });

  List<String> payload;
  int statusCode;
  bool success;
  String statusMessage;

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) => ApiErrorResponseModel(
    payload: List<String>.from(json["payload"] ?? [].map((x) => x)).isEmpty
        ? []
        : List<String>.from(json["payload"] ?? [].map((x) => x)),
    statusCode: json["statusCode"] ?? 404,
    success: json["success"] ?? false,
    statusMessage: json["statusMessage"] ?? ('Something went wrong.'),
  );
}