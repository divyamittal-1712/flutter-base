
import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/data/models/app_exception.dart';
import 'package:base_flutter/data/network/api_response.dart';
import 'package:base_flutter/data/network/services/base_api_service.dart';
import 'package:base_flutter/helpers/mixin/auth_mixin.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService with AuthMixin{
  @override
  Future getResponse(String endPoint, {Map<String, String>? queryString}) async {
    dynamic responseJson;
    var token = await getAuthToken() ?? "";

    print(" Token:: $token");
    var url = Uri.https(baseUrl, "/v2/api/"+endPoint, queryString);
    try {
      final response = await http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": token
          }
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future sendRequest(String endPoint, String params) async {
    var token = await getAuthToken() ?? "";

    print("Request :: $params Token:: $token");
    dynamic responseJson;
    var url = Uri.https(baseUrl, "/v2/api/"+endPoint);
    try {
      final response = await http.post(
          url,
          body: params,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": token
          });

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print("Response: $responseJson");
        return ApiResponse.fromJson(responseJson);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
