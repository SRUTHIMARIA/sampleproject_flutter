import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/athentication_response_model.dart';
import 'package:flutter_template/models/common_model/success_model.dart';
import 'package:flutter_template/models/login_model/login_user_model.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/providers/login/login_provider.dart';
import 'package:flutter_template/services/api/login_service/login_service.dart';
import 'package:flutter_template/ui/password_recovery/password_recovery.dart';
import 'package:flutter_template/ui/register_screen/register_screen.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';
import 'package:flutter_template/widgets/snackbar/text_snackbar.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();
  //String? token;
  Future<void> loginuser() async {
    String email = txtUserNameController.text.trim();
    String password = txtUserPwdController.text.trim();
    String validationMessage;
    String statusMessage;
    bool showValidationError=false;


    AuthenticationProvider authProvider = context.read<AuthenticationProvider>();

    ///check validations

    if (email.isEmpty) {
      validationMessage = 'Email is required';
    } else if (!EmailValidator.validate(email)) {
      validationMessage = 'Invalid Email';
    } else if (password.isEmpty) {
      validationMessage = 'Password is required';
    } else if (password.length < 6) {
      validationMessage = 'Password must be at least 6 characters';
    } else {
      validationMessage = '';
    }

    ///validation failed
    if (validationMessage.isNotEmpty) {
      setState(() => showValidationError = true);

      return;
    }



    ///validations successful. proceed to login
    LoginUser? loginUser;
    SuccessModel? model;
    AuthenticationResponseModel? authenticationResponseModel;
    handleFutureWithAlert(
      getErrorMessage: () => validationMessage,
      function: () async {
        String? firebaseToken = await FirebaseMessaging.instance.getToken();
        if (firebaseToken == null) {
          validationMessage = 'Failed to get device id';

          return ApiStatus.error;
        }
        model = await LoginService.login(
          LoginUser(email: email, password: password, device_token: firebaseToken),
        );

        // model = await LoginService.loginUser(
        //   LoginModel(email: email, password: password, firebaseToken: firebaseToken),
        // );

        if (model!.message != null) return ApiStatus.success;

        validationMessage = model!.status as String;
        setState(() => showValidationError = true);

        return ApiStatus.none;
      },
      onSuccess: () async {
        if (model == null) return;
        await authProvider.saveUserDetails(authToken: authenticationResponseModel!.payload.token, userName: authenticationResponseModel.payload.fullName);
        AppSnackBar.showSnackBarWithText(context: context, text: 'Login Successful.');
      },
    );
  }

  // @override
  // void initState() {
  //   // Provider.of<LoginProvider>(context, listen: false).setLoginError(false);
  //   getDeviceToken();
  //   super.initState();
  // }
  //
  // getDeviceToken() async {
  //   token = await FirebaseMessaging.instance.getToken();
  //   print('DEVICE TOKEN IS ------> $token!');
  // }

  @override
  void dispose() {
    super.dispose();
    // userEmailemailController.dispose();
    // passwordController.dispose();
  }

  final List<Color> _colors = [
    AppColors.gradientColorSplash,
    AppColors.gradientColor2Splash
  ];
  final List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.40),
              // gradient: LinearGradient(
              //   colors: _colors,
              //   stops: _stops,
              //
              //
              // ),
            ),
            child: Column(
              children: [
                Image.asset(Assets.images.imageLogin.path),
                SizedBox(
                  height: context.heightPx * 100,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: StaticPadding.paddingH50(context),
                      child: Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          welcome,
                          style: const FontData().montFont22TextStyle,
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: StaticPadding.paddingH50(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        logintoContinue,
                        style: const FontData().montFont14TextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    border: Border.all(
                      // color: CustomColors().white,
                      color: Provider.of<LoginProvider>(context, listen: true)
                              .loginError
                          ? AppColors.redColor
                          : AppColors.themeColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    controller: txtUserNameController,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,

                      prefixIcon: SvgPicture.asset(
                        Assets.icons.iconUsername,
                        fit: BoxFit.scaleDown,
                        color: AppColors.textGrey,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: username,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    border: Border.all(
                      // color: CustomColors().white,
                      color: Provider.of<LoginProvider>(context, listen: true)
                              .loginError
                          ? AppColors.redColor
                          : AppColors.whiteColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    controller: txtUserPwdController,
                    style: FontData().montFont500TextStyle,
                    onChanged: (val) {
                      setState(() {
                        provider.setLoginError(false);
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,

                      prefixIcon: SvgPicture.asset(
                        Assets.icons.iconPassword,
                        fit: BoxFit.scaleDown,
                        color: AppColors.textGrey,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: password,

                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordRecovery()));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: StaticPadding.paddingH60(context),
                      child: Text(
                        forgotPassword,
                        style: const FontData().montFont50012TextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                GestureDetector(
                  onTap: () =>  loginuser(),
                  //     Provider.of<LoginProvider>(context, listen: false)
                  //         .signInToApp(
                  //   context,
                  //   txtUserPwdController.text.toString(),
                  //   txtUserPwdController.text.toString(),
                  //   token ?? '',
                  // ),
                  // },

                  child: Container(
                    height: context.heightPx * 42,
                    width: context.widthPx * 270,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Center(
                        child: Text(
                          login,
                          // _display ? "hide logo" : "display logo",
                          style: const FontData().montFont70016TextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      donthaveaccount,
                      style: const FontData().montFont60012TextStyle,
                    ),
                    SizedBox(width: context.widthPx * 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Container(
                        child: Text(
                          register,
                          style: const FontData().montFont70012TextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
