
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/login_model/login_user_model.dart';
import 'package:flutter_template/models/register_model/success_user_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

import '../../../models/common_model/success_model.dart';

class LoginService {
  static Future<SuccessUser> login(LoginUser loginUser) async {
    return await ApiHelper(url: AtheleteAssist.login, body: loginUser.toJson())
        .post((p0) => SuccessUser.fromJson(p0));
  }
  // static loginUser(BuildContext context, LoginUser loginUser) {
  //   ApiHelper apiManager = ApiHelper(
  //       url: AtheleteAssist.login,
  //       context: context,
  //       jsonSendData: loginUser.toJson(),
  //       onProcessSuccess: (json) {
  //         AuthenticationResponseModel model = AuthenticationResponseModel.fromJson(json);
  //         context.read<CommonFunctionsProvider>().onAuthenticationSuccess(context, model);
  //       });
  //   apiManager.post();
  // }
}
