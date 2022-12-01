import 'package:flutter_template/models/common_model/api_error_response_model.dart';

import 'package:flutter_template/models/student_enrollment_model/student_enrollment_model.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

import '../../../network/api_helper.dart';

class StudentEnrollmentService {
  static Future<ApiErrorResponseModel> getStudentEnrollment(StudentEnrollmentModel studentEnrollmentModel) async {
    return await ApiHelper(
      url: AtheleteAssist.studentEnrollment,).get((p0) => ApiErrorResponseModel.fromJson(p0),
    );
  }
}
