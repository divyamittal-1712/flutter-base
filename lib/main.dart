import 'package:base_flutter/helpers/app_state.dart';
import 'package:base_flutter/helpers/service_locator.dart';
import 'package:base_flutter/ui/screen/audio_paylist.dart';
import 'package:flutter/material.dart';

void main() {
  setupServices();
  runApp(const BaseApp());
}

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  final _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _appState.checkForLoginCredentials(),
          builder: (BuildContext context, AsyncSnapshot<List<bool>> snapshot) {
            return (snapshot.connectionState == ConnectionState.done)
                ? _getLauncherScreen(snapshot.data)
                : Container();
          },
        ));
  }

  //Returns the Starting Screen of Application based on the application journey
  //of the User.
  Widget _getLauncherScreen(List<bool>? data) {
    if(data == null) return Container();

    if(data[0]) {
      return AudioPayList();
    } else {
      return Container(
        color: Colors.white,
      );
    }
  }
}
