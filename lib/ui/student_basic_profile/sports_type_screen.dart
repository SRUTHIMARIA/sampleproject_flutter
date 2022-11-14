import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/sports_type_model/sports_category_model.dart';
import 'package:flutter_template/ui/student_basic_profile/age_group_selection.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_widgets/sports_type_widgets.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
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


  final List<Color> _colors = [AppColors.gradientColorSplash.withOpacity(0.48), AppColors.bgPrimarySplash];

  int isSelected = -1; // changed bool to int and set value to -1 on first time if you don't select anything otherwise set 0 to set first one as selected.


  _isSelected(int index) {
    //pass the selected index to here and set to 'isSelected'
    setState(() {
      isSelected = index;
    });
  }

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
          child: Column(
            children: [
              SizedBox(
                height: context.heightPx * 64,
              ),
              Align(
                alignment: Alignment.centerLeft,

                child: Container(
                  padding: StaticPadding.paddingH50(context),

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    sports_type,
                    style: FontData().montFont20TextStyle,
                  ),
                ),),

              SizedBox(
                height: context.heightPx * 6,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: StaticPadding.paddingH50(context),

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    selectany,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),
              ),

              SizedBox(
                height: context.heightPx * 22,
              ),


              //
              //  GridView.builder(
              //    itemCount: SportsCategoryModel.,
              //       shrinkWrap: true,
              //       crossAxisCount: 2,
              //       childAspectRatio: 2.0,
              //       children: List.generate(12, (index) =>
              //          SportsTypeWidget(
              //                         nextLine: false,
              //                         label: 'AFL',
              //                         image: Assets.images.sportsAfl,
              //                         onPress: () =>
              //                           Navigator.push(
              //                             context,
              //                             MaterialPageRoute(
              //                               builder: (context) => AgeGroupSelection(),
              //                             ),
              //                           ),
              //
              //                       ),
              //       ),
              //
              //
              // ),

              Container(
                child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SportsTypeWidget(
                          nextLine: false,
                          label: 'BASKET BALL',
                          image: Assets.images.sportsBatminton,
                          onPress: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgeGroupSelection(),
                              ),
                            ),
                        ),
                        SizedBox(width: context.widthPx * 20),
                        SportsTypeWidget(
                          nextLine: false,
                          label: 'AFL',
                          image: Assets.images.sportsAfl,
                          onPress: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgeGroupSelection(),
                              ),
                            ),

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
                    label: 'SOCCER',
                    image: Assets.images.sportsSoccer,
                    onPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgeGroupSelection(),
                      ),
                    ),
                  ),
                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label: 'CRICKET',
                    image: Assets.images.sportsCricket,
                    onPress: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgeGroupSelection(),
                      ),
                    ),
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
                    label: 'TENNIS',
                    image: Assets.images.sportsTennis,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),

                  ),
                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label: 'RUGBY UNION',
                    image: Assets.images.sportsRuby,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),

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
                    label: 'RUGBY LEAGUE',
                    image: Assets.images.sportsRubyLeague,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),

                  ),
                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label: 'SWIMMING',
                    image: Assets.images.sportsSwimming,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),

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
                    label: 'GYMNASTICS',
                    image: Assets.images.sportsGynastic,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),

                  ),
                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label: 'RUNNING',
                    image: Assets.images.sportsRunning,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),
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
                    label: 'NETBALL',
                    image: Assets.images.sportsNetball,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),
                  ),
                  SizedBox(width: context.widthPx * 20),
                  SportsTypeWidget(
                    nextLine: false,
                    label: 'TOUCH FOOTBALL',
                    image: Assets.images.sportsTouchball,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeGroupSelection(),
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(
                height: context.heightPx * 22,
              ),


              Stack(
                children: [

                  TranslationAnimatedWidget.tween(
                    // enabled: _display,
                    translationDisabled: const Offset(200, 0),
                    translationEnabled: const Offset(0, 0),
                    child: TranslationAnimatedWidget.tween(
                      // opacityEnabled: 1, //define start value
                      // opacityDisabled: 0, //and end value
                      duration: const Duration(milliseconds: 5),

                      translationDisabled: const Offset(100, 100),
                      translationEnabled: const Offset(0, 0),
                      // enabled: _display,
                      curve: Curves.ease,
                      //bind with the boolean
                      child: Container(

                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: InkWell(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AgeGroupSelection())),

                          child: Image.asset(Assets.icons.iconForward.path),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.heightPx * 22,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
