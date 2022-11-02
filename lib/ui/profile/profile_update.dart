import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/category_model.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  bool isAgree = false;
  double percent = 0.0;

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
        child: Container(
          child: Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
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
                        profile,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 37,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(Assets.images.imageUser.path),
                    ),
                    Positioned(
                        top: context.heightPx * 80,
                        right: context.heightPx * 180,
                        child: Image.asset(Assets.images.imagePicker.path)),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 16,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Robert Fox',
                      style: FontData().montFont70018TextStyle,
                    )),
                SizedBox(
                  height: context.heightPx * 72,
                ),
                Container(
                  height: context.heightPx * 200,
                  margin: StaticPadding.paddingH30(context),
                  padding: EdgeInsets.only(bottom: context.widthPx *18),
                  // padding: StaticPadding.paddingH25V10(context),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: StaticPadding.paddingH25V10(context),
                        child: Text(
                          'Profile Strength',
                          style: FontData().montFont50012GreenTextStyle,
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(left: 12),
                        width: context.widthPx *360,
                        height: 40,
                        child:
                        LinearPercentIndicator(
                          padding: EdgeInsets.only(left:12.0),
                          barRadius: Radius.circular(10.0),
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 1.0,
                          trailing: Container(
                            margin: const EdgeInsets.symmetric(horizontal:4.0),
                            child:
                            Text('100%',style: const FontData().montFont70023TextStyle,),

                          ),
                          //center: Text("90.0%"),
                          linearStrokeCap: LinearStrokeCap.butt,
                          progressColor: AppColors.themeColor,
                        ),


                      ),

                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder:  (BuildContext context, int index) {
                            return Container(
                              margin:EdgeInsets.symmetric( horizontal:context.widthPx *10),
                              child: Row(
                                children: [
                                  Container(
                                    width: context.widthPx*236,
                                    decoration: BoxDecoration(
                                      color: AppColors.themeColor,
                                      borderRadius:BorderRadius.circular(12.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(margin: EdgeInsets.symmetric(horizontal: context.heightPx *12,vertical: context.heightPx *8),
                                                  child: Text('Update your enrollment details...',style: const FontData().montFont60012WhiteTextStyle,)),
                                              Container(margin: EdgeInsets.symmetric(horizontal: context.heightPx *12,vertical:context.heightPx *6),
                                                  child: Text('Nulla Lorem mollit cupidatat irure.\nLaborum magna nulla duis ullamco...',style: const FontData().montFont50010WhiteTextStyle,)),

                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: context.heightPx *12,vertical: context.heightPx *6),
                                                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                                                decoration: BoxDecoration(
                                                  color:  AppColors.themeColor,
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppColors.whiteColor.withOpacity(0.20),
                                                      AppColors.whiteColor.withOpacity(0.60),

                                                    ],
                                                  ),

                                                ),
                                                child: Text('Update',style: FontData().montFont70012ThemeColorTextStyle,),

                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },


                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: context.heightPx * 18,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  child: Text(
                    'Category',
                    style: FontData().montFont50014GreenTextStyle,
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 14,
                ),
            Container(

                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,

                      itemCount: categoryDetails.length,
                      itemBuilder: (context, i) =>
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(

                              // margin: EdgeInsets.symmetric(horizontal: context.heightPx *12,vertical: context.heightPx *6),
                            // padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              decoration: BoxDecoration(
                                color:  AppColors.themeColor,
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.whiteColor.withOpacity(0.20),
                                    AppColors.whiteColor.withOpacity(0.60),

                                  ],
                                ),

                              ),
                              // height: context.heightPx*73,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  SvgPicture.asset(categoryDetails[i].image),
                                  Text(categoryDetails[i].category,style: FontData().montFont50010darkGreenTextStyle,),
                                ],

                              ),
                            ),
                          )),
                )),
                SizedBox(
                  height: context.heightPx * 24,
                ),

                ],
            ),
          ),
        ),
      ),
    );
  }
}
