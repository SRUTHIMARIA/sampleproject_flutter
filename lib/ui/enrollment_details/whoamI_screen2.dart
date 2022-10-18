import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class WhoAmIScreenTwo extends StatefulWidget {
  const WhoAmIScreenTwo({Key? key}) : super(key: key);

  @override
  State<WhoAmIScreenTwo> createState() => _WhoAmIScreenTwoState();
}

class _WhoAmIScreenTwoState extends State<WhoAmIScreenTwo> {
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
                    Container(
                      margin: EdgeInsets.only(left: context.heightPx * 49),
                      child: SvgPicture.asset(Assets.icons.iconBackarrow),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        whoamI,
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
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: values,

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
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: motivated,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 56),
                  child: Text(
                    peopleInspire,
                    style: FontData().montFont500TextStyle,
                  ),),
                SizedBox(
                  height: context.heightPx * 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: AppColors.textFieldBgColor,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: AppColors.textFieldBgColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      hintText: name,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
                Container(
                  height: context.heightPx * 100,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          child: Image.asset(Assets.images.uploadedImage.path)),
                      SizedBox(
                        height: context.heightPx * 6,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: TextFormField(


                            style: const FontData().montFont500TextStyle,
                            decoration: InputDecoration(
                              focusColor: AppColors.textFieldBgColor,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),

                              fillColor: AppColors.textFieldBgColor,
                              contentPadding: EdgeInsets.only(left: 4.0),
                              hintText: inspire,

                              //make hint text
                              hintStyle: const FontData().montFont500TextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
            Align(
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



              ],
            ),
          ),
        ),
      ),
    );
  }
}
