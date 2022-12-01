import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/ui/student_basic_profile/whyjoin_screen.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../gen/assets.gen.dart';
import '../../utils/static/static_padding.dart';

class AgeSelectionScreen extends StatefulWidget {

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int _selectedItemIndex = 0;
  bool closeTopContainer = false;
  double topContainer = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gradientColorSplash, AppColors.bgPrimarySplash],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: context.heightPx * 64,
            ),
            Row(
              children: [
                InkWell(
                  onTap:()=>Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.only(left: context.heightPx * 49),
                    child: SvgPicture.asset(Assets.icons.backarrow),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    age,
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

            // Expanded(
            //     child: ListView.builder(
            //       scrollDirection: Axis.vertical,
            //         controller: controller,
            //         itemCount:20,
            //         physics: ScrollPhysics(),
            //         itemBuilder: (context, index) {
            //           double scale = 1.0;
            //           if (topContainer > 0.5) {
            //             scale = index + 0.5 - topContainer;
            //             if (scale < 0) {
            //               scale = 0;
            //             } else if (scale > 1) {
            //               scale = 1;
            //             }
            //           }
            //           return Opacity(
            //             opacity: scale,
            //             child: Transform(
            //               transform:  Matrix4.identity()..scale(scale,scale),
            //               alignment: Alignment.bottomCenter,
            //               child: Align(
            //                   heightFactor: 0.7,
            //                   alignment: Alignment.topCenter,
            //                   child:     Container(
            //                      child: Text(
            //                        '16',
            //                        textAlign: TextAlign.center,
            //                        style: TextStyle(
            //                          color: _selectedItemIndex==0?AppColors.darkBlue:AppColors.darkGreyColor,
            //                          fontSize: context.heightPx*27,
            //                          fontFamily: 'Mont',
            //                          fontWeight: FontWeight.w700,
            //                        ),
            //                      ),
            //                    ),
            //             ),
            //           ));
            //         })),

            Flexible(
              child: InkWell(
                onTap: () =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhyJoinScreen())),
                child:

                ListWheelScrollView.useDelegate(
                  itemExtent: 90,
                  onSelectedItemChanged: (index) => setState(() {
                    _selectedItemIndex = index;
                  }),

                  // diameterRatio: 1.6,
                  // offAxisFraction: -0.4,
                  // squeeze: 0.8,

                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '16',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 0 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '17',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 1 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '18',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 2 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '19',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 3 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '20',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 4 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '21',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 5 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '22',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 6 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '23',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 7 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '24',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 8 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '25',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 9 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '26',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 10 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '27',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 11 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '28',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 12 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '29',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 13 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text(
                          '30',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedItemIndex == 14 ? AppColors.darkBlue : AppColors.darkGreyColor,
                            fontSize: context.heightPx * 27,
                            fontFamily: 'Mont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WhyJoinScreen())),
                        child: Image.asset(Assets.icons.iconForward.path),
                      ),
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
