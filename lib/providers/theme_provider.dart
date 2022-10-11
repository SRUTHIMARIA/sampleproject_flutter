import 'package:flutter/material.dart';
import 'package:flutter_template/local_data/helpers/secure_storage_helper.dart';
import 'package:flutter_template/utils/static/keys.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/utils/theme/light_theme.dart';
import '../utils/theme/dark_theme.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeMode _themeMode = ThemeMode.light;
  static AppColors _colors = lightThemeColors;
  static AppColors get colors => _colors;
  static ThemeMode get themeMode => _themeMode;

  static Future<void> retrieveTheme() async {
    String theme = (await SecureStorageHelper.getString(key: StaticKeys.themeLocation)) ?? ThemeMode.light.toString();
    _themeMode = theme == ThemeMode.light.toString() ? ThemeMode.light : ThemeMode.dark;
    _setTheme(_themeMode);
  }

  Future<void> toggleAppTheme() async {
    _setTheme(_themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    notifyListeners();
    await SecureStorageHelper.saveString(key: StaticKeys.themeLocation, dataToStore: _themeMode.toString());
  }

  ThemeData getAppTheme() {
    if (_themeMode == ThemeMode.light) {
      return lightAppTheme;
    } else {
      _themeMode = ThemeMode.dark;

      return darkAppTheme;
    }
  }

  static void _setTheme(ThemeMode theme) {
    if (theme == ThemeMode.light) {
      _themeMode = ThemeMode.light;
      _colors = lightThemeColors;
    } else {
      _themeMode = ThemeMode.dark;
      _colors = darkThemeColors;
    }
  }
}
