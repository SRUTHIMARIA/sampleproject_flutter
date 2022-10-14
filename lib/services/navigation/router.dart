import 'package:auto_route/annotations.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_screen.dart';



// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SportsTypeScreen, initial: true),


  ],
)
class $AppRouter {}
