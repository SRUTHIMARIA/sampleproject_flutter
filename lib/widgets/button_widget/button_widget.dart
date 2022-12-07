import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/text/text_style.dart';


class ButtonWidget extends StatelessWidget {
  final String label;
  final Function()? onPress;
  final bool disable;
  final bool border;
  final Color color;
  final Color disabledColor;
  final Widget socialMediaIcon;
  final bool showIcon;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final double textSize;

  const ButtonWidget({
    Key? key,
    required this.label,
    this.disable = false,
    this.color = AppColors.themeColor,
    this.disabledColor = AppColors.darkGreyColor,
    this.radius = 6,
    this.textSize = 20,
    this.onPress,
    this.textColor = AppColors.whiteColor,
    this.border = false,
    required this.socialMediaIcon,
    this.showIcon = false,
    this.borderColor = AppColors.darkGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IgnorePointer(
        ignoring: disable,
        child: TextButton(
          style: !border
              ? TextButton.styleFrom(
            foregroundColor: Colors.black, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
            backgroundColor: color,
            enableFeedback: false,
          )
              : TextButton.styleFrom(
            foregroundColor: disable ? AppColors.themeColor : AppColors.darkGreen, shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(radius),
          ),
            backgroundColor: color,
            enableFeedback: false,
          ),
          onPressed: disable ? null : onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showIcon) socialMediaIcon else const SizedBox(),
              if (showIcon)
                SizedBox(
                  width: context.widthPx * 5,
                )
              else
                const SizedBox(),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextFontStyle.normal(
                  color: disable
                      ? disabledColor
                      : (onPress == null)
                      ? disabledColor
                      : textColor,
                  size: context.textPx * textSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
