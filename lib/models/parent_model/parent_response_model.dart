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
//   factory ParentResponseModel.toJson(Map<String, dynamic> json) {
//     return ParentResponseModel(
//       phone: json['phone'],
//       name: json['name'],
//       dob: json['dob'],
//       email: json['email'],
//       relationship: json['relationship'],
//       saveNextPage: json['saveNextPage'],
//       type: json['type'],
//       skip: json['skip'],
//     );
//   }
// }


class ParentResponseModel {
  final String phone;
  final String name;
  final String dob;
  final String email;
  final String relationship;
  bool? saveNextPage;
  String? type;
  bool? skip;

  ParentResponseModel({
    required this.phone,
    required this.name,
    required this.dob,
    required this.email,
    required this.relationship,
    this.saveNextPage,
    this.type,
    this.skip,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = phone;
    data["name"] = name;
    data['dob'] = dob;
    data['email'] = email;
    data['relationship'] = relationship;
    data['saveNextPage'] = saveNextPage;
    data['type'] = type;
    data['skip'] = skip;
    return data;
  }
}
