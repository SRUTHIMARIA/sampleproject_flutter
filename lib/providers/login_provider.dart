
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../local_data/helpers/secure_storage_helper.dart';
import '../../utils/static/keys.dart';



class LoginProvider extends ChangeNotifier{

  var email = '';
  var password = '';
  var token = '';
  var username = '';
  var isLoggedIn = false;
  bool loginError = false;
  var isLoading = false;
  bool error = false;
  String errorMessage = '';
  final logger = Logger();
  int key=0;

  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

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

  void setLoginError(bool setError) {
    loginError = setError;
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


  void signIn(String emailTxt, String pwdTxt){
    email = emailTxt;
    password = pwdTxt;
    notifyListeners();
  }


// void login(String email,String password,String device_token)async {
//     setLoading(true);
//   try{
//     Response response=await post(Uri.parse('https://athlete.devateam.com/api/login'),
//         headers: {
//           // 'Content-Type': 'application/json',
//           'Authorization': 'Bearer ' + device_token,
//           'Accept': 'application/json',
//
//          },
//       body:{
//         'email' :email,
//         'password': password,
//         'device_token':device_token,
//       },
//     );
//     if(response.statusCode==200){
//       print("Successful");
//       setLoading(false);
//
//     }else{
//       setLoading(false);
//       print("failed");
//     }
//   }catch(e){
//     setLoading(false);
//     print(e.toString());
//
//   }
// }

  //
  // Future signInToApp(
  //     BuildContext context, String email, String password,String device_token) async {
  //   print('***********************Login');
  //   if (email.trim().isEmpty || password.trim().isEmpty) {
  //     const ToastAtTop().showToast(errorMessage5);
  //     setLoginError(true);
  //   } else {
  //     setIsLoading(true);
  //     setLoginError(false);
  //     final client =
  //     ApiClient(Dio(BaseOptions(contentType: 'application/json')));
  //     LoginUser loginUser = LoginUser(
  //       email: email,
  //       password: password,
  //       device_token: device_token,
  //     );
  //     client.loginPage(loginUser).then((it) async {
  //
  //       setIsLoading(false);
  //       setToken(it.token!);
  //       // await SecureStorageHelper.saveString(key: StaticKeys.tokenLocation, dataToStore: it.token!);
  //       SharedPreferences sharedPreferences = await _prefs;
  //       sharedPreferences.setBool('isLoggedIn', true);
  //       sharedPreferences.setString('token', it.token!);
  //       print('***********************${it.token}');
  //       setIsLoading(false);
  //       Provider.of<LoginProvider>(context, listen: false).saveUserDetails(authToken: token, userName: username);
  //
  //       const ToastAtTop().showToast(loggedin);
  //       const Routes().replace(context,HomePage());
  //       // context.router.replaceAll([
  //       //   const Home(),
  //       // ]);
  //     }).catchError((Object obj) {
  //       print('!!!!!!!!!!!!!$obj');
  //       setIsLoading(false);
  //       setLoginError(true);
  //       //setError(true);
  //       // const ToastAtTop().showToast(errorMessage3);
  //       switch (obj.runtimeType) {
  //         case DioError:
  //           final res = (obj as DioError).response;
  //           print('Got error : ${res?.statusCode} -> ${res?.data}');
  //           const ToastAtTop().showToast('${res?.data['message']}');
  //           break;
  //         default:
  //           break;
  //       }
  //     });
  //   }
  // }

  Future<void> saveUserDetails({required String authToken, required String userName}) async {
    await Future.wait([
      SecureStorageHelper.saveString(key: StaticKeys.tokenLocation, dataToStore: authToken),
      SecureStorageHelper.saveString(key: StaticKeys.userNameLocation, dataToStore: userName),
    ]);
    token = authToken;
    username = userName;
    notifyListeners();
  }

// Future getUserDetailData() async {
//   final client =
//   ApiClient(Dio(BaseOptions(contentType: 'application/json',)));
//
//
//   client.getUserDetails('Bearer $token','application/json').then((it) async {
//
//     await SecureStorageHelper.saveString(key: StaticKeys.userNameLocation, dataToStore: it.data?.firstName ??'');
//     await SecureStorageHelper.saveString(key: StaticKeys.userEmailLocation, dataToStore: it.data?.email ??'');
//
//     print('My email---------->>>>>${it.data?.firstName}');
//
//   }).catchError((Object obj) {
//     const ToastAtTop().showToast('Something went Wrong');
//     switch (obj.runtimeType) {
//       case DioError:
//         final res = (obj as DioError).response;
//         print('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
//         break;
//       default:
//         break;
//     }
//   });
//
// }



//
// Future signInToApp(
//     BuildContext context, String email, String password,String firebaseToken) async {
//   if (email.trim().isEmpty || password.trim().isEmpty) {
//     const ToastAtTop().showToast(errorMessage5);
//     setError(true);
//   } else {
//     setIsLoading(true);
//     setError(false);
//     final client =
//     ApiClient(Dio(BaseOptions(contentType: 'application/json')));
//     String? firebaseToken = await FirebaseMessaging.instance.getToken();
//    debugPrint("FCM Registration Token: " + token);
//
//     LoginUser loginUser = LoginUser(
//       email: email,
//       password: password,
//       device_token: firebaseToken,
//     );
//     client.loginPage(loginUser).then((it) async {
//       setToken(it.token!);
//       SharedPreferences sharedPreferences = await _prefs;
//       sharedPreferences.setBool('isLoggedIn', true);
//       sharedPreferences.setString('token', it.token!);
//       debugPrint('***********************$it');
//       setIsLoading(false);
//
//       const ToastAtTop().showToast(loggedin);
//       const Routes().replace(context,  HomePage());
//       // context.router.replaceAll([
//       //   const Home(),
//       // ]);
//     }).catchError((Object obj) {
//       debugPrint('!!!!!!!!!!!!!$obj');
//       setIsLoading(false);
//       setError(true);
//       const ToastAtTop().showToast(errorMessage3);
//       switch (obj.runtimeType) {
//         case DioError:
//           final res = (obj as DioError).response;
//           debugPrint('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
//           break;
//         default:
//           break;
//       }
//     });
//   }
// }
}