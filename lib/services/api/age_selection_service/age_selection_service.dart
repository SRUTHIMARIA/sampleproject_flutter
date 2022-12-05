import 'package:flutter_template/models/age_selection_model/age_selection_save_model.dart';
import 'package:flutter_template/models/aspirations_model/aspirations_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';

import '../../../models/age_selection_model/age_students_model.dart';
import '../../../network/api_helper.dart';
import '../../endpoints/endpoints.dart';

class AgeSelectionService {

  static Future<LoginSuccessModel> saveAgeSelectionInfo(SaveAgeStudentsModel saveAgeStudentsModel) async {
    return await ApiHelper(url: AtheleteAssist.saveAgeSelection, body: saveAgeStudentsModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }

  static Future<GetAgeStudentsModel> getAgeSelection() async {
    return await ApiHelper(url: AtheleteAssist.getAgeSelection).get((p0) => GetAgeStudentsModel.fromJson(p0));
  }


}
