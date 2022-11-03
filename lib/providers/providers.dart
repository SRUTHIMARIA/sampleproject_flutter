import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DrawerScreenProvider>(
    create: (_) => DrawerScreenProvider(),
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
  ),


];
