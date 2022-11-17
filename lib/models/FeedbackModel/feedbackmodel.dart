
class FeedbackModel {
  final String session;
  final String time;
  final String message;

  FeedbackModel({
    required this.session,
    required this.time,
    required this.message,
  });
}

final List<FeedbackModel> feedbacks = [
  FeedbackModel(
    session: 'Self analysis notes',
    time: '07:30AM',
    message: 'Amet minim mollit non deserunt...',
  ),
  FeedbackModel(
    session: 'Daily reflection',
    time: '07:30AM',
    message: 'Amet minim mollit non deserunt...',
  ),
  FeedbackModel(
    session: 'Weekly review',
    time: '07:30AM',
    message: 'Feedback from James...',
  ),


];

final List<FeedbackModel> feedbackModel = [
  FeedbackModel(
    session: 'Self analysis notes',
    time: '07:30AM',
    message: 'Amet minim mollit non deserunt...',
  ),



];

final List<FeedbackModel> feedbackLastDays = [
  FeedbackModel(
    session: 'Weekly review',
    time: '07:30AM',
    message: 'Amet minim mollit non deserunt...',
  ),



];


