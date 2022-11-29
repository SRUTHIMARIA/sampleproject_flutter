import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_type_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

class ParentDetailService {
  static Future<ApiErrorResponseModel> parentType(ParentTypeModel parentTypeModel) async {
    return await ApiHelper(
      url: '${AthleteAssist.getParentProfileType}$parentTypeModel',
    ).get(
      (p0) => ApiErrorResponseModel.fromJson(p0),
    );
  }

  static Future<ApiErrorResponseModel> parentDetails(ParentResponseModel parentResponseModel) async {
    return await ApiHelper(url: AthleteAssist.parentProfileDetails, body: parentResponseModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }
}



// static Future<ApiErrorResponseModel> parentType(String type) async {
//   return await ApiHelper(url: AthleteAssist.getParentProfileType(type)).get((p0) =>
//    ApiErrorResponseModel.fromJson(p0));
// }

