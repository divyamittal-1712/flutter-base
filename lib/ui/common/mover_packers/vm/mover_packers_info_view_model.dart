import 'dart:convert';
import 'dart:developer';

import 'package:base_flutter/base/base_view_model.dart';
import 'package:base_flutter/data/network/api/web_impl.dart';
import 'package:base_flutter/data/network/api_response.dart';
import 'package:base_flutter/helpers/service_locator.dart';
import 'package:base_flutter/ui/common/mover_packers/navigator/mover_packers_info_navigator.dart';


class MoverPackersInfoViewModel
    extends BaseViewModel<MoverPackersInfoNavigator> {
  // ApiResponse<MoversResponse> moversResponse = ApiResponse.stopped();

  var name = "";
  var phone = "";
  var address = "";
  var email = "";

  // void sendMoverRequest() {
  //   _setMoversResponse(ApiResponse.loading());
  //
  //   webApi
  //       .sendMoverRequest(jsonEncode({
  //         "fullName": name,
  //         "phoneNo": phone,
  //         "address": address,
  //         "email": email
  //       }))
  //       .then((value) => onRequestSuccess(value))
  //       .onError((error, stackTrace) => onRequestError(error.toString()));
  // }

  // _setMoversResponse(ApiResponse<MoversResponse> moverResponse) {
  //   // moversResponse = moverResponse;
  //   notifyListeners();
  // }
  //
  // onRequestSuccess(MoversResponse response) {
  //   _setMoversResponse(ApiResponse.completed(response));
  //   getNavigator().onRequestSuccess();
  // }
  //
  // onRequestError(String message) {
  //   _setMoversResponse(ApiResponse.error(message));
  //   getNavigator().onError(message);
  // }
}
