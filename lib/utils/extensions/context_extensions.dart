import 'dart:math';

import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  bool get isTab => screenWidth > 600;

  double get statusBarHeight => mq.padding.top;

  double get screenWidth => mq.size.width;

  double get screenHeight => mq.size.height;

  double get screenRatio => screenHeight / screenWidth;

  double get scaleWidth => screenWidth / _FigmaFileDetails.screenWidth;

  double get scaleHeight => screenHeight / _FigmaFileDetails.screenHeight;

  double get widthPx => screenWidth > 600 ? 1.5 : 1;

  double get heightPx => screenWidth > 600 ? 1.5 : 1;

  double get textPx => screenWidth > 600 ? 1.5 : 1;

  double get scaleText =>
      min(screenWidth / _FigmaFileDetails.screenWidth, screenHeight / _FigmaFileDetails.screenHeight);

  double get percentWidth => screenWidth / 100;

  double get percentHeight => screenHeight / 100;

  void pop({Object? data}) => Navigator.of(this).pop(data);

  Future pushNamedReplacement(String name, {Object? arguments}) async =>
      await Navigator.pushReplacementNamed(this, name, arguments: arguments);

  Future pushNamed(String name, {Object? arguments}) async =>
      await Navigator.pushNamed(this, name, arguments: arguments);

  Future pushNamedAndRemoveUntil(String name, {Object? arguments}) async =>
      await Navigator.pushNamedAndRemoveUntil(this, name, (route) => false, arguments: arguments);
}

//Size without context extension

class WindowProperties {
  static MediaQueryData mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static double get statusBarHeight => mq.padding.top;

  static double get bottomBarHeight => mq.padding.bottom;

  static double get screenWidth => mq.size.width;

  static double get screenHeight => mq.size.height;

  static double get safeScreenHeight => mq.size.height - (statusBarHeight + bottomBarHeight);

  static double get screenRatio => screenHeight / screenWidth;

  static double get widthPx => screenWidth / _FigmaFileDetails.screenWidth;

  static double get heightPx => screenHeight / _FigmaFileDetails.screenHeight;

  static double get textPx =>
      min(screenWidth / _FigmaFileDetails.screenWidth, screenHeight / _FigmaFileDetails.screenHeight);
}

class _FigmaFileDetails {
  static const double screenWidth = 375;
  static const double screenHeight = 812;
}

double getScaledSize(double value, {double scale = 1.5}) {
  return WindowProperties.screenWidth < 600 ? value : value * scale;
}
