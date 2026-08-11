import 'package:base_flutter/ui/common/text_view.dart';
import 'package:flutter/material.dart';

class DrawerHead extends StatefulWidget {
  const DrawerHead({Key? key}) : super(key: key);

  @override
  State<DrawerHead> createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          child: Image(image: AssetImage("assets/images/ic_avatar.png")),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextView(
              text: "Muheeb",
              typeFace: TypeFace.bold,
              size: 16,
            ),
            TextView(
              text: "12321444",
              typeFace: TypeFace.normal,
              size: 15,
            ),
          ],
        ),
        const Spacer(),
        const Image(image: AssetImage("assets/images/ic_setting.png"))
      ],
    );
  }
}
