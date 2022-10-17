import 'package:flutter/material.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/theme/app_colors.dart';

class ParentDetailsSecondary extends StatefulWidget {
  const ParentDetailsSecondary({Key? key}) : super(key: key);

  @override
  State<ParentDetailsSecondary> createState() => _ParentDetailsSecondaryState();
}

class _ParentDetailsSecondaryState extends State<ParentDetailsSecondary> {
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
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 46),
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      addParentDetails,
                      style: const FontData().montFont70020TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 46),
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text(
                      primaryContact,
                      style: const FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 16,
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
                      contentPadding: EdgeInsets.only(left: context.heightPx *16),



                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: name,

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
                      contentPadding: EdgeInsets.only(left: context.heightPx *16),


                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: dob,

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
                      contentPadding: EdgeInsets.only(left: context.heightPx *16),


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
                      contentPadding: EdgeInsets.only(left: context.heightPx *16),


                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      fillColor: Colors.grey,

                      hintText: relationship,

                      //make hint text
                      hintStyle:  FontData().montFont500TextStyle,

                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),




                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterActivationLink()));
                  },

                  child: Container(
                    height: context.heightPx * 42,
                    width: context.widthPx * 310,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      child: Center(
                        child: Text(
                          save,
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
        ),
      ),
    );
  }
}
