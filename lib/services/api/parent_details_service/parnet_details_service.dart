import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/api/endpoints/endpoints.dart';

//
// class ParentDetailService {
//   static Future<ParentResponseModel> parentProfileDetails() async {
//     return await ApiHelper(url: AtheleteAssist.parentProfileDetails).get((p0) {
//       return ParentResponseModel.fromJson(p0);
//     });
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

String? token;

Future<http.Response?> parentDetailData(ParentResponseModel parentResponseModel) async {
  http.Response? response;
  try {
    response = await http.post(Uri.parse("https://athlete.devateam.com/api/parent_profiles"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": 'Bearer ' + token!,
          "Accept": "application/json",
        },
        body: jsonEncode(parentResponseModel.toJson())

    );
  } catch (e) {
    log(e.toString());
  }
  return response;
}
