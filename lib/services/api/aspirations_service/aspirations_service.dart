import 'package:flutter_template/models/aspirations_model/aspirations_model.dart';
import 'package:flutter_template/models/aspirations_model/get_aspiration_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

class AspirationsService {

  static Future<LoginSuccessModel> aspirationsInfo(AspirationsModel aspirationsModel) async {
    return await ApiHelper(url: AtheleteAssist.saveAspirations, body: aspirationsModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }

  static Future<GetAspirationsModel> getAspirations() async {
    return await ApiHelper(
      url: AtheleteAssist.getAspirations,).get((p0) => GetAspirationsModel.fromJson(p0),
    );
  }

}
