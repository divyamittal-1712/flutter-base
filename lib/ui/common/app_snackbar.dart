import 'package:base_flutter/ui/common/text_view.dart';
import 'package:flutter/material.dart';

SnackBar getSnackBar(String message) {
  return SnackBar(content: Row(
    children: [
      const Icon(Icons.error_outline, color: Colors.black,),
      Expanded(
        child: TextView(
          text: message,
          color: Colors.black,
        ),
      ),
    ],
  ), backgroundColor: Colors.red,);
}
