// import 'package:flutter/cupertino.dart';
//
// import '../../providers/common_function_provider/common_funtion_provider.dart';
// import '../../utils/static/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/globals.dart';
import 'package:flutter_template/widgets/full_screen_overlay.dart';
import 'package:flutter_template/widgets/loader/circular_loader.dart';
import '../../utils/static/enums.dart';


// ignore_for_file: long-parameter-list

///[handleFutureWithAlert] accepts a future and shows a loader as the future progress and if there was any
///error in completing the future then this function shows an alert with the error in it.
///All properties like [showProgressBar], [showAlert]  can be customised.

Future<ApiStatus> handleFutureWithAlert({
  required String Function() getErrorMessage,
  required Future<ApiStatus> Function() function,
  Function()? onSuccess,
  Function()? onError,
  Function()? onComplete,
  Function()? onAlertDismiss,
  bool showProgressBar = true,
  bool showAlert = true,
}) async {
  FullScreenBanner banner = FullScreenBanner();

  if (showProgressBar) {
    banner.show(widget: const CircularProgress());
  }
  ApiStatus apiStatus = await function();
  if (showProgressBar) {
    banner.hide();
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
      showDialog(context: Globals.context(), builder:(context){
        return AlertDialog(
          title: const Text('Login Success'),
          content: const Text('You are logged in Successfully'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      } );
      // showSingleButtonAlert(
      //   title: 'Error',
      //   body: getErrorMessage(),
      //   onPress: onAlertDismiss,
      //   barrierColor: Colors.transparent,
      // );
    }
  }

  return apiStatus;
}



// import 'api_manager_progressbar.dart';
//
// Future<ApiStatus>
// // ignore: long-parameter-list
// handleFutureWithAlert({
//   BuildContext? context,
//   required String Function() getErrorMessage,
//   required Future<ApiStatus> Function() function,
//   Function()? onSuccess,
//   Function()? onError,
//   Function()? onComplete,
//   Function()? onAlertDismiss,
//   bool showProgressBar = true,
//   bool showAlert = true,
// }) async {
//   late ApiManagerProgressBar progressBar;
//   context = CommonFunctionsProvider.navigatorKey.currentContext;
//
//   if (showProgressBar) {
//     progressBar = ApiManagerProgressBar(context: context);
//     progressBar.showDialog();
//   }
//   ApiStatus apiStatus = await function();
//   if (showProgressBar) {
//     progressBar.dismiss();
//   }
//   if (onComplete != null) {
//     onComplete();
//   }
//
//   if (apiStatus == ApiStatus.success) {
//     if (onSuccess != null) {
//       onSuccess();
//     }
//   } else if (apiStatus == ApiStatus.error) {
//     if (onError != null) {
//       onError();
//     }
//     if (showAlert) {
//       ApiManagerProgressBar progressBar = ApiManagerProgressBar(context: context);
//       progressBar.showAlertDialog(
//           body: getErrorMessage(), title:'Error', onOk: onAlertDismiss);
//     }
//   }
//   return apiStatus;
// }
