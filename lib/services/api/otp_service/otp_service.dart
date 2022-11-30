
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/otp_verification_model/otp_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';


class OtpService {
  static Future<ApiErrorResponseModel> otpInfo(OtpModel otpModel) async {
    return await ApiHelper(url: AtheleteAssist.verifyOtp, body: otpModel.toJson())
        .post((p0) => ApiErrorResponseModel.fromJson(p0));
  }
}
