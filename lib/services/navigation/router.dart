import 'package:auto_route/annotations.dart';
import 'package:flutter_template/ui/home_screen/home.dart';
import 'package:flutter_template/ui/second_screen/second_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: SecondScreen),
  ],
)
class $AppRouter {}
