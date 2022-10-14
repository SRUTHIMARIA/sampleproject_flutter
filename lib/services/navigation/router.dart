import 'package:auto_route/annotations.dart';
import 'package:flutter_template/ui/splash_screen/splash_animation.dart';
import 'package:flutter_template/ui/splash_screen/splash_screen.dart';

import '../../ui/login_screen/login_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    // AutoRoute(page: SplashAnimationScreen),

    AutoRoute(page: LoginScreen, initial: true),
  ],
)
class $AppRouter {}
