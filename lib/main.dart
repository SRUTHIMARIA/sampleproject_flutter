import 'package:flutter/material.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/ui/password_recovery/password_activation_link.dart';
import 'package:flutter_template/ui/password_recovery/password_recovery.dart';
import 'package:flutter_template/ui/register_screen/register_activation_link.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthenticationProvider.retrieveAuthUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        title: 'Athelete Assist',
        theme: ThemeData(
          primarySwatch: Colors.blue,


        ),
        // home: ChangeNotifierProvider(
        //   create: (_) => MapsProvider(),
        //   child: const HomeScreen(),
        // ),
        home: LoginScreen(),

      );
  }
}
