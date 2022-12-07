// // To parse this JSON data, do
// //

/// my_values : "test"
/// motivated_by : "test"
/// saveNextPage : true
/// inspired_by : [{"key":"","image_id":"1","name":"2","description":"2"}]

class InspirationsPostParams {
  InspirationsPostParams({
    String? myValues,
    String? motivatedBy,
    bool? saveNextPage,
    List<InspiredBy>? inspiredBy,
  }) {
    _myValues = myValues;
    _motivatedBy = motivatedBy;
    _saveNextPage = saveNextPage;
    _inspiredBy = inspiredBy;
  }

  InspirationsPostParams.fromJson(dynamic json) {
    _myValues = json['my_values'];
    _motivatedBy = json['motivated_by'];
    _saveNextPage = json['saveNextPage'];
    if (json['inspired_by'] != null) {
      _inspiredBy = [];
      json['inspired_by'].forEach((v) {
        _inspiredBy!.add(InspiredBy.fromJson(v));
      });
    }
  }

  String? _myValues;
  String? _motivatedBy;
  bool? _saveNextPage;
  List<InspiredBy>? _inspiredBy;

  String? get myValues => _myValues;

  String? get motivatedBy => _motivatedBy;

  bool? get saveNextPage => _saveNextPage;

  List<InspiredBy>? get inspiredBy => _inspiredBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['my_values'] = _myValues;
    map['motivated_by'] = _motivatedBy;
    map['saveNextPage'] = _saveNextPage;
    if (_inspiredBy != null) {
      map['inspired_by'] = _inspiredBy!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// image_id : "1"
/// name : "2"
/// description : "2"

class InspiredBy {
  InspiredBy({
    String? imageId,
    String? name,
    String? description,
  }) {
    _imageId = imageId;
    _name = name;
    _description = description;
  }

  InspiredBy.fromJson(dynamic json) {
    _imageId = json['image_id'];
    _name = json['name'];
    _description = json['description'];
  }

  String? _imageId;
  String? _name;
  String? _description;

  String? get imageId => _imageId;

  String? get name => _name;

  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_id'] = _imageId;
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }
}

// //     final selfEvalutionModel = selfEvalutionModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SelfEvaluationModel selfEvalutionModelFromJson(String str) => SelfEvaluationModel.fromJson(json.decode(str));
//
// String selfEvalutionModelToJson(SelfEvaluationModel data) => json.encode(data.toJson());
//
// class SelfEvaluationModel {
//   SelfEvaluationModel({
//     required this.myValues,
//     required this.motivatedBy,
//     required this.saveNextPage,
//     required this.inspiredBy,
//   });
//
//   final String myValues;
//   final String motivatedBy;
//   final bool saveNextPage;
//   final List<dynamic> inspiredBy;
//
//   factory SelfEvaluationModel.fromJson(Map<String, dynamic> json) => SelfEvaluationModel(
//     myValues: json["my_values"] ?? '',
//     motivatedBy: json["motivated_by"]??'',
//     saveNextPage: json["saveNextPage"] ??'',
//     inspiredBy: json["data"]==null? [] :List<dynamic>.from(json["inspired_by"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "my_values": myValues,
//     "motivated_by": motivatedBy,
//     "saveNextPage": saveNextPage,
//     "inspired_by": List<dynamic>.from(inspiredBy.map((x) => x)),
//   };
// }
