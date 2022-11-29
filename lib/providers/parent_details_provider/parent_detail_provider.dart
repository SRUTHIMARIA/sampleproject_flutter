import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/parent_model/parent_type_model.dart';
import 'package:flutter_template/services/api/parent_details_service/parent_type_service.dart';
import 'package:flutter_template/utils/static/enums.dart';
import 'package:http/http.dart' as http;

class ParentDetailProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  ApiErrorResponseModel? apiErrorResponseModel;
  bool apiErrors = false;
  ApiStatus parentTypeStatus = ApiStatus.none;




  Future<ApiStatus> parentType(ParentTypeModel parentTypeModel) async {
    parentTypeStatus = ApiStatus.loading;
    notifyListeners();
    apiErrorResponseModel = await ParentDetailService.parentType(parentTypeModel);
    if (apiErrorResponseModel!.status) {
      parentTypeStatus = ApiStatus.success;
    } else {
      parentTypeStatus = ApiStatus.error;
      apiErrors = apiErrorResponseModel!.status;
    }
    notifyListeners();

    return parentTypeStatus;
  }


}