import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/forgot_password_model/forgotpasswd_model.dart';
import 'package:flutter_template/models/new_password_model/new_password_model.dart';

import 'package:flutter_template/models/register_model/success_user_model.dart';
import 'package:flutter_template/network/api_client.dart';
import 'package:flutter_template/services/navigation/routes.dart';
import 'package:flutter_template/ui/password_recovery/password_activation_link.dart';

import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/widgets/common/custom_toast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/password_recovery/authentication_code_screen.dart';



class ResetpasswordProvider extends ChangeNotifier{

  var email = '';
  var token = '';
  var isLoggedIn = false;
  var isLoading = false;
  bool error = false;
  String errorMessage = '';
  final logger = Logger();
  int key=0;

  SuccessUser _successUser = SuccessUser();


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setIsLoggedIn(bool mail) {
    isLoggedIn = mail;
    notifyListeners();
  }

  void setIsLoading(bool setLoading) {
    isLoading = setLoading;
    notifyListeners();
  }

  void setError(bool setError) {
    error = setError;
    notifyListeners();
  }

  void setEmail(String mail) {
    email = mail;
    notifyListeners();
  }

  void setErrorMessage(String setError) {
    errorMessage = setError;
    notifyListeners();
  }

  void setToken(String accessToken) {
    debugPrint('token************$token');
    token = accessToken;
  }
  void setKey(int code){
    key = code;
  }

  //
  // void signIn(String emailTxt, String pwdTxt){
  //   email = emailTxt;
  //   password = pwdTxt;
  //   notifyListeners();
  // }
  //


  Future resetPassword(BuildContext context, String password,String password_confirmation) async {
    if (email.trim().isEmpty) {
      const ToastAtTop().showToast(errorMessage6);
    } else {
      setIsLoading(true);
      final client = ApiClient(
        Dio(BaseOptions(contentType: 'application/json')),
      );
      NewPasswordModel newPasswordModel = NewPasswordModel(password: password,password_confirmation: password_confirmation);
      client.resetPassword(newPasswordModel).then((it) async {
        // var yy = it.key;
        // debugPrint('%%%%%%%%%%%%%%%keyy ${it.key}');
        // setKey(it.key!);
        setIsLoading(false);
        setEmail(email);
        const ToastAtTop().showToast(success);
        const Routes().pushReplacement(context, const PasswordActivationLink());
      }).catchError((Object obj) {
        const ToastAtTop().showToast(errorMessage4);
        setIsLoading(false);
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            break;
          default:
            break;
        }
      });
    }
  }
}