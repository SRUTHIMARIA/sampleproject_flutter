
import 'package:flutter_template/models/parent_model/parent_type_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

class ParentDetailService {
  static Future<ParentTypeModel> parenType(String type) async {
    return await ApiHelper(url: AthleteAssist.getParentProfileType(type)).get((p0) {
      return ParentTypeModel.fromJson(p0);
    });
  }
}
