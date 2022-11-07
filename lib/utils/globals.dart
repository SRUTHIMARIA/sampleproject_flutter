import 'package:flutter/material.dart';
import 'package:flutter_template/services/navigation/router.dart';
class Globals {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext context() => navigatorKey.currentState!.context;
// static final appRouter = AppRouter();
}
