import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class WeeklyGoalTimePicker extends StatefulWidget {
  @override
  _WeeklyGoalTimePickerState createState() => _WeeklyGoalTimePickerState();
}

class _WeeklyGoalTimePickerState extends State<WeeklyGoalTimePicker> {
  DateTime _dateTime = DateTime.now();


  String? setTime, setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = '${_hour!} : ${_minute!}';
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, ' ', am],).toString();
      });
    }
  }


  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, ' ', am],).toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 23,right: 23),
          height: context.heightPx *280,
          decoration: const BoxDecoration(
            color: AppColors.textFieldBgColor,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              Container(
                margin: const EdgeInsets.only(left: 24,top: 24),
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
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(color: Colors.grey[200]),
                              child: TextFormField(
                                  style: const FontData().montFont50010TextStyle,
                                textAlign: TextAlign.center,
                                onSaved: (String? val) =>
                                  setTime = val,

                                enabled: false,
                                keyboardType: TextInputType.text,
                                controller: _timeController,
                                decoration: InputDecoration(
                                    disabledBorder:
                                    UnderlineInputBorder(borderSide: BorderSide.none),
                                    // labelText: 'Time',
                                    contentPadding: EdgeInsets.all(5)),
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   '7:30 am',
                        //   // _display ? "hide logo" : "display logo",
                        //   style: const FontData().montFont50010TextStyle,
                        // ),
                        const Icon(
                          Icons.access_time,


                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: const FontData().montFont70016GreyTextStyle,
                highlightedTextStyle: const FontData().montFont70018TextStyle,
                spacing: 30,
                itemHeight: 50,
                isForce2Digits: true,
                onTimeChange: (time) =>
                  setState(() {
                    selectedDate = time;
                  }),

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
                        ],),
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
                  InkWell(
                    child: Container(
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
