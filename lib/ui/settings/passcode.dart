import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../utils/constants/fontdata.dart';

const storedPasscode = '1234';

class Passcode extends StatefulWidget {
  Passcode({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  final StreamController<bool> _verificationNotifier =
  StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () =>
              Navigator.pop(context),

          child: Container(
            margin: EdgeInsets.only(left: context.heightPx * 49),
            child: SvgPicture.asset(Assets.icons.iconBackarrow),
          ),
        ),

        title: Text(widget.title, style: const FontData().montFont20TextStyle,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            _defaultLockScreenButton(context),
          ],
        ),
      ),
    );
  }

  _defaultLockScreenButton(BuildContext context) => MaterialButton(
    // color: Theme.of(context).primaryColor,
    // child: Text('Open Default Lock Screen'),
    onPressed: () {
      _showLockScreen(
        context,
        opaque: false,
        cancelButton: Text(
          'Cancel',
          style: const TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Cancel',
        ),
      );
    },
  );



  _showLockScreen(
      BuildContext context, {
        required bool opaque,
        CircleUIConfig? circleUIConfig,
        KeyboardUIConfig? keyboardUIConfig,
        required Widget cancelButton,
        List<String>? digits,
      }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
                title: const Text(
                  '',),
                circleUIConfig: circleUIConfig,
                keyboardUIConfig: keyboardUIConfig,
                passwordEnteredCallback: _onPasscodeEntered,
                cancelButton: cancelButton,
                deleteButton: SvgPicture.asset(Assets.icons.iconDelete,
                ),
                shouldTriggerVerification: _verificationNotifier.stream,
                backgroundColor: AppColors.primaryColor.withOpacity(0.56),
                cancelCallback: _onPasscodeCancelled,
                digits: digits,
                passwordDigits: 4,

              //  bottomWidget: _buildPasscodeRestoreButton(),
              ),
        ),);
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  // _buildPasscodeRestoreButton() => Align(
  //   alignment: Alignment.bottomCenter,
  //   child: Container(
  //     margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
  //     child: TextButton(
  //       child: Text(
  //         "Reset passcode",
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(
  //             fontSize: 16,
  //             color: Colors.white,
  //             fontWeight: FontWeight.w300),
  //       ),
  //       onPressed: _resetAppPassword,
  //       // splashColor: Colors.white.withOpacity(0.4),
  //       // highlightColor: Colors.white.withOpacity(0.2),
  //       // ),
  //     ),
  //   ),
  // );

  // _resetAppPassword() {
  //   Navigator.maybePop(context).then((result) {
  //     if (!result) {
  //       return;
  //     }
  //     _showRestoreDialog(() {
  //       Navigator.maybePop(context);
  //       //TODO: Clear your stored passcode here
  //     });
  //   });
  // }

  // _showRestoreDialog(VoidCallback onAccepted) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           "Reset passcode",
  //           style: const TextStyle(color: Colors.black87),
  //         ),
  //         content: Text(
  //           "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
  //           style: const TextStyle(color: Colors.black87),
  //         ),
  //         actions: <Widget>[
  //           // usually buttons at the bottom of the dialog
  //           TextButton(
  //             child: Text(
  //               "Cancel",
  //               style: const TextStyle(fontSize: 18),
  //             ),
  //             onPressed: () {
  //               Navigator.maybePop(context);
  //             },
  //           ),
  //           TextButton(
  //             child: Text(
  //               "I understand",
  //               style: const TextStyle(fontSize: 18),
  //             ),
  //             onPressed: onAccepted,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}