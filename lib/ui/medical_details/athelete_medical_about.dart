import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';

import '../../utils/static/static_padding.dart';
import '../../utils/theme/app_colors.dart';

class AtheleteMedicalInfoAbout extends StatefulWidget {
  const AtheleteMedicalInfoAbout({Key? key}) : super(key: key);

  @override
  State<AtheleteMedicalInfoAbout> createState() => _AtheleteMedicalInfoAboutState();
}

class _AtheleteMedicalInfoAboutState extends State<AtheleteMedicalInfoAbout> {
  bool isChecked = false;
  bool isCheckedNo=false;
  bool isDisplay=false;
  bool isAgree=false;

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
                          Container(
                            margin: EdgeInsets.only(left: context.heightPx * 49),
                            child: SvgPicture.asset(Assets.icons.iconBackarrow),
                          ),
                          Container(

                            margin: EdgeInsets.only(left: 12.0),
                            child: Text(
                              atheleteinfo,
                              style: const FontData().montFont70020TextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.heightPx * 20,
                      ),

                      isChecked? Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 46),
                          margin: EdgeInsets.only(left: 12.0),
                          child: Text(
                            about,
                            style: const FontData().montFont500TextStyle,
                          ),
                        ),
                      ) : SizedBox(
                        height: context.heightPx *40,
                      ),
                      SizedBox(height: context.heightPx*20,),
                      Padding(
                        padding: StaticPadding.paddingH60(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height:12.0,
                              width: 12.0,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: AppColors.textFieldBgColor,
                                ),
                                child: Checkbox(
                                  value: this.isChecked,
                                  checkColor: AppColors.whiteColor,
                                  activeColor: AppColors.themeColor,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            // You can play with the width to adjust your
                            // desired spacing
                            SizedBox(width: 10.0),
                            Text(
                              yes,
                              style: const FontData().montFont50010TextStyle,
                            ),
                          ],
                        ),),
                      SizedBox(height: context.heightPx*21,),

                      Padding(
                        padding: StaticPadding.paddingH60(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height:12.0,
                              width: 12.0,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: AppColors.textFieldBgColor,

                                ),
                                child: Checkbox(
                                  focusColor: AppColors.themeColor,
                                  value: this.isCheckedNo,
                                  checkColor: AppColors.whiteColor,
                                  activeColor: AppColors.themeColor,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.isCheckedNo = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            // You can play with the width to adjust your
                            // desired spacing
                            SizedBox(width: 10.0),
                            Text(
                              no,
                              style: const FontData().montFont50010TextStyle,
                            ),
                          ],
                        ),),

                      SizedBox(height: context.heightPx*27,),


                      SizedBox(height: context.heightPx*20,),

                      isChecked? Container(
                        height: context.heightPx * 88,
                        margin: EdgeInsets.symmetric(horizontal: 56),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBgColor,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          style: FontData().montFont500TextStyle,
                          decoration: InputDecoration(
                            focusColor: AppColors.textFieldBgColor,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),

                            fillColor: AppColors.textFieldBgColor,
                            contentPadding: EdgeInsets.only(left: 20.0),
                            hintText: enterDetails,

                            //make hint text
                            hintStyle: FontData().montFont500TextStyle,
                          ),
                        ),
                      ):Container(),

                      SizedBox(height: context.heightPx*20,),


                      isChecked? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,

                            backgroundColor: AppColors.textFieldBgColor,

                            elevation: 10,
                            // gives rounded corner to modal bottom screen
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            builder: (BuildContext context) {
                              // UDE : SizedBox instead of Container for whitespaces
                              return SizedBox(
                                height: 200,
                                child:   Column(
                                  children: [
                                    SizedBox(height: context.heightPx*50,),

                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: StaticPadding.paddingH60(context),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            SizedBox(
                                              height:12.0,
                                              width: 12.0,
                                              child: Theme(
                                                data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor: AppColors.textFieldBgColor,

                                                ),
                                                child: Checkbox(
                                                  focusColor:AppColors.checkBoxColor.withOpacity(0.32),
                                                  value: this.isAgree,
                                                  checkColor: AppColors.whiteColor,
                                                  activeColor: AppColors.checkBoxColor.withOpacity(0.32),
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
                                              IAgree,
                                              style: const FontData().montFont50012TextStyle,
                                            ),
                                          ],
                                        ),),
                                    ),
                                    SizedBox(height: context.heightPx*30,),

                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: context.heightPx *49),

                                          height: context.heightPx * 36,
                                          width: context.widthPx * 125,
                                          child: Container(
                                            decoration:  BoxDecoration(
                                              color: AppColors.checkBoxColor.withOpacity(0.32),
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                                            child: Center(
                                              child: Text(

                                                skip,
                                                // _display ? "hide logo" : "display logo",
                                                style: const FontData().montFont70014TextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: context.widthPx*26,),
                                        Container(
                                          height: context.heightPx * 36,
                                          width: context.widthPx * 125,
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
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                          
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AtheleteMedicalInfoInjuries()));
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
                      ):Container(),




                    ],
                  ),



                )),),);
  }
}
