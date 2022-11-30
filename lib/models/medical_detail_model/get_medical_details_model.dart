import 'dart:convert';

GetMedicalDetailsModel getMedicalDetailsModelFromJson(String str) => GetMedicalDetailsModel.fromJson(json.decode(str));

String getMedicalDetailsModelToJson(GetMedicalDetailsModel data) => json.encode(data.toJson());

class GetMedicalDetailsModel {
  GetMedicalDetailsModel({
    required this.params,
  });

  String params;

  factory GetMedicalDetailsModel.fromJson(Map<String, dynamic> json) => GetMedicalDetailsModel(
    params: json['params'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'type': params,
  };
}
