import 'package:flutter/foundation.dart';
import 'package:flutter_template/local_data/helpers/secure_storage_helper.dart';
import 'package:flutter_template/utils/static/keys.dart';

class AuthenticationProvider extends ChangeNotifier {
  static String _token = '';
  static String _currentUserName = '';

  static bool get isLoggedIn => _token.isNotEmpty;
  static String get token => _token;
  static String get userName => _currentUserName;

  ///call when login is success
  Future<void> saveUserDetails({required String authToken, required String userName}) async {
    await Future.wait([
      SecureStorageHelper.saveString(key: StaticKeys.tokenLocation, dataToStore: authToken),
      SecureStorageHelper.saveString(key: StaticKeys.userNameLocation, dataToStore: userName),
    ]);
    _token = authToken;
    _currentUserName = userName;
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
  }

  ///This method will be called from the [ProviderRegistrar]
  void clearProvider() {
    _currentUserName = '';
    _token = '';
  }
}
