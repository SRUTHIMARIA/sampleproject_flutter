import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/ui/medical_details/athelete_medical_about.dart';
import 'package:flutter_template/ui/medical_details/athelete_medical_info_allergies.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/theme/app_colors.dart';

class PhysioInfo extends StatefulWidget {
  const PhysioInfo({Key? key}) : super(key: key);

  @override
  State<PhysioInfo> createState() => _PhysioInfoState();
}

class _PhysioInfoState extends State<PhysioInfo> {
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
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: context.heightPx * 49),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        physioInfo,
                        style: const FontData().montFont70020TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 27,
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

                      hintText: phoneno,

                      //make hint text
                      hintStyle:  FontData().montFont500TextStyle,

                    ),
                  ),
                ),
                SizedBox(height: context.heightPx*20,),




                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AtheleteMedicalInfoAbout()));
                  },

                  child: Container(
                    height: context.heightPx * 42,
                    width: context.widthPx * 280,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      child: Center(
                        child: Text(
                          next,
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
