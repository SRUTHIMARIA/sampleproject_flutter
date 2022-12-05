import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/models/student_feedback_model/get_student_feedbacks_model.dart';
import 'package:flutter_template/models/student_feedback_model/student_feedback_model.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/services/api/student_feedback_service/student_feedback_service.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/alert_widgets/future_handling_alert.dart';
import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import '../../utils/static/static_padding.dart';
import '../parent_details/parent_details_primary.dart';

class WhyJoinScreen extends StatefulWidget {

  @override
  State<WhyJoinScreen> createState() => _WhyJoinScreenState();
}

class _WhyJoinScreenState extends State<WhyJoinScreen> {
  bool closeTopContainer = false;
  double topContainer = 0;
  ScrollController controller = ScrollController();

  String apiSuccess = '';
  var txtFeedbackController = TextEditingController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // context.read<SportsListProvider>().getSportsListData();
      await _getStudentFeedbacks();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:  [
            AppColors.gradientColorSplash,
            AppColors.bgPrimarySplash,
          ],),),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.heightPx * 63,
            ),
            InkWell(
              onTap: () =>Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.only(left: context.heightPx * 49),
                child: SvgPicture.asset(Assets.icons.backarrow),
              ),
            ),
            SizedBox(
              height: context.heightPx * 20,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: context.heightPx * 49),
                child: Image.asset(Assets.images.imageAthelete.path),
              ),
            ),
            //
            SizedBox(
              height: context.heightPx * 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: StaticPadding.paddingH50(context),

                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  joinAssist,
                  style: const FontData().montFont14TextStyle,
                ),
              ),
            ),
            SizedBox(
              height: context.heightPx * 16,
            ),
            Container(
              height: context.heightPx * 175,
              margin: EdgeInsets.symmetric(horizontal: 56),
              decoration: BoxDecoration(
                color: AppColors.textFieldBgColor,
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: TextFormField(
                controller: txtFeedbackController,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                style: FontData().montFont500TextStyle,
                decoration: InputDecoration(
                  focusColor: AppColors.textFieldBgColor,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,

                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),

                  fillColor: AppColors.textFieldBgColor,
                  contentPadding: EdgeInsets.only(left: 20.0),

                  //make hint text
                  hintStyle: FontData().montFont500TextStyle,
                ),
              ),
            ),
            SizedBox(
              height: context.heightPx * 24,
            ),

            GestureDetector(
              onTap: () async=>
               await _saveStudentFeedback(StudentFeedbackModel(feedback: txtFeedbackController.text, saveNextPage: true)),


              child: Container(
                margin: EdgeInsets.only(left: context.heightPx *52),
                height: context.heightPx * 36,
                width: context.widthPx * 125,
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
          ],
        ),
      ),
    );
  }

  Future<void> _saveStudentFeedback(StudentFeedbackModel studentFeedbackModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        final provider = context.read<AuthenticationProvider>();
        ApiErrorResponseModel model = await StudentFeedbackService.studentFeedbackInfo(studentFeedbackModel);
        debugPrint(model.status.toString());

        if (model.message == 'success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ParentDetailPrimary()));


          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

  Future<void> _getStudentFeedbacks() async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        GetStudentFeedbackModel model = await StudentFeedbackService.getStudentFeedbackInfo();
        debugPrint(model.status.toString());
        if (model.message == 'success') {
          apiSuccess = model.message;
          debugPrint(model.message);

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
