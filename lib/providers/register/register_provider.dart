import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/register_model/register_user.dart';
import 'package:flutter_template/models/register_model/success_user_model.dart';
import 'package:flutter_template/network/api_client.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';

import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/widgets/common/custom_toast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/navigation/routes.dart';
import '../../utils/globals.dart';



class RegisterProvider extends ChangeNotifier{

  var email = '';
  var password = '';
  var first_name = '';
  var last_name = '';
  var token = '';
  var isLoggedIn = false;
  var isLoading = false;
  bool error = false;
  String errorMessage = '';
  final logger = Logger();
  int key=0;
  bool errorLogin = false;


  // SuccessUser _successUser = SuccessUser();


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


  void setLoginError(bool setError) {
    errorLogin = setError;
    notifyListeners();
  }

  void setSigUpError(bool setError) {
    errorLogin = setError;
    notifyListeners();
  }
  Future<void> resetAllKey() async {
    setToken('');
    SharedPreferences sharedPreferences = await _prefs;
    sharedPreferences.remove('isLoggedIn');
    sharedPreferences.remove('token');
    setIsLoading(false);
  }


  // Future signUpToApp(String firstName, String lastName, String email,String password,) async{
  //   if (firstName.trim().isEmpty ||
  //       lastName.trim().isEmpty ||
  //       email.trim().isEmpty ||
  //       password.trim().isEmpty) {
  //     const ToastAtTop().showToast(errorMessage5);
  //     setSigUpError(true);
  //   } else {
  //     setIsLoading(true);
  //     setSigUpError(false);
  //     final client =
  //     ApiClient(Dio(BaseOptions(contentType: 'application/json')));
  //     RegisterUser registerUser = RegisterUser(
  //       first_name: firstName,
  //       last_name: lastName,
  //       email: email,
  //       password: password,
  //     );
  //     client.register(registerUser).then((it) async {
  //
  //       setToken(it.token!);
  //       SharedPreferences sharedPreferences = await _prefs;
  //       sharedPreferences.setBool('isSignUp', true);
  //       sharedPreferences.setString('token', it.token!);
  //       setIsLoading(false);
  //
  //       const ToastAtTop().showToast(signupSuccess);
  //       const Routes().replace(Globals.navigatorKey.currentContext!, const LoginScreen());
  //
  //
  //     }).catchError((Object obj) {
  //       setIsLoading(false);
  //       setLoginError(true);
  //       debugPrint('********** signup $obj');
  //
  //       const ToastAtTop().showToast(errorMessage3);
  //     });
  //   }
  // }

  // Future signUpToApp(
  //     BuildContext context,
  //     String firstname,
  //     String lastname,
  //     String email,
  //     String password,
  //   ) async{
  //   debugPrint('Register');
  //   if (firstname.trim().isEmpty ||
  //       lastname.trim().isEmpty ||
  //       email.trim().isEmpty ||
  //       password.trim().isEmpty
  //     ) {
  //     const ToastAtTop().showToast(errorMessage5);
  //     setError(true);
  //   } else {
  //     print('$firstname');
  //     print('$lastname');
  //     print('$email');
  //     print('$password');      setIsLoading(true);
  //     setError(false);
  //     final client =
  //     ApiClient(Dio(BaseOptions(
  //
  //          contentType: 'application/json'
  //     )));
  //     RegisterUser registerUser = RegisterUser(
  //       email: email,
  //       password: password,
  //       first_name: firstname,
  //       last_name: lastname,);
  //     client.register('application/json',registerUser).then((it) async {
  //       setIsLoading(false);
  //       const ToastAtTop().showToast(registerSuccess);
  //       const Routes().replace(context, LoginScreen());
  //       //const Routes().replace(context, GroupMemberShipScreen());
  //       // context.router.replaceAll([
  //       //   const Home(),
  //       // ]);
  //     }).catchError((Object obj) {
  //       print('!!!!!!!!!!!!!$obj');
  //       setIsLoading(false);
  //       setError(true);
  //       const ToastAtTop().showToast(errorMessage3);
  //       switch (obj.runtimeType) {
  //         case DioError:
  //           final res = (obj as DioError).response;
  //           const ToastAtTop().showToast('${res?.data['message']}');
  //           print('Got error : ${res?.statusCode} -> ${res?.data['message']}');
  //           break;
  //         default:
  //           break;
  //       }
  //     });
  //   }
  // }


}