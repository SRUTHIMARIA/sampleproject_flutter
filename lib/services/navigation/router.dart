import 'package:auto_route/annotations.dart';

import '../../ui/login_screen/login_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen, initial: true),
  ],
)
class $AppRouter {}
