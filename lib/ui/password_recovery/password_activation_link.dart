import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/theme/app_colors.dart';

class PasswordActivationLink extends StatefulWidget {
  const PasswordActivationLink({Key? key}) : super(key: key);

  @override
  State<PasswordActivationLink> createState() => _PasswordActivationLinkState();
}

class _PasswordActivationLinkState extends State<PasswordActivationLink> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:context.heightPx *240),

            Image.asset(Assets.images.imageSuccess.path),
            SizedBox(height:context.heightPx *33),

            Align(
              alignment: Alignment.center,
              child: Padding(

                  padding: StaticPadding.paddingH50(context),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      passwordRecovery,
                      style: const FontData().montFont22TextStyle,
                    ),
                  )),
            ),
            SizedBox(height:context.heightPx *12),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: StaticPadding.paddingH50(context),
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    passwordChanged,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),),
            ),
            SizedBox(height:context.heightPx *16),





            SizedBox(height:context.heightPx *160),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.icons.iconBack.path),
                SizedBox(width:context.widthPx *4),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: Container(
                    child: Text(
                      backToLogin,
                      style: const FontData().montFont60014TextStyle ,
                    ),
                  ),
                ),
              ],),



          ],
        ),
      ),
    );
  }
}
