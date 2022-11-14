import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/student_basic_profile/age_selection.dart';
import 'package:flutter_template/ui/student_basic_profile/age_selection_widget/age_selection_widget.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import 'package:flutter_template/utils/theme/app_colors.dart';

class AgeGroupSelection extends StatefulWidget {
  const AgeGroupSelection({Key? key}) : super(key: key);

  @override
  State<AgeGroupSelection> createState() => _AgeGroupSelectionState();
}

class _AgeGroupSelectionState extends State<AgeGroupSelection> {
  final List<Color> _colors = [
    AppColors.gradientColorSplash.withOpacity(0.48),
    AppColors.bgPrimarySplash,
  ];
  final List<double> _stops = [0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            AppColors.gradientColorSplash,
            AppColors.bgPrimarySplash,
          ],),),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: context.heightPx * 64,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () =>Navigator.pop(context),

                  child: Container(
                    margin: EdgeInsets.only(left: context.heightPx * 49),
                    child: SvgPicture.asset(Assets.icons.backarrow),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    ageGroup,
                    style: FontData().montFont20TextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.heightPx * 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
                child: Container(
                  padding: StaticPadding.paddingH50(context),

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    understandPeersonality,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),
              ),

            SizedBox(
              height: context.heightPx * 22,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: context.heightPx * 49),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AgeSelectionWidget(
                          nextLine: false,
                          label: '5-14',
                          image: Assets.images.childrenPng.path,
                          onPress: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgeSelectionScreen(),
                              ),
                            ),

                        ),
                        SizedBox(width: context.widthPx * 20),
                        AgeSelectionWidget(
                          nextLine: false,
                          label: '15-25',
                          image: Assets.images.teenPng.path,
                          onPress: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgeSelectionScreen(),
                              ),
                            ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.heightPx * 20,
            ),
            Container(
              margin: EdgeInsets.only(left: context.heightPx * 49),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AgeSelectionWidget(
                    nextLine: false,
                    label: '26-40',
                    image: Assets.images.young.path,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeSelectionScreen(),
                        ),
                      ),

                  ),
                  SizedBox(width: context.widthPx * 20),
                  AgeSelectionWidget(
                    nextLine: false,
                    label: '41-60',
                    image: Assets.images.oldPng.path,
                    onPress: () =>
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeSelectionScreen(),
                        ),
                      ),

                  ),
                ],
              ),
            ),
            SizedBox(height: context.heightPx * 340),


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
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AgeSelectionScreen())),

                        child: Image.asset(Assets.icons.iconForward.path),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
