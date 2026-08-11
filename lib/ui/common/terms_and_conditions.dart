import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
            text: "By registering to FastBeetle, you accept the",
            style: const TextStyle(
              fontFamily: "Poppins_Reg",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
          TextSpan(
              text: " terms & conditions",
              recognizer: TapGestureRecognizer()
                ..onTap = () {

                },
              style: const TextStyle(
                fontFamily: "Poppins_Bold",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
              const TextSpan(
                  text: " and",
                  style: TextStyle(
                    fontFamily: "Poppins_Reg",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              TextSpan(
                  text: " privacy policy",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                    },
                  style: const TextStyle(
                    fontFamily: "Poppins_Bold",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ))
        ]));
  }
}
