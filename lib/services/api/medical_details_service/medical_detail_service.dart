import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/medical_detail_model/add_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/get_medical_details_model.dart';
import 'package:flutter_template/models/medical_detail_model/physio_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/save_doctor_model.dart';
import 'package:flutter_template/models/medical_detail_model/save_permission_model.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

import '../../../network/api_helper.dart';

class MedicalDetailService {
  static Future<ApiErrorResponseModel> medicalDetails(AddOrUpdateMedicalResponseModel addOrUpdateMedicalResponseModel) async {
    return await ApiHelper(url: AtheleteAssist.addMedicalDetails, body: addOrUpdateMedicalResponseModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<GetMedicalDetailsModel> getMedicalDetails() async {
    return await ApiHelper(
      url: AtheleteAssist.getMedicalDetails,).get((p0) => GetMedicalDetailsModel.fromJson(p0),
    );
  }


  static Future<ApiErrorResponseModel> physicalMedicalInfo(PhysioOrMedicalResponseModel physioOrMedicalResponseModel) async {
    return await ApiHelper(url: AtheleteAssist.physicalOrMedical, body: physioOrMedicalResponseModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<ApiErrorResponseModel> savePermissionInfo(SavePermissionResponseModel savePermissionResponseModel) async {
    return await ApiHelper(url: AtheleteAssist.savePostPermission, body: savePermissionResponseModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }

  static Future<LoginSuccessModel> saveDoctorInfo(SaveDoctorResponseModel saveDoctorResponseModel) async {
    return await ApiHelper(url: AtheleteAssist.saveDoctor, body: saveDoctorResponseModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }
}
