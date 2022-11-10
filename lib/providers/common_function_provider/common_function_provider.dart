import 'package:flutter/cupertino.dart';
import 'package:flutter_template/utils/app_preference/app_preference.dart';
import 'package:flutter_template/utils/static/static_string_keys.dart';

import '../../models/common_model/authentication_response_model.dart';



class CommonFunctionsProvider extends ChangeNotifier {
  static String token = '';
  static String userName = '';
  static int quickBloxId = 0;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void onAuthenticationSuccess(BuildContext context, AuthenticationResponseModel model) async {
    await StaticAppPreferences.saveString(key: StaticKeys.tokenLocation, dataToStore: model.payload.token);
    await StaticAppPreferences.saveString(key: StaticKeys.userNameLocation, dataToStore: model.payload.fullName);
    await StaticAppPreferences.saveInt(key: StaticKeys.quickBloxId, dataToStore: model.payload.quickBloxId);
    userName = model.payload.fullName;
    token = model.payload.token;
    quickBloxId = model.payload.quickBloxId;
    //configure fresh desk to enable push notifications
    // await configureFreshDesk();
    //For saving device id for push notification
    // await DeviceInfoService.saveDeviceInfo(context);


    //TODO:save token to secure storage instead of app prefs here

  }

  static Future<void> retrieveAuthenticationToken() async {
    token = await StaticAppPreferences.getToken();
    userName = await StaticAppPreferences.getString(key: StaticKeys.userNameLocation);
    // quickBloxId = await StaticAppPreferences.getInt(key: StaticKeys.quickBloxId);
  }

  // Future<void> logOutUser(BuildContext context) async {
  //   await context.read<CartProvider>().deleteLocalDb();
  //   await context.read<ChatProvider>().deleteChatCacheDb();
  //   context.read<ChatProvider>().chatLoginModel = null;
  //   await StaticAppPreferences.clear();
  //   FlutterAppBadger.removeBadge();
  //   Freshchat.resetUser();
  //   bool qbLogout = await ChatUtils.logOutQuickblox();
  //   debugPrint("LOGGED OUT FROM QB $qbLogout");
  //   await FirebaseMessaging.instance.deleteToken();
  //   await AppCacheUtils.deleteAppCache();
  //   token = "";
  //   userName = "";
  //   //context.read<ThemeProvider>().changeAppLanguage('en');
  //   notifyListeners();
  // }

  Future<void> saveUserName(String inputName) async {
    await StaticAppPreferences.saveString(key: StaticKeys.userNameLocation, dataToStore: inputName);
    userName = inputName;
    notifyListeners();
  }

  Future<void> saveQbId(int id) async {
    await StaticAppPreferences.saveInt(key: StaticKeys.quickBloxId, dataToStore: id);
    quickBloxId = id;
    notifyListeners();
  }

  String getUserName() {
    return userName;
  }

  String getToken() {
    return token;
  }
}