
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/student_enrollment_model/student_enrollment_model.dart';
import 'package:flutter_template/services/api/enrollment_service/enrollment_service.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';

import '../../utils/constants/font_data.dart';


class UserReview extends StatefulWidget {
  const UserReview({Key? key}) : super(key: key);

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  String apiSuccess = '';



  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
          ()=>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhoAmIScreen())),

      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
              //   await _studentEnrollment(StudentEnrollmentModel(status: true, message: '', data: ));
              // }),
    );

  }

  // void loadData() async {
  //   await Future.delayed(const Duration(seconds: 3),
  //       {}>Navigator.push(context,  SplashAnimationScreen()));
  // }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: context.heightPx * 36,
                ),
                Image.asset(Assets.images.imageUserReview.path),

                SizedBox(
                  height: context.heightPx * 12,
                ),

                Container(

                  margin: EdgeInsets.only(left: 12.0),
                  child: Text(
                    underReview,
                    style: const FontData().montFont20TextStyle,
                  ),
                ),

                SizedBox(
                  height: context.heightPx * 12,
                ),
            Container(

              margin: EdgeInsets.only(left: 12.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  underReviewSub,
                  style: const FontData().montFont13TextStyle,
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

  Future<void> _studentEnrollment(StudentEnrollmentModel studentEnrollmentModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await StudentEnrollmentService.getStudentEnrollment(studentEnrollmentModel);
        debugPrint(model.status.toString());
        if (model.message=="success") {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhoAmIScreen()));
          // context.router.replaceAll([const ParentDetailsSecondary()]);

          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

}

