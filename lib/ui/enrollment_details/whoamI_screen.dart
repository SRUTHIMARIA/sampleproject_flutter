import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen2.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
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
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,//Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: InputBorder.none,

                      fillColor: AppColors.textFieldBgColor,

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
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,//Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),

                      fillColor: AppColors.textFieldBgColor,
                      focusedBorder: InputBorder.none,

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
                InkWell(
                  onTap: ()=>
                    showModalBottomSheet(
                      context: context,

                      backgroundColor: Colors.transparent,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight:Radius.circular(30.0),topLeft:Radius.circular(30.0)),
                      ),
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            height: context.heightPx*260,
                            decoration: BoxDecoration(
                              color: AppColors.textFieldBgColor,

                              borderRadius: BorderRadius.only(topRight:Radius.circular(30.0),topLeft:Radius.circular(30.0)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: context.heightPx*40,),
                                InkWell(
                                  onTap: ()=>
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WhoAmIScreenTwo())),
                                  child: DecoratedBox(
                                    position: DecorationPosition.background,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                          offset: Offset(5, 0),
                                        ),
                                      ],
                                    ),
                                    child: Container(

                                      width: context.widthPx*276,
                                      height: context.heightPx *155,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),

                                      ),

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(

                                            child: Image.asset(Assets.images.imageAddphoto.path),

                                          ),
                                          Container(
                                            // margin: const EdgeInsets.symmetric(horizontal: 56),
                                            child: Text(
                                              uploadphoto,
                                              style: FontData().montFont70012TextStyle,
                                            ),),
                                        ],
                                      ),
                                    ),


                                  ),
                                ),],
                            ),
                          ),
                        );
                      },
                    ),
                  child: Container( margin: const EdgeInsets.symmetric(horizontal: 56),
                      child: Image.asset(Assets.images.imageAddphoto.path),),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Container( margin: const EdgeInsets.symmetric(horizontal: 56),
                    child: Image.asset(Assets.images.imageWhoamI.path),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
