import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/self_analyisis_notes.dart';


import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class MyCurrentMindSet extends StatefulWidget {
  const MyCurrentMindSet({Key? key}) : super(key: key);

  @override
  State<MyCurrentMindSet> createState() => _MyCurrentMindSetState();
}

class _MyCurrentMindSetState extends State<MyCurrentMindSet> {
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
                        currentmindset,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 35,
                ),
                Container(
                  padding: StaticPadding.paddingH60(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    rate,
                    style: const FontData().montFont500TextStyle,
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH60(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    prettyPositive,
                    style: const FontData().montFont50010TextGreyTextStyle,
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 12,
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


                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val as double;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "1",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "2",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "3",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "4",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "5",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightPx *6,
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          bearlyEver,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          sometimes,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          allofthem,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH60(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    manageTraining,
                    style: const FontData().montFont50010TextGreyTextStyle,
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 12,
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


                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val as double;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "1",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "2",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "3",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "4",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "5",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightPx *6,
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          nevermum,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          sometimes,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          yesalltime,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  padding: StaticPadding.paddingH60(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    feelHappy,
                    style: const FontData().montFont50010TextGreyTextStyle,
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 12,
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


                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val as double;
                        });
                      },
                    ),
                  ),
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "1",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "2",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "3",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "4",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          "5",
                          style: const FontData().montFont50012DarkTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightPx *6,
                ),

                Container(
                  padding: StaticPadding.paddingH30(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          disagree,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          sometimes,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                      Container(
                        child: Text(
                          absolutely,
                          style: const FontData().montFont50010TextGreyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: context.heightPx * 26,
                ),





                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelfAnalysisNotes()));

                    },
                    child: Container(
                      height: context.heightPx * 45,
                      width: context.widthPx * 320,
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