import 'package:flutter/material.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/daily_reflection.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/my_current_mindset.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/self_analyisis_notes.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/ui/homepage/main_screen.dart';
import 'package:flutter_template/ui/profile/profile.dart';
import 'package:flutter_template/ui/profile/profile_update.dart';
import 'package:flutter_template/ui/settings/settings.dart';
import 'package:provider/provider.dart';

import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      title: 'Athlete Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Settings(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DrawerScreenProvider(),
      //   child:  HomePage(),
    );
    return
      // MaterialApp.router(
      //   routerDelegate: _appRouter.delegate(),
      //   routeInformationParser: _appRouter.defaultRouteParser(),
      //   builder: (context, router) => router!,
      // );

      // ChangeNotifierProvider(
      //   create: (context) => SignupValidation(),
      MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5))),


        title: 'Athelete Assist',
        theme: ThemeData(
          primarySwatch: Colors.blue,


        ),
        // home: ChangeNotifierProvider(
        //   create: (_) => MapsProvider(),
        //   child: const HomeScreen(),
        // ),
       home:  SelfAnalysisNotes(),

      );
  }
}
