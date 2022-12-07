import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/medical_detail_model/add_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/get_medical_details_model.dart';
import 'package:flutter_template/models/medical_detail_model/physio_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/save_doctor_model.dart';
import 'package:flutter_template/models/medical_detail_model/save_permission_model.dart';
import 'package:flutter_template/models/self_evaluation_model/self_evaluation_model.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

import '../../../models/self_evaluation_model/get_selfevaluation.dart';
import '../../../network/api_helper.dart';

class SelfEvaluationService {
  static Future<ApiErrorResponseModel> selfEvaluationInfo(InspirationsPostParams inspirationsPostParams) async {
    return await ApiHelper(url: AtheleteAssist.selfEvaluation, body: inspirationsPostParams.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<GetSelfEvalutionModel> getSelfEvaluationInfo() async {
    return await ApiHelper(
      url: AtheleteAssist.getSelfEvaluation,).get((p0) => GetSelfEvalutionModel.fromJson(p0),
    );
  }
}