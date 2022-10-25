class WeeklyReviewModel{
  final String category_name;
  WeeklyReviewModel(this.category_name);
}

class WeeklyReviewDetail{
  static final weeklycategories=[
    WeeklyReviewModel("Sports"),
    WeeklyReviewModel("Family"),
    WeeklyReviewModel("Health"),
    WeeklyReviewModel("Hobbies"),
    WeeklyReviewModel("Confidence"),
    WeeklyReviewModel("Preparation"),
    WeeklyReviewModel("Stress"),



  ];
}