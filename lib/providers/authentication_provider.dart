import 'package:flutter/foundation.dart';
import 'package:flutter_template/local_data/helpers/secure_storage_helper.dart';
import 'package:flutter_template/utils/static/keys.dart';

class AuthenticationProvider extends ChangeNotifier {
  static String _token = '';
  static String _currentUserName = '';
  static int _currentUserId = 0;

  static bool get isLoggedIn => _token.isNotEmpty;
  static String get token => _token;
  static String get userName => _currentUserName;
  static int get userId => _currentUserId;

  ///call when login is success
  Future<void> saveUserDetails({
    required String authToken,
    required String userName,
    // required String onBoarding,
    // required int userId,
  }) async {
    await Future.wait([
      SecureStorageHelper.saveString(key: StaticKeys.tokenLocation, dataToStore: authToken),
      SecureStorageHelper.saveString(key: StaticKeys.userNameLocation, dataToStore: userName),
     // SecureStorageHelper.saveInt(key: StaticKeys.userIdLocation, dataToStore: userId),
    ]);
    _token = authToken;
    _currentUserName = userName;
    _currentUserId = userId;
    notifyListeners();
  }

  // Future<bool> logout() async {
  //   try {
  //     await Future.wait([SecureStorageHelper.clearAll(), AppCacheUtils.deleteAppCache()]);
  //     ProviderRegister.clearProviders();
  //   } catch (e) {
  //     debugPrint('Failed to logout from the app. $e');
  //
  //     return false;
  //   }
  //   notifyListeners();
  //
  //   return true;
  // }

  static Future<void> retrieveAuthUser() async {
    _token = (await SecureStorageHelper.getString(key: StaticKeys.tokenLocation)) ?? '';
    _currentUserName = (await SecureStorageHelper.getString(key: StaticKeys.userNameLocation)) ?? '';
    _currentUserId = (await SecureStorageHelper.getInt(key: StaticKeys.userIdLocation)) ?? 0;
  }

  ///This method will be called from the [ProviderRegistrar]
  void clearProvider() {
    _currentUserName = '';
    _token = '';
    _currentUserId = 0;
  }
}
