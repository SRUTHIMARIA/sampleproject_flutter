
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/login_model/login_user_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';


class LoginService {
  static Future<LoginSuccessModel> loginInfo(LoginModel loginModel) async {
    return await ApiHelper(url: AtheleteAssist.login, body: loginModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }
}
