import 'package:flutter/material.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_screen.dart';
import 'package:flutter_template/utils/globals.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AuthenticationProvider.retrieveAuthUser();

  runApp(
    MultiProvider(
      providers: ProviderRegister.providers,
      child: MyApp(),
    ),
  );
  // MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Globals.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'Athelete Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SportsTypeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'package:flutter_template/ui/scheduling_self_analysis/self_analyisis_notes.dart';
//
// import 'package:flutter_template/ui/student_basic_profile/sports_type_screen.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';
//
// import 'package:responsive_framework/responsive_framework.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//  await Hive.initFlutter();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) => ResponsiveWrapper.builder(child,
//           maxWidth: 1200,
//           minWidth: 480,
//           defaultScale: true,
//           breakpoints: [
//             ResponsiveBreakpoint.resize(480, name: MOBILE),
//             ResponsiveBreakpoint.autoScale(800, name: TABLET),
//             ResponsiveBreakpoint.autoScale(1000, name: TABLET),
//             ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//           ],
//           background: Container(color: Color(0xFFF5F5F5))),
//       title: 'Athelete Assist',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SportsTypeScreen(),
//       // home: ChangeNotifierProvider(
//       //   create: (context) => DrawerScreenProvider(),
//       //   child:  HomePage(),
//     );
//     return
//       // MaterialApp.router(
//       //   routerDelegate: _appRouter.delegate(),
//       //   routeInformationParser: _appRouter.defaultRouteParser(),
//       //   builder: (context, router) => router!,
//       // );
//
//       // ChangeNotifierProvider(
//       //   create: (context) => SignupValidation(),
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         builder: (context, child) => ResponsiveWrapper.builder(
//             child,
//             maxWidth: 1200,
//             minWidth: 480,
//             defaultScale: true,
//             breakpoints: [
//               ResponsiveBreakpoint.resize(480, name: MOBILE),
//               ResponsiveBreakpoint.autoScale(800, name: TABLET),
//               ResponsiveBreakpoint.autoScale(1000, name: TABLET),
//               ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//             ],
//             background: Container(color: Color(0xFFF5F5F5))),
//
//
//         title: 'Athelete Assist',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//
//
//         ),
//         // home: ChangeNotifierProvider(
//         //   create: (_) => MapsProvider(),
//         //   child: const HomeScreen(),
//         // ),
//        home:  SelfAnalysisNotes(),
//
//       );
//   }
// }
