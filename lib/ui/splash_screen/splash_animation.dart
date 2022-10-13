import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

class SplashAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgPrimarySplash,
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
            child: Container(
            ),
          ),
        ],
      ),
    );
  }
}
