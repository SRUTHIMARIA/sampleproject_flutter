import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/medical_detail_model/add_medical_model.dart';
import 'package:flutter_template/models/medical_detail_model/get_medical_details_model.dart';
import 'package:flutter_template/models/medical_detail_model/save_permission_model.dart';
import 'package:flutter_template/services/api/medical_details_service/medical_detail_service.dart';
import 'package:flutter_template/ui/medical_details/athelete_medical_info_injuries.dart';

import 'package:flutter_template/utils/constants/fontdata.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/widgets/alert_widgets/future_handling_alert.dart';

import '../../utils/static/static_padding.dart';
import '../../utils/theme/app_colors.dart';

class AtheleteMedicalInfoAllergies extends StatefulWidget {
  const AtheleteMedicalInfoAllergies({Key? key}) : super(key: key);

  @override
  State<AtheleteMedicalInfoAllergies> createState() => _AtheleteMedicalInfoAllergiesState();
}

class _AtheleteMedicalInfoAllergiesState extends State<AtheleteMedicalInfoAllergies> {
  bool isChecked = false;
  bool isCheckedNo = false;
  bool isDisplay = false;
  String apiSuccess = '';
  var detailsController = TextEditingController();
  var protocolController = TextEditingController();


  bool isAgree = false;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _medicalDetailsType(GetMedicalDetailsModel(params: 'allergy'));
      _savePermissionDetails(SavePermissionResponseModel(permission_status: "yes", saveNextPage: true));
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
                children: [
                  SizedBox(
                    height: context.heightPx * 70,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: context.heightPx * 49),
                        child: SvgPicture.asset(Assets.icons.iconBackarrow),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.0),
                        child: Text(
                          atheleteinfo,
                          style: const FontData().montFont70020TextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 46),
                      margin: EdgeInsets.only(left: 12.0),
                      child: Text(
                        allergy,
                        style: const FontData().montFont500TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  Padding(
                    padding: StaticPadding.paddingH60(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.0,
                          width: 12.0,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: AppColors.textFieldBgColor,
                            ),
                            child: Checkbox(
                              value: this.isChecked,
                              checkColor: AppColors.whiteColor,
                              activeColor: AppColors.themeColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.isChecked = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        // You can play with the width to adjust your
                        // desired spacing
                        SizedBox(width: 10.0),
                        Text(
                          yes,
                          style: const FontData().montFont50010TextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 21,
                  ),
                  Padding(
                    padding: StaticPadding.paddingH60(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.0,
                          width: 12.0,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: AppColors.textFieldBgColor,
                            ),
                            child: Checkbox(
                              focusColor: AppColors.themeColor,
                              value: this.isCheckedNo,
                              checkColor: AppColors.whiteColor,
                              activeColor: AppColors.themeColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.isCheckedNo = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        // You can play with the width to adjust your
                        // desired spacing
                        SizedBox(width: 10.0),
                        Text(
                          no,
                          style: const FontData().montFont50010TextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.heightPx * 27,
                  ),
                  isChecked
                      ? Container(
                         margin: EdgeInsets.symmetric(horizontal: 56),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBgColor,
                            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: TextFormField(
                            controller: detailsController,
                            style: FontData().montFont500TextStyle,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: context.heightPx * 16),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                              ),
                              fillColor: Colors.grey,
                              hintText: enterDetails,
                              //make hint text
                              hintStyle: FontData().montFont500TextStyle,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  isChecked
                      ? Container(
                          height: context.heightPx * 88,
                          margin: EdgeInsets.symmetric(horizontal: 56),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBgColor,
                            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: TextFormField(
                            controller: protocolController,
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
                              hintText: 'What is the protocol in the case of an incident?',

                              //make hint text
                              hintStyle: FontData().montFont500TextStyle,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: context.heightPx * 20,
                  ),
                  isChecked
                      ? GestureDetector(
                    onTap: () async{

                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        AddOrUpdateMedicalResponseModel addMedicalModel = AddOrUpdateMedicalResponseModel(
                            detail: detailsController.text,
                            protocol: protocolController.text,
                            saveNextPage: true,
                            type: 'allergy',
                            moreDetail:''
                        );
                        await _updateMedicalDetails(addMedicalModel);
                      }
                    },
                            // Navigator.push(
                            //     context, MaterialPageRoute(builder: (context) => AtheleteMedicalInfoInjuries())),
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
                                  next,
                                  // _display ? "hide logo" : "display logo",
                                  style: const FontData().montFont70016TextStyle,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateMedicalDetails(AddOrUpdateMedicalResponseModel addOrUpdateMedicalResponseModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await MedicalDetailService.medicalDetails(addOrUpdateMedicalResponseModel);
        debugPrint(model.status.toString());
        if (model.status) {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AtheleteMedicalInfoInjuries()));
          // context.router.replaceAll([const ParentDetailsSecondary()]);

          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

  Future<void> _savePermissionDetails(SavePermissionResponseModel savePermissionResponseModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await MedicalDetailService.savePermissionInfo(savePermissionResponseModel);
        debugPrint(model.status.toString());
        if (model.status) {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AtheleteMedicalInfoInjuries()));
          // context.router.replaceAll([const ParentDetailsSecondary()]);

          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

  Future<void> _medicalDetailsType(GetMedicalDetailsModel getMedicalDetailsModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await MedicalDetailService.getMedicalDetails(getMedicalDetailsModel);
        debugPrint(model.status.toString());
        if (model.status) {
          apiSuccess = model.message;
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
