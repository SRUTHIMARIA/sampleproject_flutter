import 'package:flutter/material.dart';
import 'package:flutter_template/ui/feedback/feedback.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/ui/profile/profile.dart';
import 'package:flutter_template/ui/reports/reports.dart';
import 'package:flutter_template/ui/subscriptions/subscriptions.dart';

import '../ui/settings/settings.dart';

class DrawerScreenProvider extends ChangeNotifier {
  late Widget _currentScreen =  HomePage();

  Widget get currentScreen => _currentScreen;

  set currentScreen(Widget newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  void changeCurrentScreen(CustomScreensEnum screen) {
    switch (screen) {
      case CustomScreensEnum.homeScreen:
        currentScreen = HomePage();
        break;
      case CustomScreensEnum.profileScreen:
        currentScreen = Profile();
        break;
      case CustomScreensEnum.settingScreen:
        currentScreen = Settings();
        break;
      case CustomScreensEnum.reportScreen:
        currentScreen = Reports();
        break;
      case CustomScreensEnum.feedbackScreen:
        currentScreen = Feedbacks();
        break;
      case CustomScreensEnum.subscriptionScreen:
        currentScreen = Subscriptions();
        break;
      default:
        currentScreen = HomePage();
        break;
    }
  }
}

enum CustomScreensEnum {
  homeScreen,
  profileScreen,
  settingScreen,
  reportScreen,
  feedbackScreen,
  subscriptionScreen,
}
