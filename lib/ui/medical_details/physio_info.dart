import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/medical_detail_model/physio_medical_model.dart';
import 'package:flutter_template/services/api/medical_details_service/medical_detail_service.dart';
import 'package:flutter_template/ui/medical_details/athelete_medical_about.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/widgets/alert_widgets/future_handling_alert.dart';

import '../../models/medical_detail_model/save_doctor_model.dart';
import '../../utils/theme/app_colors.dart';

class PhysioInfo extends StatefulWidget {
  const PhysioInfo({Key? key}) : super(key: key);

  @override
  State<PhysioInfo> createState() => _PhysioInfoState();
}

class _PhysioInfoState extends State<PhysioInfo> {
  bool isAgree = false;
  String apiSuccess = '';
  var nameController = TextEditingController();
  var phoneNoController = TextEditingController();
  var emailController = TextEditingController();




  final _formKey = GlobalKey<FormState>();

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
                          physioInfo,
                          style: const FontData().montFont70020TextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPx * 27,
                  ),



                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 56),

                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: TextFormField(
                      controller: nameController,
                      style: FontData().montFont500TextStyle,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: context.heightPx *16),



                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                        ),


                        hintText: name,

                        //make hint text
                        hintStyle:  FontData().montFont500TextStyle,



                      ),
                    ),
                  ),
                  SizedBox(height: context.heightPx*20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      style: FontData().montFont500TextStyle,

                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: context.heightPx *16),


                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                        ),


                        hintText: email,

                        //make hint text
                        hintStyle:  FontData().montFont500TextStyle,

                      ),
                    ),
                  ),
                  SizedBox(height: context.heightPx*20,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 56),
                    decoration: BoxDecoration(
                      color: AppColors.textFieldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: TextFormField(
                      controller: phoneNoController,
                      style: FontData().montFont500TextStyle,

                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: context.heightPx *16),


                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                        ),


                        hintText: phoneno,

                        //make hint text
                        hintStyle:  FontData().montFont500TextStyle,

                      ),
                    ),
                  ),
                  SizedBox(height: context.heightPx*20,),




                  GestureDetector(
                    onTap: () async{
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        SaveDoctorResponseModel saveDoctorResponse = SaveDoctorResponseModel(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneNoController.text,
                          saveNextPage: true,skip: true,

                        );
                        await _saveDoctorDetails(saveDoctorResponse);
                      }
                      },

                    child: Container(
                      height: context.heightPx * 42,
                      width: context.widthPx * 280,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                        child: Center(
                          child: Text(
                            next,
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
          ),
        ),
      ),
    );
  }
  Future<void> _saveDoctorDetails(SaveDoctorResponseModel saveDoctorResponseModel) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await MedicalDetailService.saveDoctorInfo(saveDoctorResponseModel);
        debugPrint(model.status.toString());
        if (model.status) {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AtheleteMedicalInfoAbout()));
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
