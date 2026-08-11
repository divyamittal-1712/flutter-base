
import 'package:base_flutter/ui/common/text_view.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final isDashboard;
  final String title;
  final Widget? location;

  const AppBarWidget(this.scaffoldKey,
      {this.title = "", this.isDashboard = false, this.location, Key? key})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                widget.isDashboard
                    ? widget.scaffoldKey.currentState!.openDrawer()
                    : Navigator.pop(context);
              },
              icon: Icon(
                widget.isDashboard ? Icons.menu : Icons.arrow_back_rounded,
                color: Colors.black,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Align(
                alignment: Alignment.center,
                child: widget.location ?? TextView(
                        text: widget.title,
                        weight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      )
            ),
          )),
          widget.isDashboard
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined))
              : Container()
        ],
      ),
    );
  }
}
