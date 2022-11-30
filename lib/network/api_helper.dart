


import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/providers/authentication_provider.dart';
import 'package:flutter_template/utils/static/static_string_keys.dart';
import 'package:http/http.dart' as http;


class ApiHelper {
  String url;
  Object? body;
  String? commonErrorMsg;
  String? timeoutErrorMsg;
  String? socketErrorMsg;
  String? formatErrorMsg;
  String? internalServerErrorMsg;
  String? routingMsg;
  bool routeIf401;
  late http.Response _response;
  int timeOut;

  ApiHelper({
    required this.url,
    this.body,
    this.timeOut = 15,
    this.commonErrorMsg,
    this.formatErrorMsg,
    this.socketErrorMsg,
    this.routingMsg,
    this.routeIf401 = true,
    this.timeoutErrorMsg,
  }) {
    //default error messages for the api errors. If need to change to a custom error message, they can be changed from service
    commonErrorMsg ??= 'Something went wrong.';
    formatErrorMsg ??= 'Something went wrong.';
    internalServerErrorMsg ??= 'Internal server error.';
    routingMsg ??= 'Please log in to continue.';
    socketErrorMsg ??= 'Your are offline';
    timeoutErrorMsg ??= 'Your connection has timed out.';
  }

  Map<String, String> _getHeaders() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (AuthenticationProvider.isLoggedIn) 'Authorization': 'Bearer ${AuthenticationProvider.token}',
    };
  }
  //
  // Map<String, String> _getStripeHeaders() {
  //   return {
  //     if (AuthenticationProvider.isLoggedIn) 'Authorization': 'Bearer ${StaticKeys.secretKey}',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //
  //   };
  // }


  Future<dynamic> get(Function(Map<String, dynamic>) jsonToObjectFn) async {
    log('...................${jsonEncode(body)}');

    return await _callApi(http.get(Uri.parse(url), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> post(Function(Map<String, dynamic>) jsonToObjectFn) async {
    log('...................${jsonEncode(body)}');

    return await _callApi(http.post(Uri.parse(url), body: jsonEncode(body), headers: _getHeaders()), jsonToObjectFn);
  }

  // Future<dynamic> postMethod(Function(Map<String, dynamic>) jsonToObjectFn) async {
  //   log('...................${jsonEncode(body)}');
  //
  //   return await _callApi(http.post(Uri.parse(url), body: jsonEncode(body), headers: _getStripeHeaders()), jsonToObjectFn);
  // }
  //
  // Future<dynamic> getMethod(Function(Map<String, dynamic>) jsonToObjectFn) async {
  //   log('...................${jsonEncode(body)}');
  //
  //   return await _callApi(http.post(Uri.parse(url), headers: _getStripeHeaders()), jsonToObjectFn);
  // }

  Future<dynamic> patch(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.patch(Uri.parse(url), body: jsonEncode(body), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> delete(Function(Map<String, dynamic>) jsonToObjectFn) async {
    return await _callApi(http.delete(Uri.parse(url), headers: _getHeaders()), jsonToObjectFn);
  }

  Future<dynamic> _callApi(Future httpFuture, Function(Map<String, dynamic>) jsonToObjectFn) async {
    try {
      debugPrint(url);

      _response = await httpFuture.timeout(Duration(seconds: timeOut));
      debugPrint(_response.body);

      if (_response.statusCode != 200 && _response.statusCode != 201) {
        debugPrint('StatusCode was not 200||201');
        debugPrint(_response.body);
      }
      if (_response.statusCode == 500) {
        return jsonToObjectFn({'status': false, 'message': internalServerErrorMsg});
      }

      ///return actual response if it was an OK
      Map<String,dynamic> json = jsonDecode(_response.body);
      json['statusCode'] =  json['statusCode']??_response.statusCode;

      return jsonToObjectFn(json);
    } on TimeoutException catch (_) {
      debugPrint('Timeout Exception');

      return jsonToObjectFn({'status': false, 'message': timeoutErrorMsg});
    } on FormatException catch (_) {
      debugPrint('Format Exception');
      debugPrint(_response.body);

      return jsonToObjectFn({'status': false, 'message': formatErrorMsg});
    } on SocketException catch (_) {
      debugPrint('Socket Exception');

      return jsonToObjectFn({'status': false, 'message': socketErrorMsg});
    } catch (e, stack) {
      debugPrint('Unknown Exception');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      return jsonToObjectFn({'status': false, 'message': commonErrorMsg});
    }
  }
}


// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_template/providers/login/login_provider.dart';
//
// class ApiHelper {
//   String url;
//   Object? body;
//   bool showErrorMessageFromPayload;
//   String? commonErrorMsg;
//   String? timeoutErrorMsg;
//   String? formatErrorMsg;
//   String? internalServerErrorMsg;
//   String? routingMsg;
//   bool routeIf401;
//   late Response _response;
//   int timeOut;
//   String _method = '';
//   bool logApi;
//
//   ApiHelper({
//     required this.url,
//     this.body,
//     this.timeOut = 15,
//     this.commonErrorMsg,
//     this.formatErrorMsg,
//     this.routingMsg,
//     this.routeIf401 = true,
//     this.logApi = true,
//     this.timeoutErrorMsg,
//     this.showErrorMessageFromPayload = false,
//   }) {
//     ///default error messages for the api errors. If need to change to a custom error message, they can be changed from service
//     commonErrorMsg ??= 'Something went wrong.';
//     formatErrorMsg ??= 'Something went wrong.';
//     internalServerErrorMsg ??= 'Internal server error.';
//     routingMsg ??= 'Please log in to continue.';
//     timeoutErrorMsg ??= 'Your connection has timed out.';
//   }
//
//   Map<String, String> _getHeaders() {
//     return {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     //   if (AuthenticationProvider.isLoggedIn) 'Authorization': 'Bearer ${AuthenticationProvider().}',
//     // };
//
//       if (LoginProvider().isLoggedIn) 'Authorization': 'Bearer ${LoginProvider().token}',
//     };
//   }
//
//   Future<dynamic> get(Function(Map<String, dynamic>) jsonToObjectFn) async {
//     _method = 'GET';
//
//     return _callApi(Dio(BaseOptions(headers: _getHeaders())).get(url), jsonToObjectFn);
//   }
//
//   Future<dynamic> post(Function(Map<String, dynamic>) jsonToObjectFn) async {
//     _method = 'POST';
//
//     return await _callApi(Dio(BaseOptions(headers: _getHeaders())).post(url, data: jsonEncode(body)), jsonToObjectFn);
//   }
//
//   Future<dynamic> _callApi(Future httpFuture, Function(Map<String, dynamic>) jsonToObjectFn) async {
//     try {
//       _response = await httpFuture.timeout(Duration(seconds: timeOut));
//       _logDetails();
//       if (_response.statusCode != 200 && _response.statusCode != 201) {
//         debugPrint('StatusCode was not 200||201, status code:${_response.statusCode}');
//       }
//       if (_response.statusCode == 401 && routeIf401) {
//         ///Navigation to login if user is not authenticated.
//         // if (StaticKeys.navigatorKey.currentState != null) {
//         // debugPrint('App navigated to login because of 401');
//         // Sta.navigatorKey.currentState!.context.pushNamedAndRemoveUntil(ScreenNames.login);
//         // AppSnackBar.showSnackBarWithText(
//         //     context: CommonFunctionsProvider.navigatorKey.currentState!.context, text: routingMsg!);
//         // }
//
//         return jsonToObjectFn(jsonDecode(_response.data));
//       }
//       if (_response.statusCode == 500) {
//         return jsonToObjectFn({'success': false, 'statusMessage': internalServerErrorMsg});
//       }
//
//       ///return actual response if it was an OK
//       if (_response.statusCode == 200 || _response.statusCode == 201) return jsonToObjectFn(jsonDecode(_response.data));
//
//       ///return error payload if response was not ok (with common error msg attached)
//       final object = jsonDecode(_response.data);
//       if (!showErrorMessageFromPayload) object['statusMessage'] = commonErrorMsg;
//
//       return jsonToObjectFn(object);
//     } on TimeoutException catch (_) {
//       debugPrint('Timeout Exception');
//
//       return jsonToObjectFn({'success': false, 'statusMessage': timeoutErrorMsg});
//     } on FormatException catch (_) {
//       debugPrint('Format Exception');
//
//       return jsonToObjectFn({'success': false, 'statusMessage': formatErrorMsg});
//     }  catch (e, stack) {
//       debugPrint('Unknown Exception');
//       debugPrint(e.toString());
//       debugPrint(stack.toString());
//
//       return jsonToObjectFn({'success': false, 'statusMessage': commonErrorMsg});
//     }
//   }
//
//   void _logDetails() {
//     if (!logApi) return;
//     log('===============================================================================================');
//     log('URL: $_method $url');
//     log('SENT DATA: $body');
//     log('RESPONSE DATA: ${_response.data}');
//     log('===============================================================================================');
//   }
// }
