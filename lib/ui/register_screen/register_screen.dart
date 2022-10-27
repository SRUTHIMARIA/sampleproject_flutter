import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/providers/login/login_provider.dart';
import 'package:flutter_template/providers/register/register_provider.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/app_colors.dart';
import '../../widgets/validation/signup_validation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isAgree = false;
  var txtEmailController = TextEditingController();
  var txtUserPwdController = TextEditingController();
  var txtFirstNameController = TextEditingController();
  var txtLastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';
  String _userFirstName = '';
  String _userLastName = '';


  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userFirstName);
      debugPrint(_password);
      debugPrint(_userLastName);

      /*
      Continute proccessing the provided information with your own logic
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
    }
  }


  final List<Color> _colors = [
    AppColors.gradientColorSplash,
    AppColors.gradientColor2Splash
  ];
  final List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignupValidation>(context);
    return Form(
      key: _formKey,
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Image.asset(Assets.images.imageLogin.path),
                  SizedBox(
                    height: context.heightPx * 21,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 46),
                      margin: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        getStarted,
                        style: const FontData().montFont22TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextFormField(
                      controller: txtFirstNameController,
                      style: const FontData().montFont500TextStyle,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 4) {
                          return 'First name must be at least 4 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _userFirstName = value,


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



                        hintText: firstname,

                        //make hint text
                        hintStyle: const FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),


                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextFormField(
                      controller: txtLastNameController,
                      style: const FontData().montFont500TextStyle,
                     // obscureText: _isHidden,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 4) {
                          return 'Last name must be at least 4 characters in length';
                        }
                        // Return null if the entered username is valid
                        return null;
                      },
                      onChanged: (value) => _userLastName = value,


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

                        hintText: secondname,

                        //make hint text
                        hintStyle: const FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextFormField(
                      controller: txtEmailController,
                      style: const FontData().montFont500TextStyle,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        // Check if the entered email has the right format
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                      onChanged: (value) => _userEmail = value,

                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,

                        prefixIcon: SvgPicture.asset(
                          Assets.icons.iconEmail,
                          fit: BoxFit.scaleDown,
                          color: AppColors.textGrey,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),

                        fillColor: Colors.grey,

                        hintText: email,

                        //make hint text
                        hintStyle: const FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    decoration: const BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: TextFormField(
                      controller: txtUserPwdController,
                      style: const FontData().montFont500TextStyle,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        // Return null if the entered password is valid
                        return null;
                      },
                      onChanged: (value) => _password = value,

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

                        hintText: password,

                        //make hint text
                        hintStyle: const FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: StaticPadding.paddingH30(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Theme(
                          //   data: Theme.of(context).copyWith(
                          //     unselectedWidgetColor: AppColors.textFieldBgColor,
                          //   ),
                          //   child: Checkbox(
                          //     value: this.isAgree,
                          //     checkColor: AppColors.themeColor,
                          //     onChanged: (bool? value) {
                          //       setState(() {
                          //         this.isAgree = value!;
                          //       });
                          //     },
                          //   ), //Ch
                          //   // Checkbox(
                          //   //   value: isAgree,
                          //   //   onChanged: (bool? value) {
                          //   //     isAgree = value!;
                          //   //   },
                          //   // ),
                          // ),
                          SizedBox(
                            height: 12.0,
                            width: 12.0,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: AppColors.textFieldBgColor,
                              ),
                              child: Checkbox(
                                value: this.isAgree,
                                checkColor: AppColors.themeColor,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.isAgree = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          // You can play with the width to adjust your
                          // desired spacing
                          const SizedBox(width: 10.0),
                          Text(
                            Iagree,
                            style: const FontData().montFont50010TextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      _trySubmitForm();
                      Provider.of<RegisterProvider>(context, listen: false).signUpToApp(
                        context,
                        txtFirstNameController.text.toString(),
                        txtLastNameController.text.toString(),
                        txtEmailController.text.toString(),
                        txtUserPwdController.text.toString(),
                      );
                    },








                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const RegisterActivationLink()));

                    child: Container(
                      height: context.heightPx * 42,
                      width: context.widthPx * 276,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Center(
                          child: Text(
                            register,
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
                        alreadyhaveaccount,
                        style: const FontData().montFont60012TextStyle,
                      ),
                      SizedBox(width: context.widthPx * 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Container(
                          child: Text(
                            signin,
                            style: const FontData().montFont70012TextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
