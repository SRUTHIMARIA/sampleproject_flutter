import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/providers/authentication_provider.dart';

class ApiHelper {
  String url;
  Object? body;
  bool showErrorMessageFromPayload;
  String? commonErrorMsg;
  String? timeoutErrorMsg;
  String? socketErrorMsg;
  String? formatErrorMsg;
  String? internalServerErrorMsg;
  String? routingMsg;
  bool routeIf401;
  late Response _response;
  int timeOut;
  String _method = '';
  bool logApi;

  ApiHelper({
    required this.url,
    this.body,
    this.timeOut = 15,
    this.commonErrorMsg,
    this.formatErrorMsg,
    this.socketErrorMsg,
    this.routingMsg,
    this.routeIf401 = true,
    this.logApi = true,
    this.timeoutErrorMsg,
    this.showErrorMessageFromPayload = false,
  }) {
    ///default error messages for the api errors. If need to change to a custom error message, they can be changed from service
    commonErrorMsg ??= 'Something went wrong.';
    formatErrorMsg ??= 'Something went wrong.';
    internalServerErrorMsg ??= 'Internal server error.';
    routingMsg ??= 'Please log in to continue.';
    socketErrorMsg ??= 'Failed to connect to internet. Please check your internet connection.';
    timeoutErrorMsg ??= 'Your connection has timed out.';
  }

  Map<String, String> _getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (AuthenticationProvider.isLoggedIn) 'Authorization': 'Bearer ${AuthenticationProvider.token}',
    };
  }

  Future<dynamic> get(Function(Map<String, dynamic>) jsonToObjectFn) async {
    _method = 'GET';

    return _callApi(Dio(BaseOptions(headers: _getHeaders())).get(url), jsonToObjectFn);
  }

  Future<dynamic> post(Function(Map<String, dynamic>) jsonToObjectFn) async {
    _method = 'POST';

    return await _callApi(Dio(BaseOptions(headers: _getHeaders())).post(url, data: jsonEncode(body)), jsonToObjectFn);
  }

  Future<dynamic> patch(Function(Map<String, dynamic>) jsonToObjectFn) async {
    _method = 'PATCH';

    return await _callApi(
      Dio((BaseOptions(headers: _getHeaders()))).patch(url, data: jsonEncode(body)),
      jsonToObjectFn,
    );
  }

  Future<dynamic> delete(Function(Map<String, dynamic>) jsonToObjectFn) async {
    _method = 'DELETE';

    return await _callApi(Dio((BaseOptions(headers: _getHeaders()))).delete(url), jsonToObjectFn);
  }

  Future<dynamic> _callApi(Future httpFuture, Function(Map<String, dynamic>) jsonToObjectFn) async {
    try {
      _response = await httpFuture.timeout(Duration(seconds: timeOut));
      _logDetails();
      if (_response.statusCode != 200 && _response.statusCode != 201) {
        debugPrint('StatusCode was not 200||201, status code:${_response.statusCode}');
      }
      if (_response.statusCode == 401 && routeIf401) {
        ///Navigation to login if user is not authenticated.

        // if (StaticKeys.navigatorKey.currentState != null) {
        // debugPrint('App navigated to login because of 401');
        // Sta.navigatorKey.currentState!.context.pushNamedAndRemoveUntil(ScreenNames.login);
        // AppSnackBar.showSnackBarWithText(
        //     context: CommonFunctionsProvider.navigatorKey.currentState!.context, text: routingMsg!);
        // }

        return jsonToObjectFn(jsonDecode(_response.data));
      }
      if (_response.statusCode == 500) {
        return jsonToObjectFn({'success': false, 'statusMessage': internalServerErrorMsg});
      }

      ///return actual response if it was an OK
      if (_response.statusCode == 200 || _response.statusCode == 201) return jsonToObjectFn(jsonDecode(_response.data));

      ///return error payload if response was not ok (with common error msg attached)
      final object = jsonDecode(_response.data);
      if (!showErrorMessageFromPayload) object['statusMessage'] = commonErrorMsg;

      return jsonToObjectFn(object);
    } on TimeoutException catch (_) {
      debugPrint('Timeout Exception');

      return jsonToObjectFn({'success': false, 'statusMessage': timeoutErrorMsg});
    } on FormatException catch (_) {
      debugPrint('Format Exception');

      return jsonToObjectFn({'success': false, 'statusMessage': formatErrorMsg});
    } on SocketException catch (_) {
      debugPrint('Socket Exception');

      return jsonToObjectFn({'success': false, 'statusMessage': socketErrorMsg});
    } catch (e, stack) {
      debugPrint('Unknown Exception');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      return jsonToObjectFn({'success': false, 'statusMessage': commonErrorMsg});
    }
  }

  // Future<String?> downloadFile({required String savePath, required String fileName}) async {
  //   try {
  //     Dio dio = Dio();
  //     log("Downloading File: $url");
  //     debugPrint("Downloading File: $url");
  //
  //     Response response = await dio.get(
  //       url,
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }),
  //     );
  //     File file = File(savePath.endsWith("/") ? (savePath + fileName) : ("$savePath/$fileName"));
  //     var raf = file.openSync(mode: FileMode.write);
  //     raf.writeFromSync(response.data);
  //     await raf.close();
  //     debugPrint("File downloaded : ${file.path}");
  //     log("File downloaded : ${file.path}");
  //     return file.path;
  //   } catch (e) {
  //     debugPrint("DownloadError: $e");
  //     return null;
  //   }
  // }

  void _logDetails() {
    if (!logApi) return;
    log('===============================================================================================');
    log('URL: $_method $url');
    log('SENT DATA: $body');
    log('RESPONSE DATA: ${_response.data}');
    log('===============================================================================================');
  }
}
