import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/login_model/login_user_model.dart';
import 'package:flutter_template/models/register_model/success_user_model.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/providers/login/login_provider.dart';
import 'package:flutter_template/services/api/login_service/login_service.dart';
import 'package:flutter_template/services/navigation/routes.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/ui/password_recovery/password_recovery.dart';
import 'package:flutter_template/ui/register_screen/register_screen.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';
import 'package:flutter_template/widgets/snackbar/text_snackbar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/app_colors.dart';
import '../password_recovery/authentication_code_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();
  bool isLogin = false;
  bool _isObscure1 = false;

  // Box? userDataBox;
  // // String? token;
  // // //
  // @override
  // void initState() {
  //   super.initState();
  //   userDataBox = Hive.box('userDetailBox');
  //   // getDeviceToken();
  //   // createBox();
  //   // getData();
  // }

  //
  // void createBox() async {
  //   userDataBox = await Hive.openBox('userdata');
  //   getData();
  // }
  //
  // void getData() async {
  //   if (userDataBox!.get('email') != null) {
  //     txtUserNameController.text = userDataBox!.get('email');
  //   }
  //   if (userDataBox!.get('password') != null) {
  //     txtUserPwdController.text = userDataBox!.get('password');
  //   }
  // }

  Future<void> loginUser() async {
    String email = txtUserNameController.text.trim();
    String password = txtUserPwdController.text.trim();
    String? validationMessage;
    String statusMessage;
    bool showValidationError = false;

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
    SuccessUser? model;
    AuthenticationResponseModel? authenticationResponseModel;
    handleFutureWithAlert(
      getErrorMessage: () => validationMessage!,
      function: () async {
        String? firebaseToken;
        try {
          firebaseToken = await FirebaseMessaging.instance.getToken();
          print(firebaseToken);
        } catch (e) {
          if (firebaseToken == null) {
            validationMessage = 'Failed to get device id';

            return ApiStatus.error;
          }
        }

        model = await LoginService.login(
          LoginUser(email: email, password: password, device_token: firebaseToken!),
        );
        print(model);

        // model = await LoginService.loginUser(
        //   LoginModel(email: email, password: password, firebaseToken: firebaseToken),
        // );

        if (model!.success == 200) return ApiStatus.success;

        validationMessage = model!.message;
        setState(() => showValidationError = true);

        return ApiStatus.none;
      },
      onSuccess: () async {
        await authProvider.saveUserDetails(
          authToken: authenticationResponseModel!.payload.token,
          userName: authenticationResponseModel.payload.fullName,
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

        AppSnackBar.showSnackBarWithText(context: context, text: 'Login Successful.');
        print('Login');
      },
    );
  }

  //
  // getDeviceToken() async {
  //   token = await FirebaseMessaging.instance.getToken();
  //   print('DEVICE TOKEN IS ------> $token!');
  // }

  final List<Color> _colors = [AppColors.gradientColorSplash, AppColors.gradientColor2Splash];
  final List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.40),
            ),
            child: Column(
              children: [
                Image.asset(Assets.images.imageLogin.path),
                SizedBox(
                  height: context.heightPx * 100,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: StaticPadding.paddingH50(context),
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      welcome,
                      style: const FontData().montFont22TextStyle,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: StaticPadding.paddingH50(context),
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      logintoContinue,
                      style: const FontData().montFont14TextStyle,
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    border: Border.all(
                      // color: CustomColors().white,
                      color: Provider.of<LoginProvider>(context, listen: true).loginError
                          ? AppColors.redColor
                          : AppColors.themeColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: TextFormField(
                    controller: txtUserNameController,
                    style: const FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,

                      prefixIcon: SvgPicture.asset(
                        Assets.icons.iconUsername,
                        fit: BoxFit.scaleDown,
                        color: AppColors.textGrey,
                      ),

                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),

                      fillColor: Colors.grey,

                      hintText: username,

                      //make hint text
                      hintStyle: const FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    border: Border.all(
                      // color: CustomColors().white,
                      color: Provider.of<LoginProvider>(context, listen: true).loginError
                          ? AppColors.redColor
                          : AppColors.whiteColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: TextFormField(
                    controller: txtUserPwdController,
                    style: const FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,

                      prefixIcon: SvgPicture.asset(
                        Assets.icons.iconPassword,
                        fit: BoxFit.scaleDown,
                        color: AppColors.textGrey,
                      ),

                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),

                      fillColor: Colors.grey,

                      hintText: pass,

                      //make hint text
                      hintStyle: const FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(height: context.heightPx * 16),
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordRecovery()),
                  ),
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
                  onTap: () => loginUser(),

                  // handlePressed(),
                  // loginProvider.login(txtUserNameController.text.toString(), txtUserPwdController.text.toString(), token??''),
                  //     loginUser(),

                  // loginUserDetails();

                  //   Provider.of<LoginProvider>(context, listen: false)
                  //       .signInToApp(
                  // context,
                  // txtUserPwdController.text.toString(),
                  // txtUserPwdController.text.toString(),
                  // token ?? ''),

                  child: SizedBox(
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
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
                      child: Text(
                        register,
                        style: const FontData().montFont70012TextStyle,
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

  void handlePressed() {
    Provider.of<LoginProvider>(context, listen: false)
        .signInToApp(txtUserNameController.text, txtUserPwdController.text);
    clearControllers();
  }

  void forgotPasswordPressed() {
    clearControllers();
    Provider.of<LoginProvider>(context, listen: false).setLoginError(false);
    Provider.of<LoginProvider>(context, listen: false).setErrorMessage('');
    const Routes().goTo(context, const AuthenticationCodeScreen());
  }

  void clearControllers() {
    FocusScope.of(context).unfocus();
    // emailController.text = '';
    // passwordController.text = '';
  }

  void setObscure1() {
    setState(() {
      _isObscure1 = !_isObscure1;
    });
  }

// void loginUserDetails() {
//   if (isLogin) {
//     userDataBox!.put('email', txtUserNameController.text);
//     userDataBox!.put('password', txtUserPwdController.text);
//   }
// }
}
