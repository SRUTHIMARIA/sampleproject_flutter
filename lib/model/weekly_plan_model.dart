class WeeklyPlanModel {
  String time;
  String title;
  String des;
  String category;
  String timeduration;

  WeeklyPlanModel({
    required this.time,
    required this.title,
    required this.des,
    required this.category,
    required this.timeduration,
  });
}

List<WeeklyPlanModel> weeklyPlan = [
  WeeklyPlanModel(
      time: '8.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '08:00 AM to 09:00 AM'),
  WeeklyPlanModel(time: '9.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Game',
      timeduration: '09:00 AM to 09:30 AM'),
  WeeklyPlanModel(time: '10.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '10:00 AM to 11:00 AM'),
  WeeklyPlanModel(time: '11.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '11:00 AM to 12:00 PM'),
  WeeklyPlanModel(time: '12.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '12:00 AM to 1:00 PM'),
  WeeklyPlanModel(time: '8.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '08:00 AM to 09:00 AM'),
  WeeklyPlanModel(time: '8.00 AM',
      title: 'Amet minim',
      des: 'Amet minim mollit non deserunt...',
      category: 'Training',
      timeduration: '08:00 AM to 09:00 AM'),
];
