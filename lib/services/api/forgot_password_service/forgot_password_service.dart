import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/forgot_password_model/forgotpasswd_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';


class ForgotPasswordService {
  static Future<LoginSuccessModel> forgotPasswordInfo(ForgotPasswordModel forgotPasswordModel) async {
    return await ApiHelper(url: AtheleteAssist.forgotPassword, body: forgotPasswordModel.toJson())
        .post((p0) => LoginSuccessModel.fromJson(p0));
  }
}
