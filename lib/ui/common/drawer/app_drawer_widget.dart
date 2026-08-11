import 'package:base_flutter/ui/common/text_view.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';

const menuItems = {
  "Home": "assets/images/ic_home.png",
  "Package": "assets/images/ic_package.png",
  "Saved address": "assets/images/ic_address.png",
  "Help & support": "assets/images/ic_help.png",
  "Logout": "assets/images/ic_logout.png",
};

class AppDrawerWidget extends StatefulWidget {
  final Function(int position) onDrawerItemClick;
  const AppDrawerWidget(this.onDrawerItemClick, {Key? key}) : super(key: key);

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          margin: const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DrawerHead(),
                const SizedBox(height: 20),
                getMenuList(widget.onDrawerItemClick),
                const Spacer(),
                InkWell(
                    onTap: () {
                      widget.onDrawerItemClick(5);
                    },
                    child: const Image(
                      image: AssetImage("assets/images/img_hire_us.png"),
                    ))
              ]),
        ),
      )),
    );
  }

  Widget getMenuList(Function(int position) onDrawerItemClick) {
    return Column(children: getMenuItems(onDrawerItemClick));
  }

  List<Widget> getMenuItems(Function(int position) onDrawerItemClick) {
    var list = <Widget>[];
    int i = 0;
    menuItems.forEach((key, value) {
      list.add(getItem(key, value, i, onDrawerItemClick));
      i++;
    });

    return list;
  }
  Widget getItem(String name, String image, int position, Function(int position) onDrawerItemClick) {
    return Container (
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          onDrawerItemClick(position);
        },
        child: Row(
          children: [
            Image(image: AssetImage(image)),
            const SizedBox(
              width: 10,
            ),
            TextView(text: name),
          ],
        ),
      ),
    );
  }
}
