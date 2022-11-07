import 'package:flutter_template/utils/static/static_string_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticAppPreferences {
  static SharedPreferences? _prefs;

  static Future<void> _checkAndInitialize() async {
    if (_prefs != null) {
      return;
    }
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveInt({required String key, required int dataToStore}) async {
    await _checkAndInitialize();
    return await _prefs!.setInt(key, dataToStore);
  }

  static Future<int> getInt({required String key}) async {
    await _checkAndInitialize();
    return (_prefs!.getInt(key) ?? 0);
  }

  static Future<bool> saveString({required String key, required String dataToStore}) async {
    await _checkAndInitialize();
    return await _prefs!.setString(key, dataToStore);
  }

  static Future<bool> saveToken({required String token}) async {
    await _checkAndInitialize();
    return await _prefs!.setString(StaticKeys.tokenLocation, token);
  }

  static Future<String> getString({required String key}) async {
    await _checkAndInitialize();
    return (_prefs!.getString(key) ?? "");
  }

  static Future<String> getToken() async {
    await _checkAndInitialize();
    return (_prefs!.getString(StaticKeys.tokenLocation) ?? "");
  }

  static Future<bool> saveBool({required String key, required bool bool}) async {
    await _checkAndInitialize();
    return await _prefs!.setBool(key, bool);
  }

  static Future<bool> getBool({required String key}) async {
    await _checkAndInitialize();
    return (_prefs!.getBool(key) ?? false);
  }

  static Future<void> clear() async {
    await _checkAndInitialize();
    await _prefs!.clear();
  }
}