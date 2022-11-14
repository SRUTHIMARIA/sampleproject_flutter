import 'package:flutter/material.dart';
import './validation_item.dart';


class SignupValidation with ChangeNotifier {

  ValidationItem _firstName = ValidationItem('','',);
  ValidationItem _lastName = ValidationItem('','');
  ValidationItem _email = ValidationItem('','');

  //Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get email=>_email;
  bool get isValid {
    if (_lastName.value != null && _firstName.value != null &&_email.value!=null){
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeFirstName(String value){
    if (value.length >= 3){
      _firstName=ValidationItem(value,'');
    } else {
      _firstName=ValidationItem('', "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeLastName(String value){
    if (value.length >= 3){
      _lastName=ValidationItem(value,'');
    } else {
      _lastName=ValidationItem('', "Must be at least 3 characters");
    }
    notifyListeners();
  }

  bool changeEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern.toString());

    return (!regex.hasMatch(value)) ? false : true;
    notifyListeners();
  }

  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }


  void submitData(){
    print("FirstName: ${firstName.value}, LastName: ${lastName.value}");
  }


}
