import 'package:flutter/material.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';

import 'package:responsive_framework/responsive_framework.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AuthenticationProvider.retrieveAuthUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // final _appRouter = AppRouter();

    // return MaterialApp.router(
    //   //Todo: add app name here
    //   title: 'AppName',
    //
    //   debugShowCheckedModeBanner: false,
    //   routerDelegate: Globals.appRouter.delegate(),
    //   routeInformationParser: Globals.appRouter.defaultRouteParser(),
    //   builder: (context, child) => ResponsiveWrapper.builder(
    //     BouncingScrollWrapper.builder(context, child!),
    //     maxWidth: 2400,
    //     minWidth: 200,
    //     defaultScale: true,
    //     breakpoints: [
    //       const ResponsiveBreakpoint.autoScaleDown(300, name: ResponsiveKeys.mobileSmall),
    //       const ResponsiveBreakpoint.resize(350, name: ResponsiveKeys.mobile),
    //       const ResponsiveBreakpoint.autoScale(600, name: ResponsiveKeys.tab),
    //       const ResponsiveBreakpoint.resize(800, name: ResponsiveKeys.tabLarge),
    //       const ResponsiveBreakpoint.autoScale(1000, name: ResponsiveKeys.tabExtraLarge),
    //       const ResponsiveBreakpoint.resize(1200, name: ResponsiveKeys.desktop),
    //     ],
    //   ),
    //
    //
    // );
  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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

       home: HomePage(),

      );
  }
}
