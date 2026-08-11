import 'package:flutter/material.dart';

Future<DateTime?> displayDatePicker(BuildContext context) async {
  return await showDatePicker(
      builder: (context, child) {
        return Theme(
          data:
          Theme.of(context).copyWith(
            colorScheme:
            const ColorScheme.light(
              primary: Colors.red,
              // header background color
              onPrimary: Colors.black,
              // header text color
              onSurface: Colors
                  .black, // body text color
            ),
            textButtonTheme:
            TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 2),
      initialEntryMode:
      DatePickerEntryMode
          .calendarOnly);
}