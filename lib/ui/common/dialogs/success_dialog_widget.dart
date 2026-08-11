import 'package:base_flutter/ui/common/button.dart';
import 'package:base_flutter/ui/common/text_view.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight / 14,
              ),
              const TextView(
                text: "Success",
                size: 18,
                typeFace: TypeFace.medium,
              ),
              const SizedBox(
                height: 40,
              ),
              const Image(
                  image: AssetImage("assets/images/ic_success.png")),
              const SizedBox(
                height: 30,
              ),
              const TextView(
                text: "Success Message",
                size: 14,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Button(title: "OK", onClick: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Container()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
