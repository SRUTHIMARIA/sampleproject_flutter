import 'package:flutter/material.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';

import 'package:flutter_template/utils/theme/app_colors.dart';

class SportsSelection extends StatefulWidget {
  const SportsSelection({Key? key}) : super(key: key);

  @override
  State<SportsSelection> createState() => _SportsSelectionState();
}

class _SportsSelectionState extends State<SportsSelection> {
  final List<Color> _colors = [
    AppColors.gradientColorSplash.withOpacity(0.48),
    AppColors.bgPrimarySplash
  ];
  final List<double> _stops = [0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.gradientColorSplash, AppColors.bgPrimarySplash])),
        child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body:
          Column(
            children: [
              SizedBox(
                height: context.heightPx * 64,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(

                    padding: StaticPadding.paddingH50(context),
                    child: Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        sports_type,
                        style:  FontData().montFont20TextStyle,
                      ),
                    )),
              ),
              SizedBox(
                height: context.heightPx * 6,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: StaticPadding.paddingH50(context),
                  child: Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      selectsportsType,
                      style: const FontData().montFont14TextStyle,
                    ),
                  ),),
              ),
              SizedBox(
                height: context.heightPx * 22,
              ),

              SizedBox(height:context.heightPx *16),


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



                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    fillColor:  AppColors.textFieldBgColor,
                    contentPadding: EdgeInsets.only(left: 20.0),

                    hintText: sports_type,

                    //make hint text
                    hintStyle:  FontData().montFont500TextStyle,



                  ),
                ),
              ),
              SizedBox(height:context.heightPx *20),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },

                child: Container(
                  height: context.heightPx * 45,
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


            ],
          ),
        ),
      ),);
  }
}
