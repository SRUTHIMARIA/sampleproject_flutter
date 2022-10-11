import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/providers/provider_registrar.dart';
import 'package:flutter_template/providers/theme_provider.dart';
import 'package:flutter_template/ui/home_screen/home.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthenticationProvider.retrieveAuthUser();
  runApp(MultiProvider(providers: ProviderRegistrar.providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),

          ),
          home: Home(),
        ),
      ),
    );
    // return MaterialApp.router(
    //   //Todo: add app name here
    //   title: 'AppName',
    //   theme: context.watch<ThemeProvider>().getAppTheme(),
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
    // );
  }
}
