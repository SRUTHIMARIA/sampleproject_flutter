import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/student_basic_profile/age_selection_widget/age_selection_widget.dart';
import 'package:flutter_template/ui/student_basic_profile/sports_type_widgets/sports_type_widgets.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
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
    AppColors.bgPrimarySplash
  ];
  final List<double> _stops = [0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gradientColorSplash, AppColors.bgPrimarySplash])),
          child: Scaffold(
              // By defaut, Scaffold background is white
              // Set its value to transparent
              backgroundColor: Colors.transparent,
              body:
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
                            AgeSelectionWidget(
                              nextLine: false,
                              label:  '5-14',
                              image: Assets.images.childrenPng.path,
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
                            AgeSelectionWidget(
                              nextLine: false,
                              label:  '15-25',
                              image: Assets.images.teenPng.path,
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
                      AgeSelectionWidget(
                        nextLine: false,
                        label:  '26-40',
                        image: Assets.images.young.path,
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
                      AgeSelectionWidget(
                        nextLine: false,
                        label:  '41-60',
                        image: Assets.images.oldPng.path,
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
        );
  }
}
