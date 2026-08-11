import 'dart:convert';
import 'dart:developer';
import 'package:base_flutter/data/models/movies/MoviesMain.dart';
import 'package:base_flutter/data/network/api/web.dart';
import 'package:base_flutter/data/network/api_end_points.dart';
import 'package:base_flutter/data/network/services/base_api_service.dart';
import 'package:base_flutter/data/network/services/network_api_service.dart';
import 'package:flutter/material.dart';

class WebApiImpl implements WebApi {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<MoviesMain> getList() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints.getMovies);
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<LoginResponse> login(String request) async {
  //   try {
  //     dynamic response =
  //         await _apiService.sendRequest(ApiEndPoints.login, request);
  //     final jsonData = LoginResponse.fromJson((response as ApiResponse).data);
  //     return jsonData;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

}
