// To parse this JSON data, do
//
//     final sportsListModel = sportsListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SportsListModel sportsListModelFromJson(String str) => SportsListModel.fromJson(json.decode(str));

String sportsListModelToJson(SportsListModel data) => json.encode(data.toJson());

class SportsListModel {
  SportsListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory SportsListModel.fromJson(Map<String, dynamic> json) => SportsListModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.selected,
  });

  final int id;
  final String name;
  final String image;
  final bool selected;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "selected": selected,
  };
}
