
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../utils/constants/fontdata.dart';


class UserReview extends StatefulWidget {
  const UserReview({Key? key}) : super(key: key);

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
          ()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WhoAmIScreen())),
    );

  }

  // void loadData() async {
  //   await Future.delayed(const Duration(seconds: 3),
  //       {}>Navigator.push(context,  SplashAnimationScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
          // gradient: LinearGradient(
          //   colors: _colors,
          //   stops: _stops,
          //
          //
          // ),
        ),
        child: SingleChildScrollView(

          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: context.heightPx * 36,
                ),
                Image.asset(Assets.images.imageUserReview.path),

                SizedBox(
                  height: context.heightPx * 12,
                ),

                Container(

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    underReview,
                    style: const FontData().montFont20TextStyle,
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 12,
                ),
            Container(

              margin: EdgeInsets.only(left: 12.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  underReviewSub,
                  style: const FontData().montFont13TextStyle,
                ),
              ),
            ),







              ],
            ),
          ),
        ),
      ),
    );
  }
}

