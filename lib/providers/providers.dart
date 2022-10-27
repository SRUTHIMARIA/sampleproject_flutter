import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/login/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
  ),
  ChangeNotifierProvider<DrawerScreenProvider>(
    create: (_) => DrawerScreenProvider(),
  ),

];
