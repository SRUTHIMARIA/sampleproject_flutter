import 'package:flutter/cupertino.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:ndialog/ndialog.dart';

class CustomAlertWidget {
  final BuildContext context;
  final Widget widget;
  final bool dismissible;
  final Function? onDismiss;

  CustomAlertWidget({required this.context, required this.widget, this.dismissible = true, this.onDismiss})
      : _dialog = CustomProgressDialog(context,
      loadingWidget: SizedBox(
          height: context.percentHeight * 75,
          child: ClipRRect(borderRadius: BorderRadius.circular(15), child: widget)),
      dismissable: dismissible,
      dialogTransitionType: DialogTransitionType.TopToBottom,
      transitionDuration: const Duration(milliseconds: 200),
      onDismiss: onDismiss);

  final CustomProgressDialog? _dialog;

  void show() {
    if (_dialog != null) {
      _dialog!.show();
    }
  }

  void dismiss() {
    if (_dialog != null) {
      if (_dialog!.isShowed) {
        _dialog!.dismiss();
      }
    }
  }
}