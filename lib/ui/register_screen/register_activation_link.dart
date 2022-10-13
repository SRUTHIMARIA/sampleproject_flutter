import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/theme/app_colors.dart';

class RegisterActivationLink extends StatefulWidget {
  const RegisterActivationLink({Key? key}) : super(key: key);

  @override
  State<RegisterActivationLink> createState() => _RegisterActivationLinkState();
}

class _RegisterActivationLinkState extends State<RegisterActivationLink> {
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
                    authSucess,
                    style: const FontData().montFont14TextStyle,
                  ),
                ),),
            ),
            SizedBox(height:context.heightPx *16),





            SizedBox(height:context.heightPx *160),


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              child: Container(
                child: Row(
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
                          style: const FontData().montFont60014TextStyle,
                        ),
                      ),
                    ),
                  ],),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
