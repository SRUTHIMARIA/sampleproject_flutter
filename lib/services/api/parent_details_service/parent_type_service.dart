import 'package:flutter_template/models/common_model/success_model.dart';
import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_type_model.dart';
import 'package:flutter_template/models/sports_type_model/sports_type_response_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

class ParentDetailService {
  static Future<ParentTypeModel> parenType(String type) async {
    return await ApiHelper(url: AtheleteAssist.getParentProfileType(type)).get((p0) {
      return ParentTypeModel.fromJson(p0);
    });
  }
}
