import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'dart:convert';
import 'dart:developer';
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
        body: jsonEncode(parentResponseModel.toJson(),),

    );
  } catch (e) {
    log(e.toString());
  }

  return response;
}
