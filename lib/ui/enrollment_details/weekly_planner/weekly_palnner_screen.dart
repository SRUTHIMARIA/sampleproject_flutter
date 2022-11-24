import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/models/WeeklyPlanModel/weekly_plan_model.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/theme/app_colors.dart';

class WeeklyPlanner extends StatefulWidget {
  @override
  _WeeklyPlannerState createState() => _WeeklyPlannerState();
}

class _WeeklyPlannerState extends State<WeeklyPlanner> {
  String? _month, _year;

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
              children: [
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: context.heightPx * 32),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text('$_month',style: FontData().montFont60018TextStyle,),
                    ),
                    Container(
                      child: Text('$_year',style: FontData().montFont60018TextStyle,),
                    ),
                  ],
                ),

               ClipRRect(
                 borderRadius: BorderRadius.circular(16.0),
                 child: Container(

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(16.0),
                   ),
                   margin: EdgeInsets.all(25.0),
                   child: Container(
                     height: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16.0),
                     ),
                     child: SfCalendar(


                       backgroundColor: AppColors.textFieldBgColor,
                       view: CalendarView.month,
                      // dataSource: getCalendarDataSource(),
                       onViewChanged: viewChanged,
                       headerStyle:CalendarHeaderStyle(textStyle: FontData().montFont60014TextStyle),
                       headerDateFormat: DateFormat.WEEKDAY,
                     ),
                   ),
                 ),
               ),


                Expanded(
                  child: ListView.builder(
                    itemExtent: 80,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    itemCount: weeklyPlan.length,
                    itemBuilder:(context,index){
                    return Container(
                      child: Container(
                        padding: StaticPadding.paddingH30(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              weeklyPlan[index].time,
                              style: FontData().montFont50012GreyLightTextStyle,
                            ),
                            SizedBox(width: context.widthPx *24,),
                            Container(
                              height: 67,
                                width: context.widthPx *220,
                                margin: EdgeInsets.only(right:30),
                                padding: EdgeInsets.only(left: 10),


                                decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                  borderRadius: BorderRadius.circular(12.0)
                              ),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: context.heightPx *8,),
                                  Text(
                                    weeklyPlan[index].title,
                                    style: FontData().montFont60012offwhiteTextStyle,
                                  ),
                                  Text(
                                    weeklyPlan[index].des,
                                    style: FontData().montFont40010offwhiteTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        weeklyPlan[index].category,
                                        style: FontData().montFont60010offwhiteTextStyle,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right:10),

                                        child: Text(
                                          weeklyPlan[index].timeduration,
                                          style: FontData().montFont4008offwhiteTextStyle,
                                        ),
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: context.heightPx *10,),
                                ],
                              )


                            )
                          ],
                        ),
                      ),

                    );

                  }
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // _DataSource getCalendarDataSource() {
  //   final List<Appointment> appointments = <Appointment>[];
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
  //     endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
  //     subject: 'Release Meeting',
  //     color: Colors.lightBlueAccent,
  //   ));
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
  //     endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
  //     subject: 'Performance check',
  //     color: Colors.amber,
  //   ));
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
  //     endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
  //     subject: 'Support',
  //     color: Colors.green,
  //   ));
  //   appointments.add(Appointment(
  //     startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
  //     endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
  //     subject: 'Retrospective',
  //     color: Colors.purple,
  //   ));
  //
  //   return _DataSource(appointments);
  // }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      setState(() {
        _month = DateFormat('MMMM')
            .format(viewChangedDetails
                .visibleDates[viewChangedDetails.visibleDates.length ~/ 2])
            .toString();
        _year = DateFormat('yyyy')
            .format(viewChangedDetails
                .visibleDates[viewChangedDetails.visibleDates.length ~/ 2])
            .toString();
      });
    });
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
