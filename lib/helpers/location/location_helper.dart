// import 'package:location/location.dart';
//
// class LocationHelper {
//
//   bool _locationServiceEnabled = false;
//   PermissionStatus? _permissionStatus;
//   LocationData? locationData;
//   Location? _location;
//
//   Future<LocationData?> getCurrentLocation() async {
//     _location ??= Location();
//
//     //Check repeatedly if the Location is enabled. If not, request user to
//     // enable the Location.
//     _locationServiceEnabled = await _location!.serviceEnabled();
//     if (!_locationServiceEnabled) {
//       _locationServiceEnabled = await _location!.requestService();
//       if (!_locationServiceEnabled) {
//         getCurrentLocation();
//       }
//     }
//
//     //Check repeatedly if the Location permission is given. If not, request
//     // user to enable it
//     _permissionStatus = await _location!.hasPermission();
//     if (_permissionStatus == PermissionStatus.denied) {
//       _permissionStatus = await _location!.requestPermission();
//       if (_permissionStatus != PermissionStatus.granted) {
//         getCurrentLocation();
//       }
//     }
//
//     locationData = await _location!.getLocation();
//     return locationData;
//
//   }
//
//
// }