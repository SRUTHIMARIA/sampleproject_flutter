// ignore_for_file: long-parameter-list
import 'package:flutter/cupertino.dart';

import '../../../utils/static/enums.dart';
import 'api_manager_progressbar.dart';

Future<ApiStatus> handleFutureWithAlert({
  BuildContext? context,
  required String Function() getErrorMessage,
  required Future<ApiStatus> Function() function,
  Function()? onSuccess,
  Function()? onError,
  Function()? onComplete,
  Function()? onAlertDismiss,
  bool showProgressBar = true,
  bool showAlert = true,
}) async {
  late ApiManagerProgressBar progressBar;

  if (showProgressBar) {
    progressBar = ApiManagerProgressBar(context: context);
    progressBar.showDialog();
  }
  ApiStatus apiStatus = await function();
  if (showProgressBar) {
    progressBar.dismiss();
  }
  if (onComplete != null) {
    onComplete();
  }

  if (apiStatus == ApiStatus.success) {
    if (onSuccess != null) {
      onSuccess();
    }
  } else if (apiStatus == ApiStatus.error) {
    if (onError != null) {
      onError();
    }
    if (showAlert) {
      ApiManagerProgressBar progressBar = ApiManagerProgressBar(context: context);
      progressBar.showAlertDialog(body: getErrorMessage(), title: 'Alert!', onOk: onAlertDismiss);
    }
  }

  return apiStatus;
}
