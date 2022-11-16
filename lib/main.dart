import 'package:flutter/material.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/homepage/chat_screen.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/ui/homepage/main_screen.dart';
import 'package:flutter_template/ui/profile/profile.dart';
import 'package:flutter_template/ui/profile/profile_update.dart';
import 'package:flutter_template/ui/reports/reports.dart';
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
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5)),),
      title: 'Athlete Assist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DrawerScreenProvider(),
      //   child:  HomePage(),
    );
  }
}
