import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/self_analysis.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/static/static_padding.dart';
import '../../utils/theme/app_colors.dart';

class DailyReflection extends StatefulWidget {
  const DailyReflection({Key? key}) : super(key: key);

  @override
  State<DailyReflection> createState() => _DailyReflectionState();
}

class _DailyReflectionState extends State<DailyReflection> {
  bool isChecked = false;
  bool isCheckedNo=false;
  bool isDisplay=false;
  bool isAgree=false;

  final List<Color> _colors = [
    AppColors.gradientColorSplash,
    AppColors.gradientColor2Splash
  ];
  final List<double> _stops = [0.0, 0.7];

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                          dailyReflection,
                          style: const FontData().montFont70020TextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),

                  isChecked?Container(
                    height: context.heightPx *60,
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(

                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: quote1,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  )
                : isChecked?SizedBox(
                    height: context.heightPx *10,
                  ):SizedBox(
                    height: context.heightPx *40,
                  ),
                  SizedBox(height: context.heightPx*20,),
                  isChecked?Container(
                    height: context.heightPx *60,
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(

                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: quote1,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  )
                      : SizedBox(
                    height: context.heightPx *40,
                  ),
                  SizedBox(height: context.heightPx*20,),

                  Container(
                    height: context.heightPx *60,

                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(

                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: today,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),

                  SizedBox(height: context.heightPx*16,),

                 InkWell(
                    onTap: (){
                      setState(() {
                        isChecked=isChecked!;
                      });

                    },
                    child: Container(
                      height: context.heightPx * 42,
                      margin: EdgeInsets.symmetric(horizontal:context.widthPx* 60.0),
                      width: context.widthPx * 135,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                        child: Center(
                          child: Text(
                            add,
                            // _display ? "hide logo" : "display logo",
                            style: const FontData().montFont70016TextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: context.heightPx*20,),

                 Container(
                   height: context.heightPx *60,

                   margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(

                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                       hintText: tommorrow,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),


                  SizedBox(height: context.heightPx*20,),

                  Container(
                    height: context.heightPx *60,

                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(

                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: acheive,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),

                  SizedBox(height: context.heightPx*20,),



                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelfAnalysis()));

                    },
                    child: Center(
                      child: Container(
                        height: context.heightPx * 45,
                        margin: EdgeInsets.symmetric(horizontal:context.widthPx* 60.0),
                        width: context.widthPx * 276,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                          child: Center(
                            child: Text(
                              submit,
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



            )),),);
  }
}