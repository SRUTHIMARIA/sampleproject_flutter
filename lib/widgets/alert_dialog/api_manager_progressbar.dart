import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/alert_dialog/single_button_alert.dart';
import 'package:flutter_template/widgets/loader/circular_loader.dart';
import 'package:ndialog/ndialog.dart';


class ApiManagerProgressBar {
  BuildContext? context;
  CustomProgressDialog? loaderWidget;
  Function? onDismissCallback;

  ApiManagerProgressBar({required this.context, this.loaderWidget, this.onDismissCallback}) {
    if (context != null) {
      loaderWidget ??= CustomProgressDialog(
        context!,
        backgroundColor: Colors.transparent,
        dismissable: false,
        loadingWidget: const CircularProgress(),
      );
    }
  }

  late CustomProgressDialog _progressDialog;

  void showDialog() {
    _progressDialog = loaderWidget!;
    if (context != null) {
      _progressDialog.show();
    }
  }

  void showAlertDialog({String? title, required String body, Function? onOk}) async {
   // String title ??= Translator.translateWithoutContext('Alert');
    if (context != null) {
      _progressDialog = CustomProgressDialog(context!,
          backgroundColor: Colors.transparent,
          dismissable: false,
          loadingWidget: AlertDialogWithOkButton(
            title: title!,
            body: body,
            onOk: () {
              dismiss();
              if (onOk != null) {
                onOk();
              }
            },
          ),);
      _progressDialog.show();
    }
  }

  void dismiss() {
    if (context != null && _progressDialog != null) {
      _progressDialog.dismiss();
    }
    if (onDismissCallback != null) {
      onDismissCallback!();
    }
  }
}
