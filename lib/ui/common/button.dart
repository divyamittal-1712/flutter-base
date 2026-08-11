import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onClick;
  final Color color;
  final Color textColor;

  const Button(
      {required this.title,
      required this.onClick,
      this.color = Colors.black,
      this.textColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          )),
      onPressed: () {
        onClick();
      },
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "Poppins_Reg",
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
