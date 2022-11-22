import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isAgree = false;
  double percent = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
        ),
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
                    onTap: () =>
                      Navigator.pop(context),

                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 49),
                      child: SvgPicture.asset(Assets.icons.iconBackarrow),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      settings,
                      style: const FontData().montFont20TextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.heightPx * 37,
              ),
              Container(
                height:context.widthPx*100,
                width:context.widthPx*400,
                padding: StaticPadding.paddingH30(context),
                margin: StaticPadding.paddingH30(context),
                decoration: BoxDecoration(
                  color:  AppColors.themeColor,
                  borderRadius:  const BorderRadius.all(Radius.circular(10.0),),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.buttonGradient1.withOpacity(0.32),
                      AppColors.buttonGradient2.withOpacity(0.26),

                    ],
                  ),

                ),
                child: Row(

                  children: [
                    SvgPicture.asset(Assets.icons.iconPasscode),
                    SizedBox(width: context.widthPx *6,),

                    Text(
                      'Passcode',
                      style: const FontData().montFont50012GreenTextStyle,
                    ),
                    SizedBox(width: context.widthPx *226,),
                    Image.asset(Assets.icons.iconToggle.path),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
