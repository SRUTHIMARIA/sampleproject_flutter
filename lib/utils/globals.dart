
import 'package:flutter/material.dart';
class Globals {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext context() => navigatorKey.currentState!.context;
// static final appRouter = AppRouter();
}