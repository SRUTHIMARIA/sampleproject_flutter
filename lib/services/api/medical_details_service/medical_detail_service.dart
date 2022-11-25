import 'package:flutter_template/models/common_model/success_model.dart';
import 'package:flutter_template/models/medical_detail_model/add_medical_model.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

import '../../../network/api_helper.dart';

class MedicalDetailService {
  static Future<SuccessModel> getMedicalDetails(MedicalResponseModel model) async {
    return await ApiHelper(url: AthleteAssist.addMedicalDetails).patch((p0) {
      return MedicalResponseModel.fromJson(p0);
    });
  }

}
