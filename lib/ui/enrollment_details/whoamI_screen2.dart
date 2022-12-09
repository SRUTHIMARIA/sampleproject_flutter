import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/self_evaluation_model/get_selfevaluation.dart';
import 'package:flutter_template/models/self_evaluation_model/self_evaluation_model.dart';
import 'package:flutter_template/services/api/self_evaluation_service/self_evaluation_service.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/widgets/alert_dialog/future_handling_alert.dart';
import '../../utils/constants/strings.dart';
import '../../utils/theme/app_colors.dart';

class WhoAmIScreenTwo extends StatefulWidget {
  const WhoAmIScreenTwo({Key? key}) : super(key: key);

  @override
  State<WhoAmIScreenTwo> createState() => _WhoAmIScreenTwoState();
}

class _WhoAmIScreenTwoState extends State<WhoAmIScreenTwo> {
  bool isAgree = false;
  String apiSuccess = '';
  int imageId=1;

  var myValuesController = TextEditingController();
  var motivatedByController = TextEditingController();
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  List<InspiredBy> inspirationByModel = [];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // context.read<SportsListProvider>().getSportsListData();
      // await _getSelfEvaluationDetails();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        whoamI,
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
                    controller: myValuesController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),


                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: InputBorder.none,
                      hintText: values,
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
                    controller: motivatedByController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),

                      focusedBorder: InputBorder.none,
                      hintText: motivated,
                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 56),
                  child: Text(
                    peopleInspire,
                    style: FontData().montFont500TextStyle,
                  ),),
                SizedBox(
                  height: context.heightPx * 12,
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
                      focusColor: AppColors.textFieldBgColor,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      ),

                      fillColor: AppColors.textFieldBgColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      hintText: name,
                      //make hint text
                      hintStyle: FontData().montFont500TextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
                Container(
                  height: context.heightPx * 100,
                  margin: EdgeInsets.symmetric(horizontal: 56),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          child: Image.asset(Assets.images.uploadedImage.path),),
                      SizedBox(
                        height: context.heightPx * 6,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                             controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            style: const FontData().montFont500TextStyle,
                            decoration: InputDecoration(
                              focusColor: AppColors.textFieldBgColor,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                              ),
                              fillColor: AppColors.textFieldBgColor,
                              contentPadding: EdgeInsets.only(left: 4.0),
                              hintText: inspire,
                              //make hint text
                              hintStyle: const FontData().montFont500TextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: context.heightPx * 20,
                ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: ()async => await _selfEvaluationDetails(InspirationsPostParams(
              myValues: myValuesController.text,
              saveNextPage: true,
              motivatedBy: motivatedByController.text,
                  inspiredBy: [],)),
                child: Container(
                  height: context.heightPx * 42,
                  width: context.widthPx * 280,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),),
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
    );
  }

  Future<void> _selfEvaluationDetails(InspirationsPostParams inspirationsPostParams) async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        ApiErrorResponseModel model = await SelfEvaluationService.selfEvaluationInfo(inspirationsPostParams);
        debugPrint(model.status.toString());


        if (model.message == 'success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WhoAmIScreenTwo()));


          return ApiStatus.success;
        } else {
          apiError = model.message;

          return ApiStatus.error;
        }
      },
    );
  }

  Future<void> _getSelfEvaluationDetails() async {
    String apiError = '';
    handleFutureWithAlert(
      context: context,
      getErrorMessage: () {
        return apiError;
      },
      function: () async {
        GetSelfEvalutionModel model = await SelfEvaluationService.getSelfEvaluationInfo();
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
