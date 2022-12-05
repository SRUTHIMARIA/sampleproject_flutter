
import 'dart:convert';

SaveAgeStudentsModel saveAgeStudentsModelFromJson(String str) => SaveAgeStudentsModel.fromJson(json.decode(str));

String saveAgeStudentsModelToJson(SaveAgeStudentsModel data) => json.encode(data.toJson());

class SaveAgeStudentsModel {
  SaveAgeStudentsModel({
    required this.age,
    required this.saveNextPage,
  });

  final String age;
  final bool saveNextPage;

  factory SaveAgeStudentsModel.fromJson(Map<String, dynamic> json) => SaveAgeStudentsModel(
    age: json["age"] ?? '',
    saveNextPage: json["saveNextPage"]?? false,
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "saveNextPage": saveNextPage,
  };
}
