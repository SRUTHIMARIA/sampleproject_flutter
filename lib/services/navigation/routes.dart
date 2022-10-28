import 'package:flutter/material.dart';

class Routes {
  const Routes();

  void goTo( BuildContext context, screen){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ),
    );
  }

  void goBack( BuildContext context){
    Navigator.pop(context);
  }


  void replace( BuildContext context, screen){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ), (r){
        return false;
      },);
    // Navigator.pushReplacement(context,
    //   MaterialPageRoute(builder:
    //       (context) => screen,
    //   ),
    // );
  }

  void pushReplacement( BuildContext context, screen){
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => screen,
      ),
    );
  }



}
class ScreenNames {

  static String currentRoute = "/";
  static const String login = "ui/login_screen/login_screen";
  static const String registrationScreen = "ui/register_screen/register_screen";
  static const String registerActivation = "ui/register_screen/register_activation_link";
  static const String forgotPassword = "ui/password_recovery/password_recovery";
  static const String otpVerification = "ui/password_recovery/authentication_code_screen";
  static const String resetPasswordScreen = "ui/password_recovery/new_password_screen";
  static const String homepage = "ui/homepage/homepage";


}