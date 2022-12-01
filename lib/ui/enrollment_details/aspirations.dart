import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/aspirations_model/aspirations_model.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/common_model/authentication_response_model.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/services/api/aspirations_service/aspirations_service.dart';
import 'package:flutter_template/ui/enrollment_details/self_evaluation_quiz.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';
import 'package:provider/provider.dart';

import '../../models/aspirations_model/get_aspiration_model.dart';
import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class Aspirations extends StatefulWidget {
  const Aspirations({Key? key}) : super(key: key);

  @override
  State<Aspirations> createState() => _AspirationsState();
}

class _AspirationsState extends State<Aspirations> {
  bool isAgree = false;
  String apiSuccess = '';


  var txtSixMonthsController = TextEditingController();
  var txtTwelveMonthsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _getAspirationDetails();
    });
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.heightPx * 70,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.only(left: context.heightPx * 49),
                          child: SvgPicture.asset(Assets.icons.iconBackarrow),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          aspirations,
                          style: const FontData().montFont20TextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 37,
                  ),
                  Container(
                    height: context.heightPx * 120,
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextFormField(
                      maxLength: 10,
                      controller: txtSixMonthsController,
                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),

                        hintText: sixmonths,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Container(
                    height: context.heightPx * 120,
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextFormField(
                      controller: txtTwelveMonthsController,
                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),

                        hintText: twelevemonths,

                        //make hint text
                        hintStyle: FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 56),
                      child: Image.asset(Assets.images.imageAspiration.path),
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        AspirationsModel aspirationModel = AspirationsModel(
                          inSixMonths: txtSixMonthsController.text,
                          inTwelveMonths: txtTwelveMonthsController.text,
                          saveNextPage: true,

                        );
                        await _aspirationDetails(aspirationModel);

                      }
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
                              save,
                              // _display ? "hide logo" : "display logo",
                              style: const FontData().montFont70016TextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _aspirationDetails(AspirationsModel aspirationsModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        LoginSuccessModel model = await AspirationsService.aspirationsInfo(aspirationsModel);
        debugPrint(model.status.toString());

        if (model.message=='success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SelfEvaluationQuiz()),);
          if (mounted) {
            await context
                .read<AuthenticationProvider>()
                .saveUserDetails(authToken: model.token, userName: '', userId: model.id,);
            debugPrint(model.token.toString());



          }

          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }
  Future<void> _getAspirationDetails( ) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        GetAspirationsModel model = await AspirationsService.getAspirations();
        debugPrint(model.status.toString());

        if (model.message=='success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SelfEvaluationQuiz()),);


          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

}
