import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isThemeElite = false;
  bool isThemeGroup = false;
  int selectedIndex = -1;

  void updateEliteTheme({required bool value}) {
    isThemeElite = value;
    notifyListeners();
  }

  void updateGroupTheme({required bool value}) {
    isThemeGroup = value;
    notifyListeners();
  }

  void selectedStatus({required int value}) {
    selectedIndex = value;
    notifyListeners();
  }



}
