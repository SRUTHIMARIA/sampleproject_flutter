import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/ui/feedback/feedback.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_session.dart';
import 'package:flutter_template/ui/profile/profile.dart';
import 'package:flutter_template/ui/reports/reports.dart';
import 'package:flutter_template/ui/settings/settings.dart';
import 'package:flutter_template/ui/subscriptions/subscriptions.dart';
import '../../models/WeeklyPlanModel/weekly_plan_model.dart';
import 'package:flutter_template/ui/homepage/Chat/chat_screen.dart';
import 'package:flutter_template/ui/homepage/Notification/notification.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import '../../gen/assets.gen.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.40),
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset(
                Assets.icons.iconDrawer,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ChatSession(),),),
            child: Container(
              margin: EdgeInsets.only(left: context.heightPx * 200),
              child: SvgPicture.asset(Assets.icons.iconChat),
            ),
          ),
          InkWell(
            onTap: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationScreen())),
            child: Container(
              margin: EdgeInsets.only(
                left: context.heightPx * 40,
                right: context.heightPx * 40,
              ),
              child: SvgPicture.asset(Assets.icons.iconNotification),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.bgPrimarySplash.withOpacity(0.80),
        child: Column(
          children: [
             DrawerHeader(
               child: Container(
              // color: AppColors.grey,
               width: double.infinity,
               height: context.heightPx * 150,
               padding: const EdgeInsets.only(top: 20.0),
               child: Row(
                 children: [
                   Image.asset(Assets.images.imageUser.path,width: 80.0,),

                   const SizedBox(width: 10),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: context.heightPx * 50),
                       Text(
                         'Robert Fox',
                         style: const FontData().montFont70018TextStyle,
                       ),
                       const SizedBox(height: 4),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'robert.hanson@example.com',
                             style: const FontData().montFont40012greyTextStyle,
                           ),

                         ],
                       ),
                     ],
                   ),
                 ],
               ),
             ),),
            // _drawerHeader(),

            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
              child: ListTile(
               leading: SvgPicture.asset(Assets.icons.homeIcon),
                title: Text(
                  'Home',
                 style: const FontData().montFont50014GreenTextStyle,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.profileIcon),

                title: Text(
                  'Profile',
                  style: const FontData().montFont50014GreenTextStyle,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.settingsIcon),

                title: Text(
                  'Settings',
                  style: const FontData().montFont50014GreenTextStyle,

                ),
              ),
            ),

            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Reports(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.reportsIcon),

                title: Text(
                  'Reports',
                  style: const FontData().montFont50014GreenTextStyle,

                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Feedbacks(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.feedbackIcon),

                title: Text(
                  'Feedback',
                  style: const FontData().montFont50014GreenTextStyle,

                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Subscriptions(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.subscriptionIcon),

                title: Text(
                  'Subscription',
                  style: const FontData().montFont50014GreenTextStyle,

                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Subscriptions(),
                ),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.icons.iconLogout),

                title: Text(
                  'Logout',
                  style: const FontData().montFont50014GreenTextStyle,

                ),
              ),
            ),
          ],
        ),
      ),

      // drawer:  MyDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.40),
        ),
        child: Column(
          children: [


            Flexible(
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
                      width: 240,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_month',
                  style: const FontData().montFont60018TextStyle,
                ),
                Text(
                  '$_year',
                  style: const FontData().montFont60018TextStyle,
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
                      textStyle: const FontData().montFont60014TextStyle,
                    ),
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
                      vertical: 10,
                      horizontal: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weeklyPlan[index].time,
                          style: const FontData().montFont50012GreyLightTextStyle,
                        ),
                        SizedBox(
                          width: context.widthPx * 24,
                        ),
                        Container(
                          height: 65,
                          width: context.widthPx * 270,
                          margin: const EdgeInsets.only(right: 30),
                          padding: const EdgeInsets.only(left: 10),
                          decoration: const BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.heightPx * 8,
                              ),
                              Text(
                                weeklyPlan[index].title,
                                style: const FontData().montFont60012offwhiteTextStyle,
                              ),
                              Text(
                                weeklyPlan[index].des,
                                style: const FontData().montFont40010offwhiteTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    weeklyPlan[index].category,
                                    style: const FontData().montFont60010offwhiteTextStyle,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      weeklyPlan[index].timeduration,
                                      style: const FontData().montFont4008offwhiteTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: context.heightPx * 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
            .format(viewChangedDetails.visibleDates[viewChangedDetails.visibleDates.length ~/ 2])
            .toString();
        _year = DateFormat('yyyy')
            .format(viewChangedDetails.visibleDates[viewChangedDetails.visibleDates.length ~/ 2])
            .toString();
      });
    });
  }
}

// class DrawerHeader extends StatelessWidget {
//   const DrawerHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: context.heightPx * 150,
//       padding: const EdgeInsets.only(top: 20.0),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundImage: AssetImage('assets/images/image_user.png'),
//             radius: 40.0,
//           ),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: context.heightPx * 50),
//               Text(
//                 'Robert Fox',
//                 style: TextStyle(
//                   fontSize: context.heightPx * 18,
//                   color: AppColors.darkGreen,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'OpenSans',
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   Text(
//                     '5.0',
//                     style: TextStyle(
//                       fontSize: context.heightPx * 14,
//                       color: AppColors.whiteColor,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: 'OpenSans',
//                     ),
//                   ),
//                   SizedBox(width: context.heightPx * 2),
//                   Icon(
//                     Icons.star,
//                     color: AppColors.redColor,
//                     size: context.heightPx * 14,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

