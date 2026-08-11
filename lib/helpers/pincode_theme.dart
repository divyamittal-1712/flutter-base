import 'package:base_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

PinTheme getPinTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(10),
    fieldHeight: 50,
    fieldWidth: 50,
    borderWidth: 2,
    activeFillColor: Colors.white,
    inactiveFillColor: textFieldBgColor,
    selectedFillColor: textFieldBgColor,
    activeColor: pinBorderColor,
    inactiveColor: pinBorderColor,
    selectedColor: Colors.black,
  );
}