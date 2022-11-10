import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../utils/constants/strings.dart';
import '../../../utils/theme/app_colors.dart';

class PhysicalAndMindset extends StatefulWidget {
  const PhysicalAndMindset({Key? key}) : super(key: key);

  @override
  State<PhysicalAndMindset> createState() => _PhysicalAndMindsetState();
}

class _PhysicalAndMindsetState extends State<PhysicalAndMindset> {
  bool _display = true;
  TextEditingController dateInput = TextEditingController();
  String pickedDate="";
  DateTime _dateTime = DateTime.now();
  String? _month, _year;


  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


  Widget buildTextField(
      {String? hint, required TextEditingController controller,}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.themeColor, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.themeColor, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.heightPx * 70,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () =>
                        Navigator.pop(context),

                      child: Container(
                        margin: EdgeInsets.only(left: context.heightPx * 49),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        physicalAndMindset,
                        style: const FontData().montFont20TextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.heightPx * 37,
                ),
                Container(
                  padding: StaticPadding.paddingH50(context),
                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    physicalGoal,
                    style: const FontData().montFont60014TextStyle,
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 6,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextFormField(
                    style: FontData().montFont50012GreyColorTextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),

                      fillColor: AppColors.textFieldBgColor,

                      hintText: goal,

                      //make hint text
                      hintStyle: FontData().montFont50012GreyColorTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 16,
                ),
                Container(
                  height: context.heightPx * 120,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    //Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont50012GreyColorTextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: InputBorder.none,

                      fillColor: AppColors.textFieldBgColor,

                      hintText: important,

                      //make hint text
                      hintStyle: FontData().montFont50012GreyColorTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 16,
                ),
                Container(
                  height: context.heightPx * 120,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    //Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont50012GreyColorTextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: InputBorder.none,

                      fillColor: AppColors.textFieldBgColor,

                      hintText: aboutIt,

                      //make hint text
                      hintStyle: FontData().montFont50012GreyColorTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 26,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont50012GreyColorTextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: AppColors.textFieldBgColor,
                      hintText: whenwill,
                      hintStyle: const FontData().montFont50012GreyColorTextStyle,
                      suffixIcon: InkWell(
                          onTap: () async{
                            SfCalendar(


                              backgroundColor: AppColors.textFieldBgColor,
                              view: CalendarView.month,
                              // dataSource: getCalendarDataSource(),
                              onViewChanged: viewChanged,
                              headerStyle:CalendarHeaderStyle(textStyle: FontData().montFont60014TextStyle),
                              headerDateFormat: DateFormat.WEEKDAY,
                            );
                            // DateTime? pickedDate = await showRoundedDatePicker(
                            //     context: context,
                            //     borderRadius: 12,
                            //     theme: ThemeData(primaryColor: AppColors.textFieldBgColor),
                            //     styleDatePicker: MaterialRoundedDatePickerStyle(
                            //       textStyleDayButton: FontData().montFont60014TextStyle,
                            //       //
                            //       // textStyleYearButton: TextStyle(
                            //       //   fontSize: 52,
                            //       //   color: Colors.white,
                            //       // ),
                            //       textStyleDayHeader: FontData().montFont50012BlackTextStyle,
                            //       textStyleCurrentDayOnCalendar:
                            //       TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
                            //       textStyleDayOnCalendar: FontData().montFont50012GreyTextStyle,
                            //       textStyleDayOnCalendarSelected:
                            //       FontData().montFont50012WhiteTextStyle,
                            //       textStyleDayOnCalendarDisabled:FontData().montFont50012GreyTextStyle,
                            //       textStyleMonthYearHeader:
                            //     FontData().montFont60012TextStyle,
                            //       paddingDatePicker: EdgeInsets.all(0),
                            //       paddingMonthHeader: EdgeInsets.all(32),
                            //       paddingActionBar: EdgeInsets.all(16),
                            //       paddingDateYearHeader: EdgeInsets.all(32),
                            //       sizeArrow:30,
                            //       colorArrowNext: AppColors.popTextGrey,
                            //       colorArrowPrevious:  AppColors.popTextGrey,
                            //       marginLeftArrowPrevious: 16,
                            //       marginTopArrowPrevious: 16,
                            //       marginTopArrowNext: 16,
                            //       marginRightArrowNext: 32,
                            //
                            //       textStyleButtonAction:FontData().montFont70014TextStyle,
                            //       textStyleButtonPositive:
                            //       FontData().montFont70014TextStyle,
                            //       textStyleButtonNegative: FontData().montFont70014TextStyle,
                            //       decorationDateSelected: BoxDecoration(color: AppColors.darkGreen, shape: BoxShape.circle),
                            //       backgroundPicker: AppColors.textFieldBgColor,
                            //       backgroundActionBar: AppColors.textFieldBgColor,
                            //       backgroundHeaderMonth: AppColors.textFieldBgColor,
                            //     ),
                            //
                            //     styleYearPicker: MaterialRoundedYearPickerStyle(
                            //       textStyleYear: TextStyle(fontSize: 40, color: Colors.white),
                            //       textStyleYearSelected:
                            //       TextStyle(fontSize: 56, color: AppColors.blackColor, fontWeight: FontWeight.bold),
                            //       heightYearRow: 100,
                            //       backgroundPicker:AppColors.textFieldBgColor,
                            //     ),
                            //     initialDate: DateTime.now(),
                            //     firstDate: DateTime(2000),
                            //     lastDate: DateTime(2100));
                            //
                            // if (pickedDate != null) {
                            //   print(
                            //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            //   String formattedDate =
                            //       DateFormat('yyyy-MM-dd').format(pickedDate);
                            //   print(
                            //       formattedDate); //formatted date output using intl package =>  2021-03-16
                            //   setState(() {
                            //     dateInput.text =
                            //         formattedDate; //set output date to TextField value.
                            //   });
                            // } else {}
                            // timepicker();
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.darkGreen,
                            size: 16,
                          )),
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(pickedDate.toString()

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    style: FontData().montFont50012GreyColorTextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      fillColor: AppColors.textFieldBgColor,

                      hintText: wherewill,

                      //make hint text
                      hintStyle: FontData().montFont50012GreyColorTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 26,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhysicalAndMindset()));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: context.heightPx * 42,
                      width: context.widthPx * 280,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
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
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget timepicker() {
    return  TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.deepOrange
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.yellow
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}

