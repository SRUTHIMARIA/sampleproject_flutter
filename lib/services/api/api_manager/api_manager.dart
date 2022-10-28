// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_template/services/navigation/routes.dart';
// import 'package:flutter_template/utils/app_preference/app_preference.dart';
// import 'package:flutter_template/utils/extensions/context_extensions.dart';
// import 'package:flutter_template/utils/theme/app_colors.dart';
// import 'package:flutter_template/widgets/snackbar/text_snackbar.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:ndialog/ndialog.dart';
//
// import 'package:path/path.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../models/common_model/api_error_response_model.dart';
// import '../../../providers/common_function_provider/common_funtion_provider.dart';
// import '../../../utils/settings/debug_api.dart';
// import '../../../utils/static/enums.dart';
// import '../../../widgets/alert_dialog/api_manager_progressbar.dart';
//
// class ApiManager {
//   String url;
//   BuildContext? context;
//   final String token;
//   bool showLoader;
//   bool showInternetErrors;
//   bool showSuccess;
//   bool showProcessErrors;
//   bool routeIfUnauthenticated;
//   List<int> successCodes;
//   final Object? jsonSendData;
//   final void Function(BasicProcessStatus)? processUpdates;
//   final void Function(Map<String, dynamic> responseData)? onInternetError;
//   final void Function(Map<String, dynamic> responseData)? onProcessFailure;
//   final void Function(Map<String, dynamic> responseData)? onProcessSuccess;
//
//   ApiManager(
//       {required this.url,
//         this.context,
//         this.token = "",
//         this.showLoader = true,
//         this.showInternetErrors = false,
//         this.showProcessErrors = true,
//         this.showSuccess = false,
//         this.jsonSendData,
//         this.processUpdates,
//         this.onProcessFailure,
//         this.onInternetError,
//         this.onProcessSuccess,
//         this.routeIfUnauthenticated = true,
//         this.successCodes = const [200, 201]}) {
//     if (context == null && (showLoader || showInternetErrors || showProcessErrors || showSuccess)) {
//       debugPrint(
//           "API MANAGER ERROR: You cant show loader or errors when context parameter is null. Add context parameter to show loaders and errors.");
//       showLoader = false;
//       showInternetErrors = false;
//       showProcessErrors = false;
//     }
//
//     context = CommonFunctionsProvider.navigatorKey.currentContext;
//
//
//   }
//
//   http.Response? response;
//   late ApiManagerProgressBar progress;
//   late Map<String, String> header;
//
//   BuildContext? getContext() {
//     return CommonFunctionsProvider.navigatorKey.currentContext;
//   }
//
//   String method = "";
//
//   ///Methods for handling various errors
//   void _handleInternetErrors(String body) {
//     // _logDetails(response: body);
//     if (showLoader && getContext() != null) {
//       progress.dismiss();
//     }
//     if (processUpdates != null) {
//       processUpdates!(BasicProcessStatus.failed);
//     }
//     if (showInternetErrors) {
//       if (body.startsWith("SocketException")) {
//         body =
//            'Failed to connect to internet. Please check your internet connection.';
//         BuildContext? context1 = getContext();
//         if (context1 != null) {
//           progress = ApiManagerProgressBar(context: context1);
//           progress.showAlertDialog(body: body, title: ('Error'));
//         }
//       }
//     }
//     if (onInternetError != null) {
//       onInternetError!(jsonDecode(body));
//     }
//   }
//
//   void _handleProcessErrors(String body, int statusCode) {
//     BuildContext? context2 = getContext();
//     if (showProcessErrors && context2 != null) {
//       ApiManagerProgressBar progressBar = ApiManagerProgressBar(context: context2);
//       ApiErrorResponseModel errorResponseModel = ApiErrorResponseModel.fromJson(jsonDecode(body));
//
//       String _getErrorMessage() {
//         if (errorResponseModel.payload.isEmpty) {
//           return ('Something went wrong.');
//         } else {
//           String errorMessage = errorResponseModel.statusMessage;
//           if (errorMessage == "Error") {
//             errorMessage = "";
//           }
//           for (String element in errorResponseModel.payload) {
//             errorMessage = errorMessage + "\n• " + element;
//           }
//           return errorMessage.isEmpty ? ('Something went wrong.') : errorMessage;
//         }
//       }
//
//       if (routeIfUnauthenticated && statusCode == 401) {
//         progressBar.showAlertDialog(
//             title: ('Error'),
//             body: _getErrorMessage(),
//             onOk: () {
//               context2.pushNamedAndRemoveUntil(ScreenNames.login);
//             },);
//       } else if (statusCode == 422 || statusCode == 500) {
//         progressBar.showAlertDialog(
//             title:('Error'),
//             body: (statusCode == 500)
//                 ? ('Internal server error.')
//                 : _getErrorMessage(),);
//       }
//     } else if (!showProcessErrors && routeIfUnauthenticated) {
//       if (context2 != null) {
//         context2.pushNamedAndRemoveUntil(ScreenNames.login);
//       }
//     }
//     if (onProcessFailure != null) {
//       onProcessFailure!(jsonDecode(body));
//     }
//   }
//
//   void _handleProcessSuccess(String body) {
//     BuildContext? context3 = getContext();
//     if (showLoader && context3 != null) {
//       progress.dismiss();
//     }
//     if (showSuccess && context3 != null) {
//       ApiManagerProgressBar progressBar = ApiManagerProgressBar(context: context3);
//       progressBar.showAlertDialog(
//         title: ('Success'),
//         body: ('The process was successful'),
//       );
//     }
//     if (onProcessSuccess != null) {
//       onProcessSuccess!(jsonDecode(body));
//     }
//   }
//
//   void _init() {
//     BuildContext? context4 = getContext();
//     if (showLoader && context4 != null) {
//       progress = ApiManagerProgressBar(context: context4);
//       progress.showDialog();
//     }
//     if (processUpdates != null) {
//       processUpdates!(BasicProcessStatus.doing);
//     }
//     if (token.isEmpty) {
//       header = {
//         "Accept": "application/json",
//         // "Content-type": "application/json",
//       };
//     } else {
//       header = {
//         "Accept": "application/json",
//         // "Content-type": "application/json",
//         'Authorization': 'Bearer $token'
//       };
//     }
//   }
//
//   void _handleProcessResponse() {
//     if (processUpdates != null) {
//       processUpdates!(BasicProcessStatus.done);
//     }
//     BuildContext? context5 = getContext();
//     if (showLoader && context5 != null) {
//       progress.dismiss();
//     }
//     if (successCodes.contains(response!.statusCode)) {
//       _handleProcessSuccess(response!.body);
//       if (processUpdates != null) {
//         processUpdates!(BasicProcessStatus.success);
//       }
//     } else {
//       debugApi(error: response!.body, url: url, method: method, sentData: jsonSendData.toString());
//       _handleProcessErrors(response!.body, response!.statusCode);
//       if (processUpdates != null) {
//         processUpdates!(BasicProcessStatus.failed);
//       }
//     }
//   }
//
//   ///Http methods
//   Future<void> post() async {
//     _init();
//     method = "POST";
//     try {
//       response = await http.post(Uri.parse(url), headers: header, body: jsonSendData);
//       _logDetails();
//       _handleProcessResponse();
//     } catch (e) {
//       _logDetails();
//       await debugApi(error: e.toString(), url: url, method: method, sentData: jsonSendData.toString());
//       _handleInternetErrors(e.toString());
//     }
//   }
//
//   Future<void> get() async {
//     _init();
//     method = "GET";
//     try {
//       response = await http.get(Uri.parse(url), headers: header);
//       _logDetails();
//       _handleProcessResponse();
//     } catch (e) {
//       _logDetails();
//       await debugApi(error: e.toString(), url: url, method: method, sentData: jsonSendData.toString());
//       _handleInternetErrors(e.toString());
//     }
//   }
//
//   Future<void> patch() async {
//     _init();
//     method = "PATCH";
//     try {
//       response = await http.patch(Uri.parse(url), headers: header, body: jsonSendData);
//       _logDetails();
//       _handleProcessResponse();
//     } catch (e) {
//       _logDetails();
//       await debugApi(error: e.toString(), url: url, method: method, sentData: jsonSendData.toString());
//       _handleInternetErrors(e.toString());
//     }
//   }
//
//   Future<void> delete() async {
//     _init();
//     method = "DELETE";
//     try {
//       response = await http.delete(Uri.parse(url), headers: header);
//       _logDetails();
//       _handleProcessResponse();
//     } catch (e) {
//       _logDetails();
//       await debugApi(error: e.toString(), url: url, method: method, sentData: jsonSendData.toString());
//       _handleInternetErrors(e.toString());
//     }
//   }
//
//   Future<void> multiPartFileUpload({required String filePath, required String fieldName, String? fileUploadURL}) async {
//     ProgressDialog? dialog;
//     BuildContext? context6 = getContext();
//     if (context6 != null) {
//       dialog = ProgressDialog(context6,
//           title: Center(child: Text("Uploading photo")),
//           message: Center(child: Text("Please wait")),
//           dismissable: false);
//       dialog.show();
//     }
//     debugPrint("fileUploadURL: $fileUploadURL");
//     http.MultipartRequest request =
//     http.MultipartRequest('POST', Uri.parse(fileUploadURL == null ? url : fileUploadURL + "?_method=patch"));
//     request.headers['Authorization'] = "Bearer " + await StaticAppPreferences.getToken();
//     request.headers['Content-Type'] = "application/json";
//     request.headers['Accept'] = "application/json";
//
//     request.files.add(await http.MultipartFile.fromPath(fieldName, filePath,
//         filename: basename(filePath), contentType: MediaType("video", '*')));
//
//     http.StreamedResponse response = await request.send();
//
//     http.Response res = await http.Response.fromStream(response);
//
//     if (res.statusCode == 200 && context != null) {
//       dialog!.setMessage(Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: Text("Successfully uploaded"),
//             ),
//             MaterialButton(
//               minWidth: context!.widthPx * 50,
//               height: context!.heightPx * 30,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               color: AppColors.themeColor,
//               onPressed: () {
//                 Navigator.of(context!).pop();
//                 _handleProcessSuccess(res.body);
//               },
//               child: Text(
//               "Ok",
//                 style: const TextStyle(color: AppColors.whiteColor),
//               ),
//             )
//           ],
//         ),
//       ));
//       dialog.setTitle(Center(child: Text("Successful")));
//       dialog.setLoadingWidget(Container());
//     } else {
//       final json = jsonDecode(res.body);
//       dialog!.setMessage(Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 json['payload'].toString().replaceAll("[", "").replaceAll("]", ""),
//                 style: TextStyle(color: AppColors.redColor, fontSize: getScaledSize(12, scale: 1.75)),
//               ),
//               // MaterialButton(
//               //   minWidth: 50,
//               //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               //   color: AppColors.themeColor,
//               //   // onPressed: () async {
//               //   //   await context!.read<MyProfileProvider>().reInitializeMyProfileProvider(context!);
//               //   // },
//               //   child: Text(
//               //    "Ok"),
//               //     style: const TextStyle(color: AppColors.whiteColor),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ));
//       dialog.setTitle(Text( "Error", style: TextStyle(fontSize: context!.textPx * 14)));
//       dialog.setLoadingWidget(Container());
//     }
//   }
//
//   Future<void> multiPartUploadCochMedia(
//       {String? coachImagePath, String? featuredImagePath, String? featuredVideoPath}) async {
//     ProgressDialog? dialog;
//     if (context != null) {
//       dialog = ProgressDialog(context!,
//           title: Center(child: Text( "Uploading media")),
//           message: Center(child: Text("Please wait")),
//           dismissable: false);
//       dialog.show();
//     }
//     http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers['Authorization'] = "Bearer " + await StaticAppPreferences.getToken();
//     request.headers['Content-Type'] = "application/json";
//     request.headers['Accept'] = "application/json";
//
//     if (coachImagePath != null) {
//       request.files.add(await http.MultipartFile.fromPath("coach_image_path", coachImagePath,
//           filename: basename(coachImagePath), contentType: MediaType("image", '*')));
//     }
//     if (featuredImagePath != null) {
//       request.files.add(await http.MultipartFile.fromPath("featured_image_path", featuredImagePath,
//           filename: basename(featuredImagePath), contentType: MediaType("image", '*')));
//     }
//     if (featuredVideoPath != null) {
//       request.files.add(await http.MultipartFile.fromPath("video_path", featuredVideoPath,
//           filename: basename(featuredVideoPath), contentType: MediaType("video", '*')));
//     }
//     http.StreamedResponse response = await request.send();
//
//     http.Response res = await http.Response.fromStream(response);
//
//     if (res.statusCode == 200 && context != null) {
//       AppSnackBar.showSnackBarWithText(context: context!, text: jsonDecode(res.body)['statusMessage'].toString());
//       Navigator.pop(context!);
//       Navigator.pop(context!);
//     } else {
//       final json = jsonDecode(res.body);
//       dialog!.setMessage(Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(json['payload'].toString().replaceAll("[", "").replaceAll("]", ""),
//                     style: TextStyle(color: AppColors.redColor, fontSize: getScaledSize(12, scale: 1.75))),
//               ),
//               // MaterialButton(
//               //   minWidth: context!.widthPx * 50,
//               //   height: context!.heightPx * 30,
//               //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               //   color: AppColors.themeColor,
//               //   onPressed: () async {
//               //     await context!.read<MyProfileProvider>().reInitializeMyProfileProvider(context!);
//               //   },
//               //   child: Text(
//               //     "Ok",
//               //     style: TextStyle(color: AppColors.whiteColor, fontSize: context!.widthPx * 14),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ));
//       dialog.setTitle(Text("Error", style: TextStyle(fontSize: context!.textPx * 14)));
//       dialog.setLoadingWidget(Container());
//     }
//   }
//
//   Future<void> multiPartFileUploadMultiImage({required List<File> mediafiles}) async {
//     BuildContext? context6 = getContext();
//     ProgressDialog? dialog;
//     if (context != null) {
//       dialog = ProgressDialog(context!,
//           title: Center(child: Text("Uploading media")),
//           message: Center(child: Text("Please wait")),
//           dismissable: false);
//       dialog.show();
//     }
//     http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
//     request.headers['Authorization'] = "Bearer " + await StaticAppPreferences.getToken();
//     request.headers['Content-Type'] = "application/json";
//     request.headers['Accept'] = "application/json";
//     int i = 0;
//     for (var file in mediafiles) {
//       request.files.add(await http.MultipartFile.fromPath("path[$i]", file.path,
//           filename: basename(file.path), contentType: MediaType("image", '*')));
//       i = i + 1;
//     }
//
//     http.StreamedResponse response = await request.send();
//
//     http.Response res = await http.Response.fromStream(response);
//
//     context6 = getContext();
//     debugPrint("res.statusCode: ${res.statusCode}");
//     if ((res.statusCode == 200 || res.statusCode == 201) && context6 != null) {
//       // AppSnackBar.showSnackBarWithText(
//       //     context: context!,
//       //     text: Translator.translate(context6, "Successfully uploaded"));
//       //Translator.translate(context6, "Successfully uploaded")
//
//       dialog!.setMessage(Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: Text("Successfully uploaded"),
//             ),
//             MaterialButton(
//               minWidth: context!.widthPx * 50,
//               height: context!.heightPx * 30,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               color: AppColors.themeColor,
//               onPressed: () {
//                 Navigator.of(context6!).pop();
//                 _handleProcessSuccess(res.body);
//               },
//               child: Text(
//                "Ok",
//                 style: TextStyle(color: AppColors.whiteColor, fontSize: context!.widthPx * 14),
//               ),
//             )
//           ],
//         ),
//       ));
//       dialog.setTitle(Center(child: Text("Successful")));
//       dialog.setLoadingWidget(Container());
//     } else {
//       final json = jsonDecode(res.body);
//       dialog!.setMessage(Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   json['payload'].toString().replaceAll("[", "").replaceAll("]", ""),
//                   style: TextStyle(color: AppColors.redColor, fontSize: getScaledSize(12, scale: 1.75)),
//                 ),
//               ),
//               // MaterialButton(
//               //   minWidth: context!.widthPx * 50,
//               //   height: context!.heightPx * 30,
//               //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//               //   color: AppColors.themeColor,
//               //   onPressed: () async {
//               //     if (context6 != null) {
//               //       await context6.read<MyProfileProvider>().reInitializeMyProfileProvider(context6);
//               //     }
//               //   },
//               //   child: Text(
//               //     Translator.translate(context6!, "Ok"),
//               //     style: TextStyle(color: AppColor.whiteColor, fontSize: context!.widthPx * 14),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ));
//       dialog.setTitle(Text("Error", style: TextStyle(fontSize: context!.textPx * 14)));
//
//       dialog.setLoadingWidget(Container());
//     }
//   }
//
//   void _logDetails() {
//     log("======================================================================================================================");
//     log("URL: " + method + " " + url);
//     log("SENT DATA: " + jsonSendData.toString());
//     log("RESPONSE DATA: " + ((response == null) ? 'null' : response!.body.toString()));
//     log("======================================================================================================================");
//   }
// }
