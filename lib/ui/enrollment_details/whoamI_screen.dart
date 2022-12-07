import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/self_evaluation_model/get_selfevaluation.dart';
import 'package:flutter_template/models/self_evaluation_model/self_evaluation_model.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/services/api/self_evaluation_service/self_evaluation_service.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';
import 'package:flutter_template/ui/enrollment_details/whoamI_screen2.dart';

import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/constants/strings.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:flutter_template/widgets/snackbar/text_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../services/api/self_evaluation_service/self_evaluation_widgets/image_picker_bottomsheet.dart';
import '../../utils/theme/app_colors.dart';
import '../../widgets/alert_dialog/future_handling_alert.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
  bool isAgree = false;
  String apiSuccess = '';
  var myValuesController = TextEditingController();
  var motivatedByController = TextEditingController();
  XFile? profileImage;
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // context.read<SportsListProvider>().getSportsListData();
      await _getSelfEvaluationDetails();
    });
  }

  Future<dynamic> uploadProfileImage(File file) async {
    debugPrint(file.path);
    final request = http.MultipartRequest('POST', Uri.parse(AtheleteAssist.selfEvaluation));

    var token = AuthenticationProvider.token;
    request.headers['Authorization'] = 'Bearer $token';
    request.files
        .add(await http.MultipartFile.fromPath('profile_image', file.path, contentType: MediaType('image', 'jpg')));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      AppSnackBar.showSnackBarWithText(text: 'Profile Image Updated Successfully', context: context);
    } else {
      AppSnackBar.showSnackBarWithText(text: 'Profile Image upload failed', context: context);
    }
    final body = json.decode(res.body);
    debugPrint(body);

    return body;
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
                    //Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: InputBorder.none,

                      fillColor: AppColors.textFieldBgColor,

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
                    //Normal textInputField will be displayed
                    maxLines: 5,
                    style: FontData().montFont500TextStyle,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: context.heightPx * 16),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),

                      fillColor: AppColors.textFieldBgColor,
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
                  ),
                ),
                SizedBox(
                  height: context.heightPx * 12,
                ),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                    ),
                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          height: context.heightPx * 260,
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBgColor,
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: context.heightPx * 40,
                              ),

                              // ElevatedButton(
                              //     onPressed: () async {
                              //       profileImage = await picker.pickImage(source: ImageSource.gallery);
                              //
                              //       setState(() {
                              //       });
                              //       },
                              //
                              //     child: Text(uploadphoto),
                              // ),

                              // profileImage == null?Container():Image.file(File(profileImage!.path),width: 200,height: 100,),
                              InkWell(
                                onTap: () async {
                                  // profileImage = await picker.pickImage(source: ImageSource.gallery),
                                  showModalBottomSheet<void>(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    // isScrollControlled: true,
                                    builder: (ctx) {
                                      return ImageUploadBottomSheetWidget(
                                        profileContext: context,
                                        profileImage: (XFile? image) =>
                                         setState(() {
                                          profileImage = image;
                                          uploadProfileImage(File(profileImage!.path));
                                        }),
                                      );
                                    },
                                  );

                                  // ImageUploadBottomSheetWidget(
                                  //   profileContext: context,
                                  //   profileImage: (XFile? image) =>
                                  //       setState(() async {
                                  //    profileImage = image;
                                  //     image = await picker.pickImage(source: ImageSource.camera);
                                  //     uploadProfileImage(File(profileImage!.path));
                                  //   }),
                                  // ),
                                  await _selfEvaluationDetails(InspirationsPostParams(
                                    myValues: myValuesController.text,
                                    saveNextPage: true,
                                    motivatedBy: motivatedByController.text,
                                    inspiredBy: [],
                                  ));
                                },

                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WhoAmIScreenTwo())),
                                child: DecoratedBox(
                                  position: DecorationPosition.background,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: Offset(5, 0),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: context.widthPx * 276,
                                    height: context.heightPx * 155,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset(Assets.images.imageAddphoto.path),
                                        ),
                                        Container(
                                          // margin: const EdgeInsets.symmetric(horizontal: 56),
                                          child: Text(
                                            uploadphoto,
                                            style: FontData().montFont70012TextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  child: profileImage == null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 56),
                          child: Image.asset(Assets.images.imageAddphoto.path),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 56),
                          child: Image.file(
                            File(profileImage!.path),
                            fit: BoxFit.scaleDown,
                            width: 100,
                            height: 100,
                          ),
                        ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 56),
                    child: Image.asset(Assets.images.imageWhoamI.path),
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
        final provider = context.read<AuthenticationProvider>();
        ApiErrorResponseModel model = await SelfEvaluationService.selfEvaluationInfo(inspirationsPostParams);
        debugPrint(model.status.toString());

        if (model.message == 'success') {
          apiSuccess = model.message;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WhoAmIScreenTwo()));

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
