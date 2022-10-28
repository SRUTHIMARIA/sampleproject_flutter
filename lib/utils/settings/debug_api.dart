// import '../../widgets/alert_dialog/future_handling_alert.dart';
// import '../static/enums.dart';

Future<void> debugApi(
    {required String? error, required String url, required String method, required String sentData}) async {
  return;
  // String body = _getBody(response: error, method: method, sentData: sentData, url: url);

  // await handleFutureWithAlert(getErrorMessage: () => body, function: () async => ApiStatus.error);
}

// String _getBody({required String? response, required String url, required String method, required String sentData}) {
//   if (response != null && response.contains('SocketException:')) {
//     response = 'No internet connection';
//   }
//   return 'URL: $method $url \n\nSENT DATA: $sentData \n\nRESPONSE DATA ${response ?? 'null'}';
// }
