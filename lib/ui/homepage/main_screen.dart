import 'package:flutter/material.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/ui/homepage/app_drawer.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.lightBlue, Colors.lightGreen])),
        child: context.watch<DrawerScreenProvider>().currentScreen,
      ),
    );
  }
}