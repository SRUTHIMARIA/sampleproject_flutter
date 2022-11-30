import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/forgot_password_model/forgotpasswd_model.dart';
import 'package:flutter_template/services/api/forgot_password_service/forgot_password_service.dart';
import 'package:flutter_template/ui/password_recovery/authentication_code_screen.dart';
import 'package:flutter_template/utils/static/enums.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';

import '../../utils/theme/app_colors.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final emailController = TextEditingController();
  String apiSuccess = '';
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),

        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(Assets.images.imageLogin.path),
              SizedBox(
                height: context.heightPx * 190,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: StaticPadding.paddingH50(context),

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    passwordRecovery,
                    style: const FontData().montFont22TextStyle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    emailToRecover,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),
              ),
              SizedBox(height:context.heightPx *16),



              Container(
                margin: EdgeInsets.symmetric(horizontal: 56),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                ),
                child: TextFormField(
                  controller: emailController,
                  style: FontData().montFont500TextStyle,

                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: InputBorder.none,

                    prefixIcon: SvgPicture.asset(Assets.icons.iconEmail,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    ),

                    fillColor: Colors.grey,

                    hintText: email,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,

                  ),
                ),
              ),


              SizedBox(height:context.heightPx *27),

              GestureDetector(
                onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_formKey.currentState!.validate()) {
        // context.router.push(OtpVerifyRoute(logPath:true));
        ForgotPasswordModel forgotPasswordModel =
        ForgotPasswordModel(email: emailController.text);
        await _forgotPasswordEmail(forgotPasswordModel);
        }
        },
              //  onTap: () => handlePressed(),
                // onTap: () {
                //

                //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthenticationCodeScreen()));
                // },

                child: Container(
                  height: context.heightPx * 42,
                  width: context.widthPx * 276,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                    child: Center(
                      child: Text(
                        recover,
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
      ),
    );
  }


  Future<void> _forgotPasswordEmail(ForgotPasswordModel forgotPasswordModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        LoginSuccessModel model = await ForgotPasswordService.forgotPasswordInfo(forgotPasswordModel);
        // print(model.status);
        if (model.message=='success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthenticationCodeScreen()));

          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

// void handlePressed() {
  //   Provider.of<ForgotPasswordProvider>(Globals.navigatorKey.currentContext!, listen: false).forgotPassword( emailController.text);
  //
  // }
}
