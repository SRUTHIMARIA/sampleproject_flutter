import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_type_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

class ParentDetailService {
  static Future<ApiErrorResponseModel> parentType(ParentTypeModel parentTypeModel) async {
    return await ApiHelper(
      url: '${AtheleteAssist.getParentProfileType}$parentTypeModel',
    ).get(
      (p0) => ApiErrorResponseModel.fromJson(p0),
    );
  }

  static Future<LoginSuccessModel> parentDetails(ParentResponseModel parentResponseModel) async {
    return await ApiHelper(url: AtheleteAssist.parentProfileDetails, body: parentResponseModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }
}



// static Future<ApiErrorResponseModel> parentType(String type) async {
//   return await ApiHelper(url: AthleteAssist.getParentProfileType(type)).get((p0) =>
//    ApiErrorResponseModel.fromJson(p0));
// }

