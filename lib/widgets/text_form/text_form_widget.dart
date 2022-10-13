import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../text/text_style.dart';


class TextFormWidget extends StatelessWidget {
  final String labelText;
  final TextInputType? keyboard;
  final TextInputAction? textInputAction;
  final bool edit;
  final String prefix;
  final String suffix;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry padding;
  final String? Function(String?)? validation;
  // final TextEditingController controller;
  final Widget? iconButton;
  final Function(String)? onChange;
  final int maxLength;
  final bool obscureText;
  final double height;
  final double radius;
  final EdgeInsetsGeometry? contentPadding;

  const TextFormWidget({
    Key? key,
    required this.labelText,
    this.edit = true,
    // required this.controller,
    this.keyboard,
    this.textInputAction,
    this.validation,
    this.onChange,
    this.maxLength = 500,
    this.iconButton,
    this.obscureText = false,
    this.padding = EdgeInsets.zero,
    this.height = 25,
    this.radius = 8,
    this.contentPadding,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.prefix = "",
    this.suffix = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        enabled: edit,
        keyboardType: keyboard,
        //controller: controller,
        validator: validation,
        obscureText: obscureText,
        textDirection: textDirection,
        textInputAction: textInputAction,
        maxLength: maxLength,
        onChanged: onChange,
        textAlign: textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextFontStyle.regular(color: AppColors.fontColor, size: context.textPx * 16),
        decoration: InputDecoration(
          prefixText: prefix,
          suffixText: suffix,
          hintText: labelText,
          counterText: "",
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFieldBgColor),
            borderRadius: BorderRadius.circular(radius),
          ),
          hintStyle: TextFontStyle.regular(color: AppColors.hintColor, size: context.textPx * 16),
          filled: true,
          fillColor: AppColors.primaryColor,
          disabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldBgColor, width: context.widthPx * 1.0),
          ),
          suffixIcon: iconButton,
          contentPadding:
          contentPadding ?? EdgeInsets.symmetric(vertical: context.heightPx * 25, horizontal: context.widthPx * 20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: context.widthPx * 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
