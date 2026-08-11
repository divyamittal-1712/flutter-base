
import 'package:base_flutter/data/network/api/web_impl.dart';
import 'package:base_flutter/helpers/service_locator.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel<N> extends ChangeNotifier {
  final webApi = serviceLocator<WebApiImpl>();

  bool _showLoading = false;

  bool get showLoading => _showLoading;

  late N _navigator;

  N getNavigator() => _navigator;

  void setNavigator(N navigator) {
    _navigator = navigator;
  }

  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }






}