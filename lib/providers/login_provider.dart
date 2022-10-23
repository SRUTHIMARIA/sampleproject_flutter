import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  String email = '';
  String pwd = '';

  void signIn(String emailTxt, String pwdTxt){
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
  }
}