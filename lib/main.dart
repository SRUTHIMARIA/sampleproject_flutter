import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/providers/authentication_provider.dart';

import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/splash_screen/splash_screen.dart';

import 'package:flutter_template/utils/globals.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:flutter_template/ui/feedback/feedback.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_screen.dart';
import 'package:flutter_template/ui/subscriptions/subscriptions.dart';



import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 Firebase.initializeApp();
  await Hive.initFlutter();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await AuthenticationProvider.retrieveAuthUser();

  runApp(
    MultiProvider(
      providers: ProviderRegister.providers,
      child: MyApp(),
    ),
  );
  // MyApp());
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
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5)),),
      title: 'Athlete Assist',
      builder: (context, child) =>
          ResponsiveWrapper.builder(child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: const Color(0xFFF5F5F5)),),
      title: 'Athlete Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      home: const Subscriptions(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DrawerScreenProvider(),
      //   child:  HomePage(),

    );
  }
}


