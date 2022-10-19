import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/enrollment_details/skill_development_plan.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen2.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class SelfEvaluationQuiz extends StatefulWidget {
  const SelfEvaluationQuiz({Key? key}) : super(key: key);

  @override
  State<SelfEvaluationQuiz> createState() => _SelfEvaluationQuizState();
}

class _SelfEvaluationQuizState extends State<SelfEvaluationQuiz> {
  bool isAgree = false;
  static double _lowerValue = 10.0;
  static double _upperValue = 40.0;

  double brightness = 10.0;

RangeValues values=RangeValues(_lowerValue, _upperValue);

  double value = 1;
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
                        selfEvaluation,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 37,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    rateyourself,
                    style: const FontData().montFont500TextStyle,
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    quotes,
                    style: const FontData().montFont50010TextStyle,
                  ),
                ),
            Container(
              padding: StaticPadding.paddingH50(context),

              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 12,
                  overlayColor: Colors.transparent,
                  minThumbSeparation: 100,
                  rangeThumbShape: RoundRangeSliderThumbShape(
                    enabledThumbRadius: 10,
                    disabledThumbRadius: 10,
                  ),
                ),
                child: Slider(
                    activeColor: AppColors.themeColor,
                    inactiveColor: AppColors.whiteColor,
                    thumbColor: AppColors.themeColor,
                  label: "$value",
                  // min: _lowerValue,
                  // max: _upperValue,
                  divisions: 5,

                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val as double;
                    });
                  },
                ),
              ),
            ),
                // Slider(
                //   min: 0.0,
                //   max: 100.0,
                //   activeColor: AppColors.slidercolor.withOpacity(0.75),
                //   inactiveColor: Colors.purple.shade100,
                //   thumbColor: AppColors.themeColor,
                //   divisions: 4,
                //   value: value,
                //   label: "$value",
                //   onChanged: (value) {
                //     setState(() {
                //       value = value;
                //     });
                //   },
                // ),

                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    quotes2,
                    style: const FontData().montFont50010TextStyle,
                  ),
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 12,
                      overlayColor: Colors.transparent,
                      minThumbSeparation: 100,
                      rangeThumbShape: RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10,
                        disabledThumbRadius: 10,
                      ),
                    ),
                    child: Slider(
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.whiteColor,
                      thumbColor: AppColors.themeColor,

                      label: "$value",
                      // min: _lowerValue,
                      // max: _upperValue,
                      divisions: 5,

                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val as double;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    quotes3,
                    style: const FontData().montFont50010TextStyle,
                  ),
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 12,
                      overlayColor: Colors.transparent,
                      minThumbSeparation: 100,
                      rangeThumbShape: RoundRangeSliderThumbShape(
                        enabledThumbRadius: 10,
                        disabledThumbRadius: 10,
                      ),
                    ),
                    child: Slider(
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.whiteColor,
                      thumbColor: AppColors.themeColor,
                      label: "$value",
                      divisions: 5,

                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val as double;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 26,
                ),

                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SkillDevelopmentPlan()));

                    },
                    child: Container(
                      height: context.heightPx * 42,
                      width: context.widthPx * 280,
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
          ),
        ),
      ),
    );
  }
}
