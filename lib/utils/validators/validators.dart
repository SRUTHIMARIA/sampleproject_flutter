class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Please enter the Name';
    }

    return null;
  }

  static String? validateFirstName({required String? name}) {
    if (name == null) {
      return null;
    }
    RegExp nameRegExp = RegExp(r'[!@#<>?":_`~;.[\]\\|=+)(*&^%0-9-]');
    if (name.isEmpty) {
      return 'Enter the First Name';
    } else if (nameRegExp.hasMatch(name)) {
      return 'Enter a Valid Name';
    }

    return null;
  }

  static String? validateDescription({required String? description}) {
    if (description == null) {
      return null;
    }

    if (description.isEmpty) {
      return 'Enter the description';
    }

    return null;
  }

  static String? validateLastName({required String? name}) {
    if (name == null) {
      return null;
    }
    RegExp nameRegExp = RegExp(r'[!@#<>?":_`~;.[\]\\|=+)(*&^%0-9-]');
    if (name.isEmpty) {
      return 'Enter the Last Name';
    } else if (nameRegExp.hasMatch(name)) {
      return 'Enter a Valid Name';
    }

    return null;
  }

  static String? validateCity({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Please enter the City';
    }

    return null;
  }

  static String? validateStreet({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Please enter the Street';
    }

    return null;
  }

  static String? validatePostCode({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Please enter the PostCode';
    }

    return null;
  }

  static String? validateState({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Please enter the State';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePhone({required String? phone}) {
    if (phone == null) {
      return null;
    }
    RegExp phoneRegExp = RegExp(
      r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$',
    );
    if (phone.isEmpty) {
      return 'Enter Phone Number';
    } else if (!phoneRegExp.hasMatch(phone)) {
      return 'Enter a correct phone number';
    }
    if (phone.length <= 9) {
      return 'Phone number must be 10 digits';
    }

    return null;
  }

  static String? validateOtp({required String? otp}) {
    if (otp == null) {
      return null;
    }
    if (otp.isEmpty) {
      return 'Please enter your phone number';
    } else if (otp.length > 4) {
      return 'Enter a correct otp';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }
    RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_,;\-\]\[.+=/?":{}|<>]).{8,}$',
    );
    if (password.isEmpty) {
      return 'Enter the Password';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'Please enter valid password';
    } else if (password.length <= 7) {
      return 'Password must be least 8';
    }

    return null;
  }

  static String? validateNewPassword({required String? password}) {
    if (password == null) {
      return null;
    }
    RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_,.+=/?":{}|<>]).{8,}$',
    );
    if (password.isEmpty) {
      return 'Enter the New Password';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'Please enter valid password';
    } else if (password.length <= 7) {
      return 'Password must be least 8';
    }

    return null;
  }



  static bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp(
      r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$',
    );

    return numericRegex.hasMatch(string);
  }
}
