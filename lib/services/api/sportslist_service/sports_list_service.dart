import 'package:flutter_template/models/common_model/api_error_response_model.dart';
import 'package:flutter_template/models/sports_list_model/sports_list_model.dart';
import 'package:flutter_template/network/api_helper.dart';
import 'package:flutter_template/services/endpoints/endpoints.dart';

class SportsListService {

  static Future<SportsListModel> getSportsList() async {
    return await ApiHelper(url: AtheleteAssist.getSportsList).get((p0) => SportsListModel.fromJson(p0));
  }


// static Future<ApiErrorResponseModel> getSportsListInfo(SportsListModel sportsListModel) async {
  //   return await ApiHelper(
  //     url: AtheleteAssist.getSportsList,).get((p0) => ApiErrorResponseModel.fromJson(p0),
  //   );
  // }
  // static Future<SuccessModel> sportsList(SportsTypeModel sportsTypeModel) async {
  //   return await ApiHelper(url: AthleteAssist.getSportsList, body: sportsTypeModel.toJson())
  //       .post((p0) => SportsTypeModel.fromJson(p0));
  // }
}
