import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

class FontData {
  const  FontData();

  double get fontMontserratMedium => 22.0;
  double get fontMontserratSmall => 8.0;
  double get fontMontserratSmall1 => 10.0;
  double get fontMontserratSmall2 => 12.0;
  double get fontMontserratSmall3 => 13.0;
  double get fontMontserratMedium1 => 14.0;
  double get fontMontserratMedium2 => 15.0;
  double get fontMontserratMedium3 => 16.0;
  double get fontMontserratMedium4 => 18.0;
  double get fontMontserratLarge => 20.0;
  double get fontMontserratLarge1 => 23.0;
  double get fontMontserratExtraLarge => 32.0;

  String get mtFontFamily => 'Roboto';

  TextStyle get mtTextStyle => TextStyle(fontFamily: mtFontFamily);

  TextStyle get montFont20TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratLarge,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.blackColor,

  );
  TextStyle get montFont14TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.greyColor,

  );

  TextStyle get montFont10TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.greyColor,

  );


}
