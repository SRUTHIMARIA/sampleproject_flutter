import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/parent_model/parent_response_model.dart';
import 'package:flutter_template/services/api/parent_details_service/parnet_details_service.dart';
import 'package:http/http.dart' as http;

class ParentDetailProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  Future<void> postData(ParentResponseModel? parentResponseModel) async {
    loading = true;
    notifyListeners();
    http.Response? response = (await parentDetailData(parentResponseModel!));
    if (response!.statusCode == 200) {
    //  isBack = true;
      print(response.body);

    }
    loading = false;
    notifyListeners();
  }
}