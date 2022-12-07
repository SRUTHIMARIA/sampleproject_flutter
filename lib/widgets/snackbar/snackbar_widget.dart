// ignore_for_file: long-parameter-list
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/theme/app_colors.dart';

class AppSnackBar {
  static void showSnackBarWithText({
    required BuildContext context,
    required String text,
    Duration? duration,
    Color? backgroundColor,
    SnackBarBehavior? behavior,
    Color? textColor,
  }) {
    duration ??= const Duration(milliseconds: 2100);
    backgroundColor ??= AppColors.blackColor;
    textColor ??= AppColors.whiteColor;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Image.asset(
            Assets.images.atheleteSplash.path,
            width: context.widthPx * 15,
            height: context.heightPx * 15,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(
            width: context.widthPx * 10,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: behavior ?? SnackBarBehavior.floating,
    ));
  }
}
