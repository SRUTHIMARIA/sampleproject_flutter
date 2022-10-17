import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/student_basic_profile/age_group_selection.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_widgets/sports_type_widgets.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import 'package:flutter_template/utils/theme/app_colors.dart';



class SportsTypeScreen extends StatefulWidget {
  const SportsTypeScreen({Key? key}) : super(key: key);

  @override
  State<SportsTypeScreen> createState() => _SportsTypeScreenState();
}

class _SportsTypeScreenState extends State<SportsTypeScreen> {
  int? selectedCategory;

  final List<Color> _colors = [
    AppColors.gradientColorSplash.withOpacity(0.48),
    AppColors.bgPrimarySplash
  ];
  final List<double> _stops = [0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(

        child: Container(
          // height: double.infinity,
          // width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            gradient: LinearGradient(
              colors: _colors,
            //   begin: Alignment.topRight, stops: [
            //   2.8,
            //   1.0,
            // ],


            ),
          ),
          child:
          Column(
            children: [
              SizedBox(
                height: context.heightPx * 64,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(

                    padding: StaticPadding.paddingH50(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        sports_type,
                        style:  FontData().montFont20TextStyle,
                      ),
                    )),
              ),
              SizedBox(
                height: context.heightPx * 6,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: StaticPadding.paddingH50(context),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      selectany,
                      style: const FontData().montFont14TextStyle,
                    ),
                  ),),
              ),
              SizedBox(
                height: context.heightPx * 22,
              ),

              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SportsTypeWidget(
                          nextLine: false,
                          label:  'BASKET BALL',
                          image: Assets.images.sportsBatminton,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  AgeGroupSelection(

                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(width: context.widthPx * 20),
                        SportsTypeWidget(
                          nextLine: false,
                          label:  'AFL',
                          image: Assets.images.sportsAfl,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  AgeGroupSelection(

                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),

          SizedBox(
            height: context.heightPx * 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SportsTypeWidget(
            nextLine: false,
            label:  'SOCCER',
            image: Assets.images.sportsSoccer,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AgeGroupSelection(

                  ),
                ),
              );
            },
          ),

          SizedBox(width: context.widthPx * 20),
          SportsTypeWidget(
            nextLine: false,
            label:  'CRICKET',
            image: Assets.images.sportsCricket,
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AgeGroupSelection(

                  ),
                ),
              );
            },
          ),

            ],
          ),
          SizedBox(
            height: context.heightPx * 20,
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'TENNIS',
                    image: Assets.images.sportsTennis,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'RUGBY UNION',
                    image: Assets.images.sportsRuby,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
              SizedBox(
                height: context.heightPx * 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'RUGBY LEAGUE',
                    image: Assets.images.sportsRubyLeague,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'SWIMMING',
                    image: Assets.images.sportsSwimming,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
              SizedBox(
                height: context.heightPx * 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'GYMNASTICS',
                    image: Assets.images.sportsGynastic,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'RUNNING',
                    image: Assets.images.sportsRunning,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
              SizedBox(
                height: context.heightPx * 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'NETBALL',
                    image: Assets.images.sportsNetball,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label:  'TOUCH FOOTBALL',
                    image: Assets.images.sportsTouchball,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AgeGroupSelection(

                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}