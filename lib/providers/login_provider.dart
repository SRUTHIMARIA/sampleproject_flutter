import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/register_model/register_user.dart';
import 'package:flutter_template/models/register_model/success_model.dart';
import 'package:flutter_template/network/api_client.dart';
import 'package:flutter_template/services/navigation/routes.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/widgets/common/custom_toast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model/login_user_model.dart';
import '../ui/login_screen/login_screen.dart';

class LoginProvider extends ChangeNotifier{

  String email = '';
  String pwd = '';
  var token = '';
  var isLoggedIn = false;
  var isLoading = false;
  bool error = false;
  String errorMessage = '';
  final logger = Logger();

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

  void signIn(String emailTxt, String pwdTxt){
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
  }


  Future signUpToApp(
      BuildContext context, String email, String password,String first_name,String last_name) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      const ToastAtTop().showToast(errorMessage5);
      setError(true);
    } else {
      setIsLoading(true);
      setError(false);
      final client =
      ApiClient(Dio(BaseOptions(contentType: 'application/json')));
      RegisterUser registerUser = RegisterUser(
        email: email,
        password: password,
        first_name: first_name,
        last_name: last_name,
      );
      client.register(registerUser).then((it) async {
        setToken(it.token!);
        SharedPreferences sharedPreferences = await _prefs;
        sharedPreferences.setBool('isLoggedIn', true);
        sharedPreferences.setString('token', it.token!);
        debugPrint('***********************$it');
        setIsLoading(false);

        const ToastAtTop().showToast(loggedin);
        const Routes().replace(context, const LoginScreen());
        // context.router.replaceAll([
        //   const Home(),
        // ]);
      }).catchError((Object obj) {
        debugPrint('!!!!!!!!!!!!!$obj');
        setIsLoading(false);
        setError(true);
        const ToastAtTop().showToast(errorMessage3);
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            debugPrint('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
            break;
          default:
            break;
        }
      });
    }
  }
  Future signInToApp(
      BuildContext context, String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      const ToastAtTop().showToast(errorMessage5);
      setError(true);
    } else {
      setIsLoading(true);
      setError(false);
      final client =
      ApiClient(Dio(BaseOptions(contentType: 'application/json')));
      LoginUser loginUser = LoginUser(
        email: email,
        password: password,
      );
      client.loginPage(loginUser).then((it) async {
        setToken(it.token!);
        SharedPreferences sharedPreferences = await _prefs;
        sharedPreferences.setBool('isLoggedIn', true);
        sharedPreferences.setString('token', it.token!);
        debugPrint('***********************$it');
        setIsLoading(false);

        const ToastAtTop().showToast(loggedin);
        const Routes().replace(context,  HomePage());
        // context.router.replaceAll([
        //   const Home(),
        // ]);
      }).catchError((Object obj) {
        debugPrint('!!!!!!!!!!!!!$obj');
        setIsLoading(false);
        setError(true);
        const ToastAtTop().showToast(errorMessage3);
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            debugPrint('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
            break;
          default:
            break;
        }
      });
    }
  }
}