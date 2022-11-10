import 'package:flutter/cupertino.dart';
import 'package:flutter_template/providers/common_function_provider/common_funtion_provider.dart';
import 'package:flutter_template/providers/drawer_provider.dart';
import 'package:flutter_template/providers/forgotpassword/forgotpasswd_provider.dart';
import 'package:flutter_template/providers/login/login_provider.dart';
import 'package:flutter_template/providers/otp/otp_provider.dart';
import 'package:flutter_template/providers/register/register_provider.dart';
import 'package:flutter_template/providers/resetpasswd/resetpasswod_provider.dart';
import 'package:flutter_template/widgets/validation/signup_validation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'authentication_provider.dart';
import 'common_function_provider/common_function_provider.dart';



class ProviderRegister {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<CommonFunctionsProvider>(create: (_) => CommonFunctionsProvider(),),
    ChangeNotifierProvider<AuthenticationProvider>(create: (_) => AuthenticationProvider(),),
    ChangeNotifierProvider<RegisterProvider>(create: (_) => RegisterProvider(),),
    ChangeNotifierProvider<SignupValidation>(create: (_) => SignupValidation(),),
    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider(),),
    ChangeNotifierProvider<ForgotPasswordProvider>(create: (_) => ForgotPasswordProvider(),),
    ChangeNotifierProvider<OtpProvider>(create: (_) => OtpProvider(),),
    ChangeNotifierProvider<ResetpasswordProvider>(create: (_) => ResetpasswordProvider(),),
    ChangeNotifierProvider<DrawerScreenProvider>(create: (_) => DrawerScreenProvider(),),
     ChangeNotifierProvider<ParentDetailProvider>(create: (_) => ParentDetailProvider(),),

  ];
