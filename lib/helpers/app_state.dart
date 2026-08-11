import 'package:base_flutter/helpers/mixin/auth_mixin.dart';

class AppState with AuthMixin {

  //Checks the Login/OnBoarded status of the User
  Future<List<bool>> checkForLoginCredentials() async {
    String? authToken = await getAuthToken();

    var isLoggedIn = true/*authToken != null && authToken.isNotEmpty*/;

    return [
      isLoggedIn
    ];
  }
}