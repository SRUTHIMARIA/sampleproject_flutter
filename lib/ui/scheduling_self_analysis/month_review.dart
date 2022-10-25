import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/scheduling_self_analysis/self_analysis.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/theme/app_colors.dart';
import 'package:flutter_template/models/weekly_review_model/weekly_model.dart';

class MonthReview extends StatefulWidget {
  const MonthReview({Key? key}) : super(key: key);

  @override
  State<MonthReview> createState() => _MonthReviewState();
}

class _MonthReviewState extends State<MonthReview> {
  bool isChecked = false;
  bool isCheckedNo = false;
  bool isDisplay = false;
  bool isAgree = false;
  double value = 1;
  int? selectedIndex;
  bool enabled=false;


  final categories = [
    'Sports',
    'Family',
    'Health',
    'Hobbies',
    'Confidence',
    'Preparation',
    'Stress',
  ];

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
                          monthReview,
                          style: const FontData().montFont70020TextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 27,
                  ),
                  Container(
                    height: context.heightPx * 100,
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
                        hintText: learned,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 18,
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
                        focusColor: AppColors.textFieldBgColor,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        fillColor: AppColors.textFieldBgColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                        hintText: forward,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 18,
                  ),

                  Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: context.widthPx * 60.0),
                      child: Text(
                        'Category',
                        style: FontData().montFont70016BlackTextStyle,
                      )),
                  SizedBox(
                    height: context.heightPx * 16,
                  ),
                  InkWell(
                    onTap: enabled ? () {} : null,
                    child: Container(
                      height: 50,
                      margin: StaticPadding.paddingH60(context),
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (BuildContext context, int index) =>

                              InkWell(
                                child: Container(
                                  margin: StaticPadding.paddingH10(context),
                                  padding: StaticPadding.paddingH30(context),
                                  decoration: BoxDecoration(
                                    color: enabled ? AppColors.whiteColor : AppColors.themeColor,
                                    gradient: LinearGradient(colors: [
                                      AppColors.themeColor.withOpacity(0.76), AppColors.categoryGradient.withOpacity(0.63),
                                    ]),
                                    borderRadius:BorderRadius.circular(16.0),
                                  ),

                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(categories[index],style:TextStyle(
                                        fontSize: context.heightPx *14,
                                        fontFamily: 'Mont',
                                        fontWeight: FontWeight.w500,
                                        color:  enabled?AppColors.themeColor:AppColors.whiteColor,
                                      ))),
                                ),
                              )
                      ),),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  SizedBox(
                    height: context.heightPx * 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: StaticPadding.paddingH60(context),
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          sports,
                          style: const FontData().montFont50014TextStyle,
                        ),
                      ),
                      Container(
                        padding: StaticPadding.paddingH60(context),
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          fourByfive,
                          style: const FontData().montFont50014TextStyle,
                        ),
                      ),
                    ],
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
                  SizedBox(height: context.heightPx*20,),

                  Container(
                    height: context.heightPx *48,


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
                        contentPadding: EdgeInsets.only(left: 20.0,),

                        hintText: nextFocus,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),

                  SizedBox(height: context.heightPx*20,),







                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SelfAnalysis()));
                    },
                    child: Center(
                      child: Container(
                        height: context.heightPx * 50,
                        margin: EdgeInsets.symmetric(
                            horizontal: context.widthPx * 56.0),
                        width: context.widthPx * 276,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
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
            )),
      ),
    );
  }
}
