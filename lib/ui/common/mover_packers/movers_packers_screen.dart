import 'package:base_flutter/base/base_state.dart';
import 'package:base_flutter/helpers/page_identifier.dart';
import 'package:base_flutter/ui/common/app_bar_widget.dart';
import 'package:base_flutter/ui/common/mover_packers/navigator/movers_packers_navigator.dart';
import 'package:base_flutter/ui/common/mover_packers/vm/movers_packers_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoversPackersScreen extends StatefulWidget {
  const MoversPackersScreen({Key? key}) : super(key: key);

  @override
  State<MoversPackersScreen> createState() => _MoversPackersScreenState();
}

class _MoversPackersScreenState
    extends BaseState<MoversPackersScreen, MoversPackersViewModel>
    implements MoversPackersNavigator {
  @override
  AppBarWidget buildAppBar() {
    return AppBarWidget(
      scaffoldKey,
      title: "moversPackers",
    );
  }

  @override
  Widget buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }

  @override
  getNavigator() => this;

  @override
  PageIdentifier getPageIdentifier() => PageIdentifier.moversPackers;

  @override
  void loadPageData({value}) {}

  @override
  Future<bool> provideOnWillPopScopeCallBack() => Future.value(true);

  List<Widget> getBulletItems(){
    var list = <Widget>[];

    return list;
  }
}
