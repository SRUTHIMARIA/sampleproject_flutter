import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:ndialog/ndialog.dart';


import '../text/text_style.dart';

class AlertDialogWithTwoButtons {
  String title;
  final String body;
  final Function()? onFirstButtonClick;
  final Function()? onSecondButtonClick;
  String firstButtonText;
  String secondButtonText;
  final BuildContext context;

  AlertDialogWithTwoButtons(
      {Key? key,
      required this.context,
      this.title = "Alert",
      required this.body,
      required this.onFirstButtonClick,
      this.firstButtonText = "Ok",
      this.secondButtonText = "Cancel",
      this.onSecondButtonClick}) {
    if (secondButtonText == "Cancel") {
      secondButtonText = ('Cancel');
    }
    if (firstButtonText == "Ok") {
      firstButtonText = ('Ok');
    }
    if (title == "Alert") {
      title = ('Alert');
    }
  }

  NDialog? dialog;

  Future<void> show() async {
    dialog = NDialog(
      dialogStyle: DialogStyle(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        titlePadding:
            EdgeInsets.only(left: context.widthPx * 15, right: context.widthPx * 15, top: context.heightPx * 15),
        contentPadding:
            EdgeInsets.only(left: context.widthPx * 15, right: context.widthPx * 15, top: context.heightPx * 15),
      ),
      title: Text(title),
      content: Text(body),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthPx * 8, vertical: context.heightPx * 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _button(
                  onTap: () => onSecondButtonClick ?? context.pop,
                  label: secondButtonText,
                  secondaryButtonColor: AppColors.redColor),
              const Spacer(),
              _button(onTap: () => onFirstButtonClick, label: firstButtonText),
            ],
          ),
        )
      ],
    );
    return await dialog!.show(context);
  }

  void dismiss() {
    if (dialog != null) {
      context.pop();
    }
  }

  Widget _button({required Function onTap, required String label, Color? secondaryButtonColor}) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.textPx * 8),
            color: secondaryButtonColor ?? AppColors.themeColor),
        height: context.heightPx * 50,
        width: context.widthPx * 120,
        margin: EdgeInsets.symmetric(horizontal: context.widthPx * 10, vertical: context.textPx * 10),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextFontStyle.regular(color: AppColors.whiteColor, size: context.textPx * 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
