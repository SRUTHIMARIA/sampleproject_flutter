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
  TextStyle get montFont13TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.lightGreyColor,

  );
  TextStyle get montFont500TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.textGrey,

  );
  TextStyle get montFont60014TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.grey,

  );
  TextStyle get montFont60018TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium4,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.darkGreen,

  );
  TextStyle get montFont70012TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.textGrey,

  );
  TextStyle get montFont50012BlackTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.blackColor,

  );
  TextStyle get montFont50012GreyColorTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.grey,

  );
  TextStyle get montFont50012GreyTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.popTextGrey,

  );
  TextStyle get montFont50012GreyLightTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'MontLight',
   // fontWeight: FontWeight.w500,
    color:  AppColors.popTextGrey,

  );
  TextStyle get montFont50012WhiteTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.whiteColor,

  );
  TextStyle get montFont70016GreyTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.darkGreyColor,

  );
  TextStyle get montFont70016TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.whiteColor,

  );
  TextStyle get montFont70016ThemeColorTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.themeColor,

  );
  TextStyle get montFont70018TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.darkGreen,

  );
  TextStyle get montFont70014TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratMedium3,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w700,
    color:  AppColors.themeColor,

  );

  TextStyle get montFont50012TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.themeColor,

  );
  TextStyle get montFont60012TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.darkGreyColor,

  );

  TextStyle get montFont60012offwhiteTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall2,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.offWhite,

  );
  TextStyle get montFont60010offwhiteTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w600,
    color:  AppColors.offWhite,

  );
  TextStyle get montFont4008offwhiteTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w400,
    color:  AppColors.offWhite,

  );
  TextStyle get montFont40010offwhiteTextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall1,
    fontFamily: 'Mont',
    // fontWeight: FontWeight.w400,
    color:  AppColors.offWhite,

  );
  TextStyle get montFont50010TextStyle => mtTextStyle.copyWith(
    fontSize: fontMontserratSmall1,
    fontFamily: 'Mont',
    fontWeight: FontWeight.w500,
    color:  AppColors.darkGreyColor,

  );


}
