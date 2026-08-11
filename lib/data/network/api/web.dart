import 'package:base_flutter/data/models/movies/MoviesMain.dart';
abstract class WebApi {
  Future<MoviesMain> getList();

  //Login
  // Future<LoginResponse> login(String request);

}