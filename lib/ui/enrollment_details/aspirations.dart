import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/enrollment_details/self_evaluation_quiz.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen2.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class Aspirations extends StatefulWidget {
  const Aspirations({Key? key}) : super(key: key);

  @override
  State<Aspirations> createState() => _AspirationsState();
}

class _AspirationsState extends State<Aspirations> {
  bool isAgree = false;

  // final List<Color> _colors = [
  //   AppColors.gradientColorSplash,
  //   AppColors.gradientColor2Splash
  // ];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: context.heightPx * 49),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        aspirations,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 37,
                ),
                Container(
                  height: context.heightPx * 120,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: sixmonths,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
                Container(
                  height: context.heightPx * 120,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: twelevemonths,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
          


                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(

                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    child: Image.asset(Assets.images.imageAspiration.path),),
                ),

                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelfEvaluationQuiz()));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: context.heightPx * 42,
                      width: context.widthPx * 280,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                        child: Center(
                          child: Text(
                            save,
                            // _display ? "hide logo" : "display logo",
                            style: const FontData().montFont70016TextStyle,
                          ),
                        ),
                      ),
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
