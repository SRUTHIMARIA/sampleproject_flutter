import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ParentTypeModel{
  String? type;


  ParentTypeModel({this.type});

  ParentTypeModel.fromJson(Map<String, dynamic> json)
      :type = json['type'];

  Map<String, dynamic> toJson() => {

    'type' : type,

  };
}