import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

class SplashAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: AppColors.gradientColor1.withOpacity(0.76),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                // color: AppColors.bgPrimarySplash,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.bgPrimarySplash, AppColors.bgPrimarySplash]
                  ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Image.asset(
                Assets.images.atheleteSplash.path,


              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Container(
                    child: Text('THE ASSIST ATHLETE\n - GROWTH MINDSET\n JOURNEY',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Mont',
                        fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  SizedBox(height: 30,),
                  InkWell(onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                      child: Image.asset(Assets.icons.iconForwardPng.path)),

                  //Image.asset(Assets.icons.iconForward.path),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
