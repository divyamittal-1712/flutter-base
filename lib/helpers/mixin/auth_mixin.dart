import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

mixin AuthMixin {

  static const String USER = "user";
  static const String TOKEN = "access_token";

  // Future<void> saveProfile(VerifyCodeResponse response) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString(USER, jsonEncode(response));
  // }
  //
  // Future<VerifyCodeResponse?> getProfile(VerifyCodeResponse response) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var json = prefs.getString(USER);
  //   if(json == null) {
  //     return null;
  //   }
  //   return VerifyCodeResponse.fromJson(jsonDecode(json));
  // }

  Future<void> saveAuthToken(String authToken) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN, authToken);
  }

  Future<void> clearToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN, "");
  }

  Future<String?> getAuthToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN);
  }
}