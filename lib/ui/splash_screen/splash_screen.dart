import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/splash_screen/splash_animation.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../services/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
          ()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashAnimationScreen())),
    );

  }

  // void loadData() async {
  //   await Future.delayed(const Duration(seconds: 3),
  //       {}>Navigator.push(context,  SplashAnimationScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgPrimarySplash,
      child: Image.asset(
        Assets.images.atheleteSplash.path,


      ),
    );
  }
}
