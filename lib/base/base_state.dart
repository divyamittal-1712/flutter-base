import 'dart:collection';
import 'dart:developer';

import 'package:base_flutter/base/base_navigator.dart';
import 'package:base_flutter/base/base_view_model.dart';
import 'package:base_flutter/constants/colors.dart';
import 'package:base_flutter/helpers/location/location_helper.dart';
import 'package:base_flutter/helpers/mixin/auth_mixin.dart';
import 'package:base_flutter/helpers/page_identifier.dart';
import 'package:base_flutter/helpers/service_locator.dart';
import 'package:base_flutter/ui/common/app_bar_widget.dart';
import 'package:base_flutter/ui/common/drawer/app_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with AuthMixin implements BaseNavigator {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  VM viewModel = serviceLocator<VM>();

  String? currentLocation;
  String? addressLine1;
  String? pincode;
  double? latitude;
  double? longitude;

  Widget buildBody();

  dynamic getNavigator();

  AppBarWidget? buildAppBar();

  PageIdentifier getPageIdentifier();

  @override
  void initState() {
    loadPageData();
    if (getNavigator() != null) {
      viewModel.setNavigator(getNavigator());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: provideOnWillPopScopeCallBack,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: appBgColor,

          //Sets custom AppBar Widget on Dashboard only
          drawer: getPageIdentifier() == PageIdentifier.dashboard
              ? AppDrawerWidget(onDrawerItemClick)
              : null,

          //Sets AppBar based on the result from setAppBar()
          appBar: setAppBar() ? buildAppBar() : null,
          body: SafeArea(
            child: ChangeNotifierProvider(
              create: (_) => viewModel,
              child: buildBody(),
            ),
          ),
        ),
      );

  void loadPageData({dynamic value});

  //Checks on which screen should the AppBar be displayed
  bool setAppBar() {
    var page = getPageIdentifier();
    switch (page) {
      case PageIdentifier.login:
        return false;
      default:
        return true;
    }
  }

  void push({required Widget widget}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => widget))
        .then((value) => loadPageData());
  }

  //Clears the Backstack and starts a new screen
  void pushReplace({required Widget widget}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => widget));
  }

  void pop({dynamic result}) {
    Navigator.of(context).pop();
  }

  Future<bool> provideOnWillPopScopeCallBack();

  void onDrawerItemClick(int position) {
    log(position.toString());
    switch (position) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
    }
  }

  @override
  void onError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Future<Map<String?, String?>?> fetchLocation()  async {
  //   var location = await LocationHelper().getCurrentLocation();
  //   if(location?.latitude == null) return null;
  //   var placeMark = await placemarkFromCoordinates(location!.latitude!, location.longitude!);
  //   for(Placemark place in placeMark) {
  //     if(place.subLocality != null){
  //       currentLocation = place.subLocality;
  //       pincode = place.postalCode;
  //       addressLine1 = place.street ?? place.subLocality ?? place.locality;
  //       latitude = location.latitude;
  //       longitude = location.longitude;
  //
  //       return {currentLocation: addressLine1};
  //     }
  //   }
  //   latitude = location.latitude;
  //   longitude = location.longitude;
  //   currentLocation = "";
  //   return null;
  // }

  void showAppBottomSheet(BuildContext context, Widget bottomSheet) {
    Scaffold.of(context).showBottomSheet((context) {
      return bottomSheet;
    },
        elevation: 30,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20))));
  }
}
