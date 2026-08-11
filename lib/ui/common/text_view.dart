import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeFace {
  normal,
  bold,
  medium,
  semiBold
}

class TextView extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TypeFace typeFace;
  final TextAlign textAlign;

  const TextView({
    required this.text,
    this.color = Colors.black,
    this.size = 16,
    this.weight = FontWeight.w500,
    this.typeFace = TypeFace.normal,
    this.textAlign = TextAlign.start,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
        fontFamily: getFontFamily(),
        fontSize: size,
        fontWeight: weight,
        color: color,
    ));
  }

  String getFontFamily() {
    switch(typeFace) {
      case TypeFace.normal:
        return "Poppins_Reg";
      case TypeFace.medium:
        return "Poppins_Med";
      case TypeFace.bold:
        return "Poppins_Bold";
      case TypeFace.semiBold:
        return "Poppins_Semi_Bold";
    }
  }
}
