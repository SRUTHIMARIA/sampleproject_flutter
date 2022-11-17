import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/NotificationModel/notification_model.dart';
import '../../models/WeeklyPlanModel/weekly_plan_model.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_screen.dart';
import 'package:flutter_template/ui/homepage/Notification/notification.dart';
import 'package:flutter_template/ui/homepage/app_drawer.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import '../../gen/assets.gen.dart';
import '../../utils/constants/font_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _month, _year;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const AppDrawer(),
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
                      // context.watch<DrawerScreenProvider>().currentScreen;
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 32),
                      child: SvgPicture.asset(Assets.icons.iconDrawer),
                    ),
                  ),
                  SizedBox(
                    width: context.widthPx * 160,
                  ),
                  InkWell(
                    onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ChatScreen())),

                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 170),
                      child: SvgPicture.asset(Assets.icons.iconChat),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NotificationScreen())),

                    child: Container(
                      margin: EdgeInsets.only(left: context.heightPx * 20),
                      child: SvgPicture.asset(Assets.icons.iconNotification),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  // itemExtent: 300,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: sliderModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: context.heightPx * 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        sliderModel[index].image,
                        width: 200,
                      ),
                    );
                  },),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '$_month',
                      style: const FontData().montFont60018TextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      '$_year',
                      style: const FontData().montFont60018TextStyle,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  margin: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: SfCalendar(
                      backgroundColor: AppColors.textFieldBgColor,
                      view: CalendarView.month,
                      // dataSource: getCalendarDataSource(),
                      onViewChanged: viewChanged,
                      headerStyle: CalendarHeaderStyle(
                        textStyle: const FontData().montFont60014TextStyle,),
                      headerDateFormat: DateFormat.WEEKDAY,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: weeklyPlan.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weeklyPlan[index].time,
                            style: const FontData()
                                .montFont50012GreyLightTextStyle,
                          ),
                          SizedBox(
                            width: context.widthPx * 24,
                          ),
                          Container(
                            height: 65,
                            width: context.widthPx * 280,
                            margin: const EdgeInsets.only(right: 30),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.0)),),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.heightPx * 8,
                                ),
                                Text(
                                  weeklyPlan[index].title,
                                  style: const FontData()
                                      .montFont60012offwhiteTextStyle,
                                ),
                                Text(
                                  weeklyPlan[index].des,
                                  style: const FontData()
                                      .montFont40010offwhiteTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      weeklyPlan[index].category,
                                      style: const FontData()
                                          .montFont60010offwhiteTextStyle,
                                    ),
                                    Container(
                                      margin:
                                      const EdgeInsets.only(right: 10),
                                      child: Text(
                                        weeklyPlan[index].timeduration,
                                        style: const FontData()
                                            .montFont4008offwhiteTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.heightPx * 10,
                                ),
                              ],
                            ),),
                        ],
                      ),
                    );
                  },),
              ),
            ],
          ),
        ),
      ),);
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
    SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
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
