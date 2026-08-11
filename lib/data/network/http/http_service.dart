import 'package:base_flutter/constants/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Http {

  var token = "";

  Future<Response> post(String endpoint, String params) async {
    var url = Endpoints.BASE_URL+endpoint;
    debugPrint(url);
    debugPrint(params);
    return await http.post(
        Uri.parse(Endpoints.BASE_URL+url),
        body: params,
        headers: {
          "Accept": "application/json",
          "Authorization": "$token"
        });
  }

  Future<Response> get(String url, String params) async {
    return await http.get(
        Uri.parse(Endpoints.BASE_URL+url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
  }
}