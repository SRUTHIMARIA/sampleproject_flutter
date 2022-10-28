import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:ndialog/ndialog.dart';


import '../../utils/extensions/context_extensions.dart';

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
        width: getScaledSize(300, scale: 1.60),
        child: Padding(
          padding: EdgeInsets.only(
            top: getScaledSize(5.0, scale: 2),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: getScaledSize(14, scale: 1.75)),
          ),
        ),
      ),
      content: Text(
        body,
        style: TextStyle(color: AppColors.themeColor, fontSize: getScaledSize(12, scale: 1.75)),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: getScaledSize(12, scale: 2), top: getScaledSize(1, scale: 20)),
          child: Center(
            // color: Colors.green,
            // width: context.widthPx * 500,
            child: MaterialButton(
              minWidth: context.widthPx * 50,
              height: context.heightPx * 30,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: AppColors.themeColor,
              onPressed: () {
                if (onOk != null) {
                  onOk!();
                } else {
                  context.pop();
                }
              },
              child: Text(
                ( "Ok"),
                style: TextStyle(color: AppColors.whiteColor, fontSize: context.widthPx * 14),
              ),
            ),
          ),
        )
      ],
    );
  }
}
