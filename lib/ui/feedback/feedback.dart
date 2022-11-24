import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import '../../models/FeedbackModel/feedbackmodel.dart';
import 'package:flutter_template/ui/homepage/homepage.dart';
import 'package:flutter_template/utils/constants/strings.dart';

import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';

import '../../utils/constants/font_data.dart';


class Feedbacks extends StatefulWidget {




  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {




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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.heightPx * 70,
              ),

              Row(

                children: [

                  InkWell(
                    onTap: () =>
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage())),

                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 30),
                      child: SvgPicture.asset(Assets.icons.iconBackarrow),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: context.heightPx * 20),
                    child: Text(feedback,style: const FontData().montFont70020TextStyle,),
                  ),
                ],
              ),

              SizedBox(
                height: context.heightPx * 30,
              ),
              Container(
                margin: EdgeInsets.only(left: context.heightPx * 30),
                child: Text(today,style: const FontData().montFont60012DarkTextStyle,),
              ),



              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: feedbacks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 27,),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),

                      ),
                      child: Container(
                        height: 65,
                        width: context.widthPx * 280,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.only(left: 10),
                        decoration:  BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.10),
                          border:  Border(
                            left: BorderSide(color:(index % 2 == 0)?
                            AppColors.purpleColor:AppColors.pinkColor,
                              width: 4,strokeAlign: StrokeAlign.inside,),
                          ),
                          // borderRadius: BorderRadius.circular(10.0),
                          // borderRadius:
                          // const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.heightPx * 8,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  feedbacks[index].session,
                                  style: const FontData()
                                      .montFont50013LightTextStyle,
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.only(right: 10),
                                  child: Text(
                                    feedbacks[index].time,
                                    style: const FontData()
                                        .montFont40010LightGreyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Text(
                              feedbacks[index].message,
                              style: const FontData()
                                  .montFont50012LightGreyTextStyle,
                            ),
                          ],
                        ),),
                    );
                  },),
              ),



              SizedBox(
                height: context.heightPx * 10,
              ),

              Container(
                margin: EdgeInsets.only(left: context.heightPx * 30),
                child: Text(yesterday,style: const FontData().montFont60012DarkTextStyle,),
              ),
              Flexible(

                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: feedbackModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 27,),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),

                      ),
                      child: Container(
                        height: 65,
                        width: context.widthPx * 280,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.only(left: 10),
                        decoration:  BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.10),
                          border:  Border(
                            left: BorderSide(color:(index % 2 == 0)?
                            AppColors.lightBlue:AppColors.purpleColor,
                              width: 4,strokeAlign: StrokeAlign.inside,),
                          ),
                          // borderRadius: BorderRadius.circular(10.0),
                          // borderRadius:
                          // const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.heightPx * 8,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  feedbackModel[index].session,
                                  style: const FontData()
                                      .montFont50013LightTextStyle,
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.only(right: 10),
                                  child: Text(
                                    feedbackModel[index].time,
                                    style: const FontData()
                                        .montFont40010LightGreyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Text(
                              feedbackModel[index].message,
                              style: const FontData()
                                  .montFont50012LightGreyTextStyle,
                            ),
                          ],
                        ),),
                    );
                  },),
              ),
              Container(
                margin: EdgeInsets.only(left: context.heightPx * 30),
                child: Text(lastDays,style: const FontData().montFont60012DarkTextStyle,),
              ),
              Flexible(

                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: feedbackLastDays.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 27,),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),

                      ),
                      child: Container(
                        height: 65,
                        width: context.widthPx * 280,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.only(left: 10),
                        decoration:  BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.10),
                          border:  Border(
                            left: BorderSide(color:(index % 2 == 0)?
                            AppColors.purpleColor:AppColors.pinkColor,
                              width: 4,strokeAlign: StrokeAlign.inside,),
                          ),
                          // borderRadius: BorderRadius.circular(10.0),
                          // borderRadius:
                          // const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: context.heightPx * 8,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  feedbackLastDays[index].session,
                                  style: const FontData()
                                      .montFont50013LightTextStyle,
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.only(right: 10),
                                  child: Text(
                                    feedbackLastDays[index].time,
                                    style: const FontData()
                                        .montFont40010LightGreyTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.heightPx * 10,
                            ),
                            Text(
                              feedbackLastDays[index].message,
                              style: const FontData()
                                  .montFont50012LightGreyTextStyle,
                            ),
                          ],
                        ),),
                    );
                  },),
              ),


            ],
          ),
        ),
      ),);
  }

}
