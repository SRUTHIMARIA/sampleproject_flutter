class MedicalResponseModel {
  final String moreDetail;
  final String detail;
  final String protocol;
  bool? saveNextPage;
  String? type;

  MedicalResponseModel({
    required this.moreDetail,
    required this.detail,
    required this.protocol,
    this.saveNextPage,
    this.type,
  });

  factory MedicalResponseModel.fromJson(Map<String, dynamic> json) => MedicalResponseModel(
    moreDetail: json["moreDetail"],
    detail: json["detail"],
    protocol: json["protocol"],
    saveNextPage: json["saveNextPage"],
    type:json["type"],
  );
}


