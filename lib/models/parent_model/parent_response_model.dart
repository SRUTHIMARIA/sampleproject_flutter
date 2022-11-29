
import 'dart:convert';

ParentResponseModel parentResponseModelFromJson(String str) => ParentResponseModel.fromJson(json.decode(str));

String parentResponseModelToJson(ParentResponseModel data) => json.encode(data.toJson());

class ParentResponseModel {
  ParentResponseModel({
    required this.phone,
    required this.name,
    required this.dob,
    required this.email,
    required this.relationship,
    required this.saveNextPage,
    required this.skip,
    required this.type,
  });

  final String phone;
  final String name;
  final String dob;
  final String email;
  final String relationship;
  final bool saveNextPage;
  final bool skip;
  final String type;

  factory ParentResponseModel.fromJson(Map<String, dynamic> json) => ParentResponseModel(
    phone: json["phone"] ?? '',
    name: json["name"] ?? '',
    dob: json["dob"] ?? '',
    email: json["email"]?? '',
    relationship: json["relationship"]?? '',
    saveNextPage: json["saveNextPage"]?? '',
    skip: json["skip"] ?? '',
    type: json["type"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "name": name,
    "dob": dob,
    "email": email,
    "relationship": relationship,
    "saveNextPage": saveNextPage,
    "skip": skip,
    "type": type,
  };
}


// class ParentResponseModel {
//   final String phone;
//   final String name;
//   final String dob;
//   final String email;
//   final String relationship;
//   bool? saveNextPage;
//   String? type;
//   bool? skip;
//
//   ParentResponseModel({
//     required this.phone,
//     required this.name,
//     required this.dob,
//     required this.email,
//     required this.relationship,
//     this.saveNextPage,
//     this.type,
//     this.skip,
//   });
//
//   Map<String, dynamic> toJson(){
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["phone"] = phone;
//     data["name"] = name;
//     data['dob'] = dob;
//     data['email'] = email;
//     data['relationship'] = relationship;
//     data['saveNextPage'] = saveNextPage;
//     data['type'] = type;
//     data['skip'] = skip;
//     return data;
//   }
// }
