import 'package:flutter_template/providers/chat_provider/chat_provider.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DrawerScreenProvider>(
    create: (_) => DrawerScreenProvider(),
  ),
  ChangeNotifierProvider<ChatProvider>(
    create: (_) => ChatProvider(),
  ),
  ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
  ),



];
