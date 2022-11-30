import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/loader_widget/loader_widget.dart';
import 'package:ndialog/ndialog.dart';

import 'alert_dialog_widget.dart';

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
        loadingWidget: const LoaderWidget(),
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
    title ??= 'Alert';
    if (context != null) {
      _progressDialog = CustomProgressDialog(
        context!,
        backgroundColor: Colors.transparent,
        dismissable: false,
        loadingWidget: AlertDialogWithOkButton(
          title: title,
          body: body,
          onOk: () {
            dismiss();
            if (onOk != null) {
              onOk();
            }
          },
        ),
      );
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
