import 'package:flutter/material.dart';
import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/sports_list_model/sports_list_model.dart';
import 'package:flutter_template/services/api/sportslist_service/sports_list_service.dart';
import 'package:flutter_template/utils/static/enums.dart';

class SportsListProvider extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  ApiErrorResponseModel? apiErrorResponseModel;
  bool apiErrors = false;
  ApiStatus sportsListStatus = ApiStatus.none;
  SportsListModel? sportsListModel;
  List<Datum> data =[];


  // Future<ApiStatus> getSportsListData() async {
  //   sportsListStatus = ApiStatus.loading;
  //   notifyListeners();
  //   sportsListModel = await SportsListService.getSportsList();
  //   if (sportsListModel!.status) {
  //     debugPrint('status......${sportsListModel!.status.toString()}');
  //
  //     sportsListStatus = ApiStatus.success;
  //   } else {
  //     sportsListStatus = ApiStatus.error;
  //     apiErrors = sportsListModel!.status;
  //     data =sportsListModel!.data;
  //
  //   }
  //   notifyListeners();
  //
  //   return sportsListStatus;
  // }




//
  // Future<ApiStatus> sportsList() async {
  //   sportsListStatus = ApiStatus.loading;
  //   notifyListeners();
  //   sportsListModel = await SportsListService.getSportsListInfo();
  //   if (apiErrorResponseModel!.status) {
  //     sportsListStatus = ApiStatus.success;
  //   } else {
  //     sportsListStatus = ApiStatus.error;
  //     apiErrors = apiErrorResponseModel!.status;
  //   }
  //   notifyListeners();
  //
  //   return sportsListStatus;
  // }


}