import 'package:flutter_template/models/common_model/success_model.dart';
import 'package:flutter_template/models/sports_type_model/sports_type_response_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

class LoginService {
  static Future<SuccessModel> sportslist(SportsTypeModel sportsTypeModel) async {
    return await ApiHelper(url: AtheleteAssist.getSportsList, body: sportsTypeModel.toJson())
        .post((p0) => SuccessModel.fromJson(p0));
  }
}
