import 'package:flutter_template/models/age_group_model/age_group_model.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

class AgeGroupService {
  static Future<AgeGroupModel> getAgeGroupList() async {
    return await ApiHelper(url: AtheleteAssist.getAgeGroup).get((p0) => AgeGroupModel.fromJson(p0));
  }


}
