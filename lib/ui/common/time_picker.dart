import 'package:flutter/material.dart';

Future<TimeOfDay?> displayTimePicker(BuildContext context) async {
  return await showTimePicker(
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
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly
  );
}