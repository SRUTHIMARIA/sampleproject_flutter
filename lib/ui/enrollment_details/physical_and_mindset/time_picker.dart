import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/static_padding.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class WeeklyGoalTimePicker extends StatefulWidget {
  @override
  _WeeklyGoalTimePickerState createState() => _WeeklyGoalTimePickerState();
}

class _WeeklyGoalTimePickerState extends State<WeeklyGoalTimePicker> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 23,right: 23),
          height: context.heightPx *280,
          decoration: BoxDecoration(
            color: AppColors.textFieldBgColor,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              Container(
                margin: EdgeInsets.only(left: 24,top: 24),
                height: context.heightPx * 36,
                width: context.widthPx * 135,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "7:30 am",
                          // _display ? "hide logo" : "display logo",
                          style: const FontData().montFont50010TextStyle,
                        ),
                        Icon(
                          Icons.access_time,


                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child:TimePickerSpinner(
                  is24HourMode: false,
                  normalTextStyle: FontData().montFont70016GreyTextStyle,
                  highlightedTextStyle: FontData().montFont70018TextStyle,
                  spacing: 30,
                  itemHeight: 50,
                  isForce2Digits: true,
                  onTimeChange: (time) {
                    setState(() {
                      _dateTime = time;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.heightPx * 36,
                    width: context.widthPx * 135,
                    child: Container(
                      decoration:  BoxDecoration(
                        color: AppColors.themeColor,
                        gradient: LinearGradient(colors: [
                          AppColors.buttonGradient1.withOpacity(0.76), AppColors.buttonGradient2.withOpacity(0.63),
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      child: Center(
                        child: Text(
                          "Cancel",
                          // _display ? "hide logo" : "display logo",
                          style: const FontData().montFont70016ThemeColorTextStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: context.heightPx * 36,
                    width: context.widthPx * 135,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      child: Center(
                        child: Text(
                          "Add",
                          // _display ? "hide logo" : "display logo",
                          style: const FontData().montFont70016TextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
