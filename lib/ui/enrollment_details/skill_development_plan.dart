import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/enrollment_details/self_evaluation_quiz.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen2.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class SkillDevelopmentPlan extends StatefulWidget {
  const SkillDevelopmentPlan({Key? key}) : super(key: key);

  @override
  State<SkillDevelopmentPlan> createState() => _SkillDevelopmentPlanState();
}

class _SkillDevelopmentPlanState extends State<SkillDevelopmentPlan> {
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
                        skilldevplan,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 37,
                ),
                Container(
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

                      hintText: focusedSkill,

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

                      hintText: todo,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx *70,
                ),



                Stack(
                  clipBehavior: Clip.hardEdge,
                 children: [
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(

                       margin: const EdgeInsets.symmetric(horizontal: 56),
                       child: Image.asset(

                           Assets.images.imageSkillplan.path,
                      ),),
                   ),
                   Positioned(
                     bottom: context.heightPx*10,
                     left: context.heightPx*80,
                     child:  InkWell(
                     onTap: (){
                    showDialog(
                          barrierDismissible: true,
                          barrierColor: Colors.transparent,
                          context: context, builder: (BuildContext context)
                      {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: BackdropFilter(

                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: AlertDialog(

                              backgroundColor: AppColors.textFieldBgColor,
                              scrollable: true,
                              title: Text(popupquote1,style: FontData().montFont50012GreyTextStyle,),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: context.heightPx *8,
                                      ),

                                      Text(popupquote2,style: FontData().montFont50012GreyTextStyle,),
                                      SizedBox(
                                        height: context.heightPx *8,
                                      ),

                                      Text(popupquote3,style: FontData().montFont50012GreyTextStyle,),

                                      SizedBox(
                                        height: context.heightPx * 20,
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
                                                  gotit,
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
                          ),
                        );
                      });
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
                               add,
                               // _display ? "hide logo" : "display logo",
                               style: const FontData().montFont70016TextStyle,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),),
                 ],

                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
