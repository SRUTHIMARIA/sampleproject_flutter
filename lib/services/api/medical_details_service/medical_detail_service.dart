import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/medical_detail_model/add_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/get_medical_details_model.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

import '../../../network/api_helper.dart';

class MedicalDetailService {
  static Future<ApiErrorResponseModel> medicalDetails(AddOrUpdateMedicalResponseModel addOrUpdateMedicalResponseModel) async {
    return await ApiHelper(url: AthleteAssist.addMedicalDetails, body: addOrUpdateMedicalResponseModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<ApiErrorResponseModel> getMedicalDetails(GetMedicalDetailsModel getMedicalDetailsModel) async {
    return await ApiHelper(
      url: '${AthleteAssist.getMedicalDetails}$getMedicalDetailsModel',).get((p0) => ApiErrorResponseModel.fromJson(p0),
    );
  }
}
