import 'package:flutter/material.dart';
import '../../utils/globals.dart';

class FullScreenBanner {
  DialogRoute? _dialogRoute;
  final BuildContext _context = Globals.context();

  Future<dynamic>? show({Widget? widget, bool dismissible = false}) {
    _dialogRoute = DialogRoute(
      context: _context,
      barrierDismissible: dismissible,
      builder: (context) => WillPopScope(
        onWillPop: () async => dismissible,
        child: Center(child: widget ?? const _FullScreenWidget()),
      ),
      barrierColor: Colors.transparent,
    );

    if (_dialogRoute == null) return null;

    return Navigator.push(_context, _dialogRoute!);
  }

  void hide() {
    if (_dialogRoute != null && _dialogRoute!.canPop) Navigator.removeRoute(_context, _dialogRoute!);
  }
}

class _FullScreenWidget extends StatelessWidget {
  const _FullScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(color: Colors.transparent);
}
