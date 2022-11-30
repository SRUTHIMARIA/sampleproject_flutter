class ApiErrorResponseModel {
  ApiErrorResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
   // required this.paymentStatus,
    required this.errors,
  });

  bool status;
  int statusCode;
  String message;
  //String paymentStatus;
  List<String> errors;

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) => ApiErrorResponseModel(
    status: json['status'] ?? false,
    statusCode: json['statusCode'] ?? 404,
    message: json['message'] ?? 'Something went wrong.',
  //  paymentStatus: json['paymentStatus'] ?? '',
    errors: List<String>.from(json['errors'] ?? [].map((x) => x)).isEmpty
        ? []
        : List<String>.from(json['errors'].map((x) => x)),
  );
}






// class ApiErrorResponseModel {
//   ApiErrorResponseModel({
//     required this.payload,
//     required this.statusCode,
//     required this.success,
//     required this.statusMessage,
//   });
//
//   List<String> payload;
//   int statusCode;
//   bool success;
//   String statusMessage;
//
//   factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) => ApiErrorResponseModel(
//     payload: List<String>.from(json["payload"] ?? [].map((x) => x)).isEmpty
//         ? []
//         : List<String>.from(json["payload"] ?? [].map((x) => x)),
//     statusCode: json["statusCode"] ?? 404,
//     success: json["success"] ?? false,
//     statusMessage: json["statusMessage"] ?? ('Something went wrong.'),
//   );
// }