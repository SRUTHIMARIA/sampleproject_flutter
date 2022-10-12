import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

class SplashAnimationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgPrimarySplash
        // gradient: LinearGradient(
        //     colors: [
        //       AppColors.gradientColorSplash,
        //       AppColors.gradientColor3Splash,
        //
        //     ],
        //     begin: const FractionalOffset(1.0, 0.0),
        //     end: const FractionalOffset(1.0, 0.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp),
      ),
      child: Image.asset(
        Assets.images.atheleteSplash.path,
      ),
    );
  }
}
