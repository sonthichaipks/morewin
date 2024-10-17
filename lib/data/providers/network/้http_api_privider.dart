import 'dart:io';
import 'package:morewin/app/constants/core_package.dart';

import 'package:http/http.dart' as http;

class HTTPAPIProvider {
  static const requestTimeOut = Duration(seconds: 125);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = HTTPAPIProvider();
  static HTTPAPIProvider get instance => _singleton;

  Future get(String url) async => await _request(url, 'get');

  Future post(String url, {final dynamic body}) async =>
      await _request(url, 'post', body: body);

  Future put(String url, {final dynamic body}) async =>
      await _request(url, 'put', body: body);

  Future delete(String url, {final dynamic body}) async =>
      await _request(url, 'delete', body: body);
//multipart/form-data

  Future post2(String url, {final dynamic body}) async =>
      await _request2(url, 'post', body: body);
  Future _request2(String _url, String method, {final dynamic body}) async {
    try {
      final uri = Uri.parse(_url);
      // String _baseUrl = 'localhost:44381';
      // String _path = _url.replaceAll('https://localhost:44381/','');
      // Uri uri = Uri.https(_baseUrl, _path);
      // var url = Uri.parse('https://111.222.33.44:8000/createUser');
      var response = await http.post(uri, body: body);

      //var request = http.MultipartRequest('POST', uri)..fields.addAll(body);
      // final response = await request.send();
      //final respStr = await response.stream.bytesToString();
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
  // Future _request2(String _url, String method, {final dynamic body}) async {
  //   try {
  //     final uri = Uri.parse(_url);
  //     // String _baseUrl = 'localhost:44381';
  //     // String _path = _url.replaceAll('https://localhost:44381/','');
  //     // Uri uri = Uri.https(_baseUrl, _path);
  //     // await _request(_url, 'post', body: body);
  //      // final response = await http.post(uri, body: body);
  //     var request = http.MultipartRequest('POST', uri)..fields.addAll(body);
  //     await request.send();
  //     // final respStr = await response.stream.bytesToString();

  //   //  return _returnResponse(response);
  //   } on TimeoutException catch (_) {
  //     throw TimeOutException(null);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  Future _request(String url, String method, {final dynamic body}) async {
    try {
      final response = await _client.request(
        url,
        method,
        headers: {
          // HttpHeaders.authorizationHeader: "Bearer Token",
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.accessControlAllowOriginHeader:
              "*" // .header("Access-Control-Allow-Origin", "*");
        },
        query: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: body,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    // print('response= = ${response.body}');

    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        debugPrint(
            '\x1B[31m Error case 400 : ${response.body.toString()} \x1B[0m');
        break;
      case 403:
        debugPrint(
            '\x1B[31m Error case 403 : ${response.body.toString()} \x1B[0m');
        break;
      case 404:
        debugPrint('\x1B[31m Error case 404 : Not found \x1B[0m');
        break;
      case 500:
        debugPrint('\x1B[31m Error case 500 :Internal Server Error \x1B[0m');
        break;
      default:
        debugPrint(
            '\x1B[31m Error case  ${response.statusCode} :  ${response.statusText} \x1B[0m');
        break;
    }
  }

  Future<String> wsList(String url) async {
    try {
      var request = http.Request('GET', Uri.parse('$url'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return await response.stream.bytesToString();
      } else if (response.statusCode == 204) {
        return 'OK';
      } else if (response.statusCode == 401) {
      } else {}
    } catch (e) {}
    return '';
  }

  Future<String> wsExec(String url) async {
    try {
      await http.put(Uri.parse('$url'),
          headers: {"Accept": "application/json"}).then((result) {
        return result;
      });
    } catch (e) {}
    return '';
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
