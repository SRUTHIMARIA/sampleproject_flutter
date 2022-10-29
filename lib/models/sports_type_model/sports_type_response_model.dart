// To parse this JSON data, do
//
//     final sportsTypeModel = sportsTypeModelFromJson(jsonString);


import 'dart:convert';

SportsTypeModel sportsTypeModelFromJson(String str) => SportsTypeModel.fromJson(json.decode(str));

String sportsTypeModelToJson(SportsTypeModel data) => json.encode(data.toJson());

class SportsTypeModel {
  SportsTypeModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final bool status;
  final List<Datum> data;

  factory SportsTypeModel.fromJson(Map<String, dynamic> json) => SportsTypeModel(
    message: json["message"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.sportsType,
    required this.imageUrl,
    required this.selected,
  });

  final int id;
  final String sportsType;
  final String imageUrl;
  final bool selected;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sportsType: json["sportsType"],
    imageUrl: json["imageUrl"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sportsType": sportsType,
    "imageUrl": imageUrl,
    "selected": selected,
  };
}
