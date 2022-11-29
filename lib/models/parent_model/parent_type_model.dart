import 'dart:convert';

ParentTypeModel parentTypeModelFromJson(String str) => ParentTypeModel.fromJson(json.decode(str));

String parentTypeModelToJson(ParentTypeModel data) => json.encode(data.toJson());

class ParentTypeModel {
  ParentTypeModel({
    required this.type,
  });

  String type;

  factory ParentTypeModel.fromJson(Map<String, dynamic> json) => ParentTypeModel(
        type: json['type'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'type': type,
      };
}
