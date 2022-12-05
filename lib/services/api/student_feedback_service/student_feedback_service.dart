
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/student_feedback_model/get_student_feedbacks_model.dart';
import 'package:flutter_template/models/student_feedback_model/student_feedback_model.dart';

import '../../../network/api_helper.dart';
import '../../endpoints/endpoints.dart';

class StudentFeedbackService {

  static Future<ApiErrorResponseModel> studentFeedbackInfo(StudentFeedbackModel studentFeedbackModel) async {
    return await ApiHelper(url: AtheleteAssist.saveStudentFeedback, body: studentFeedbackModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<GetStudentFeedbackModel> getStudentFeedbackInfo() async {
    return await ApiHelper(url: AtheleteAssist.getStudentFeedback).get((p0) => GetStudentFeedbackModel.fromJson(p0));
  }


}
