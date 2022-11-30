
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/new_password_model/new_password_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';


class NewPasswordService {
  static Future<ApiErrorResponseModel> newPasswordInfo(NewPasswordModel newPasswordModel) async {
    return await ApiHelper(url: AtheleteAssist.login, body: newPasswordModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }
}
