import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import '../../utils/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              height: context.heightPx * 21,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(

                  padding: StaticPadding.paddingH50(context),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      getStarted,
                      style: const FontData().montFont22TextStyle,
                    ),
                  )),
            ),
            SizedBox(
              height: context.heightPx * 20,
            ),
            Padding(
              padding: StaticPadding.paddingH50(context),
              child: Container(
                margin: EdgeInsets.all(15),
                color: AppColors.textFieldBgColor,
                child: TextFormField(
                  style: FontData().montFont500TextStyle,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: InputBorder.none,


                    prefixIcon: SvgPicture.asset(Assets.icons.iconUsername,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    fillColor: Colors.grey,

                    hintText: firstname,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,



                  ),
                ),
              ),
            ),
            Padding(
              padding: StaticPadding.paddingH50(context),
              child: Container(
                margin: EdgeInsets.all(15),
                color: AppColors.textFieldBgColor,
                child: TextFormField(
                  style: FontData().montFont500TextStyle,

                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: InputBorder.none,

                    prefixIcon: SvgPicture.asset(Assets.icons.iconUsername,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    fillColor: Colors.grey,

                    hintText: secondname,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,

                  ),
                ),
              ),
            ),

            Padding(
              padding: StaticPadding.paddingH50(context),
              child: Container(
                margin: EdgeInsets.all(15),
                color: AppColors.textFieldBgColor,
                child: TextFormField(
                  style: FontData().montFont500TextStyle,

                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: InputBorder.none,

                    prefixIcon: SvgPicture.asset(Assets.icons.iconPassword,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    fillColor: Colors.grey,

                    hintText: email,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,

                  ),
                ),
              ),
            ),
            Padding(
              padding: StaticPadding.paddingH50(context),
              child: Container(
                margin: EdgeInsets.all(15),
                color: AppColors.textFieldBgColor,
                child: TextFormField(
                  style: FontData().montFont500TextStyle,

                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder: InputBorder.none,

                    prefixIcon: SvgPicture.asset(Assets.icons.iconPassword,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    fillColor: Colors.grey,

                    hintText: password,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,

                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.heightPx * 20,
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: StaticPadding.paddingH60(context),
                child: Text(
                  Iagree,
                  style: const FontData().montFont50010TextStyle,
                ),),
            ),
            SizedBox(
              height: context.heightPx * 16,
            ),

            GestureDetector(
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },

              child: Container(
                height: context.heightPx * 42,
                width: context.widthPx * 300,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),),
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
            SizedBox(height:context.heightPx *16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  alreadyhaveaccount,
                  style: const FontData().montFont60012TextStyle ,
                ),
                SizedBox(width:context.widthPx *4),
                Text(
                 signin,
                  style: const FontData().montFont70012TextStyle ,
                ),
              ],),



          ],
        ),
      ),
    );
  }
}
