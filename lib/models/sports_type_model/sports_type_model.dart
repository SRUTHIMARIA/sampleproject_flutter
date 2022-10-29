class SportsTypeModel {
  SportsTypeModel({
    required this.id,
    required this.sportsType,
    required this.imageUrl,
    this.selected = false,
  });

  int id;
  String sportsType;
  String imageUrl;
  bool selected;
  factory SportsTypeModel.fromJson(Map<String, dynamic> json) =>
      SportsTypeModel(
        id: json["id"] ?? 0,
        sportsType: json["sportsType"] ?? "",
        imageUrl: json["coach_image_path"] ?? "",

      );
}
