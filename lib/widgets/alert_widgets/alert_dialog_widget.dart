import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/widgets/text/text_style.dart';
import 'package:ndialog/ndialog.dart';

import '../../utils/theme/app_colors.dart';

class AlertDialogWithOkButton extends StatelessWidget {
  final String title;
  final String body;
  final Function? onOk;
  const AlertDialogWithOkButton({Key? key, required this.title, required this.body, this.onOk}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NDialog(
      dialogStyle: DialogStyle(),
      title: SizedBox(
        width: context.widthPx * 300,
        child: Padding(
          padding: EdgeInsets.only(
            top: context.heightPx * 5,
          ),
          child: Text(
            title,
            style: TextFontStyle.regular(
              size: context.textPx * 20,
            ),
          ),
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(
          top: context.heightPx * 10,
        ),
        child: Text(
          body,
          style: TextFontStyle.regular(
            size: context.textPx * 15,
            color: AppColors.redColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            bottom: context.heightPx * 10,
            top: context.heightPx * 20,
            right: context.widthPx * 20,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            // color: Colors.green,
            // width: context.widthPx * 500,
            child: MaterialButton(
              minWidth: context.widthPx * 60,
              height: context.heightPx * 30,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              color: AppColors.darkGreen,
              onPressed: () => (onOk != null) ? onOk!() : context.router.pop(),
              child: Text(
                'OK',
                style: TextFontStyle.regular(
                  size: context.textPx * 15,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
