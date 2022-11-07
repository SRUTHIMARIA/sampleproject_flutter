// import 'package:flutter_template/providers/drawer_provider.dart';
// import 'package:flutter_template/providers/login_provider.dart';
// import 'package:flutter_template/providers/parent_details_provider/parent_detail_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
//
// final List<SingleChildWidget> providers = [
//   ChangeNotifierProvider<DrawerScreenProvider>(
//     create: (_) => DrawerScreenProvider(),
//   ),
//   ChangeNotifierProvider<LoginProvider>(
//     create: (_) => LoginProvider(),
//   ),
//   ChangeNotifierProvider(create: (_) => ParentDetailProvider()),
//
//   //
//   // ChangeNotifierProvider<ParentDetailProvider>(
//   //   create: (_) => ParentDetailProvider(),
//   // ),
// ];

import 'package:flutter_template/providers/authentication_provider.dart';

import 'package:flutter_template/providers/login_provider.dart';
import 'package:flutter_template/providers/parent_details_provider/parent_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'common_function_provider/common_function_provider.dart';

class ProviderRegister {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<CommonFunctionsProvider>(create: (_) => CommonFunctionsProvider(),),
    ChangeNotifierProvider<AuthenticationProvider>(create: (_) => AuthenticationProvider(),),
    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider(),),
    ChangeNotifierProvider<ParentDetailProvider>(create: (_) => ParentDetailProvider(),),


  ];

// static clearProviders() {
//   BuildContext context = Globals.appRouter.navigatorKey.currentContext!;
//
//   ///ToDo:add methods in providers to clear them and call them here (useful in logout etc.)
//   context.read<AuthenticationProvider>().clearProvider();
// }
}