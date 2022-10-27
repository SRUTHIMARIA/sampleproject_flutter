import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/password_recovery/new_password_screen.dart';
import 'package:flutter_template/ui/register_screen/register_screen.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/theme/app_colors.dart';

class AuthenticationCodeScreen extends StatefulWidget {
  const AuthenticationCodeScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationCodeScreen> createState() => _AuthenticationCodeScreenState();
}

class _AuthenticationCodeScreenState extends State<AuthenticationCodeScreen> {
  final otpController = TextEditingController();

  final List<Color> _colors = [
    AppColors.gradientColorSplash,
    AppColors.gradientColor2Splash
  ];
  final List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
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
              height: context.heightPx * 190,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(

                  padding: StaticPadding.paddingH50(context),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      authentication,
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
                    authenticationCode,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),),
            ),
            SizedBox(
              height: context.heightPx * 30,
            ),

            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.textFieldBgColor,
              showFieldAsBox: true,
              fieldWidth: 56,


              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
             enabledBorderColor:  AppColors.textFieldBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              focusedBorderColor: Colors.transparent,
              disabledBorderColor: Colors.transparent,
              cursorColor: AppColors.textFieldBgColor,
              borderWidth: 0.0,

              // textStyle: const FontData().otpTextStyle,


            ),
            SizedBox(
              height: context.heightPx * 24,
            ),

            SizedBox(height:context.heightPx *27),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
              },

              child: Container(
                height: context.heightPx * 42,
                width: context.widthPx * 276,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                  child: Center(
                    child: Text(
                      submit,
                      // _display ? "hide logo" : "display logo",
                      style: const FontData().montFont70016TextStyle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:context.heightPx *16),




          ],
        ),
      ),
    );
  }
}
