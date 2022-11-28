import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/firebase_options.dart';
import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_session.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_screen.dart';
import 'package:flutter_template/utils/globals.dart';
import 'package:provider/provider.dart';
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

// Future main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: providers,
    child: MyApp(),
  ),
  );

 Firebase.initializeApp();
  await Hive.initFlutter();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await AuthenticationProvider.retrieveAuthUser();

  // MyApp());
  await Hive.initFlutter();
  await AuthenticationProvider.retrieveAuthUser();

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DrawerScreenProvider(),
      //   child:  HomePage(),

    );
  }
}
