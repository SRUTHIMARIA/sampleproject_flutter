import 'package:flutter/material.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/providers.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/ui/homepage/main_screen.dart';
import 'package:flutter_template/ui/profile/profile.dart';
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
      home: Profile(),
      // home: ChangeNotifierProvider(
      //   create: (context) => DrawerScreenProvider(),
      //   child:  HomePage(),
    );
  }
}
