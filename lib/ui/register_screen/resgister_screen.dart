import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/login_screen/login_screen.dart';
import 'package:flutter_template/ui/register_screen/register_activation_link.dart';
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
  bool isAgree = false;

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
                    padding: EdgeInsets.symmetric(horizontal: 46),
                    margin: EdgeInsets.only(left: 12.0),
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
                  margin: EdgeInsets.symmetric(horizontal: 56),

                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
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
                SizedBox(height: context.heightPx*20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
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
                SizedBox(height: context.heightPx*20,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont500TextStyle,

                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,

                      prefixIcon: SvgPicture.asset(Assets.icons.iconEmail,fit: BoxFit.scaleDown,color: AppColors.textGrey,),

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
                SizedBox(height: context.heightPx*20,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
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
                            height:12.0,
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
                        SizedBox(width: 10.0),
                        Text(
                          Iagree,
                          style: const FontData().montFont50010TextStyle,
                        ),
                      ],
                    ),),
                ),
                SizedBox(
                  height: context.heightPx * 16,
                ),

                GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterActivationLink()));
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
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Container(
                        child: Text(
                         signin,
                          style: const FontData().montFont70012TextStyle ,
                        ),
                      ),
                    ),
                  ],),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
