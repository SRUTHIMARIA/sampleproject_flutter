import 'package:dio/dio.dart';
import 'package:flutter_template/models/login_model/login_user_model.dart';
import 'package:flutter_template/models/new_password_model/new_password_model.dart';
import 'package:flutter_template/models/otp_verification_model/otp_model.dart';
import 'package:flutter_template/models/register_model/register_user.dart';
import 'package:flutter_template/models/register_model/success_model.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:retrofit/http.dart';

import '../models/forgot_password_model/forgotpasswd_model.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: baseURL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @Header('Accept:application/json')
  @POST('/register')
  Future<SuccessUser> register(
    @Body() RegisterUser registerUser,
  );

  @POST('/login')
  Future<SuccessUser> loginPage(
      @Body() LoginUser loginUser,
      );

  @POST('/request-otp')
  Future<SuccessUser> requestOtp(
      @Body() ForgotPasswordModel forgotPasswordModel,
      );
  @POST('/verify-otp')
  Future<SuccessUser> verifyOtp(
      @Body() OtpModel otpModel,
      );

  @POST('/reset-password')
  Future<SuccessUser> resetPassword(
      @Body() NewPasswordModel newPasswordModel,
      );
}
