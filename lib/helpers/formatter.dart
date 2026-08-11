import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime? dateSelected) {
  if(dateSelected == null) return "";
  var date = "";
  date = DateFormat("MM/dd/yyyy").format(dateSelected);

  return date;
}

String formatTime(BuildContext context, TimeOfDay? timeSelected) {
  if(timeSelected == null) return "";
  var time = "";
  var localization = MaterialLocalizations.of(context);
  time = localization.formatTimeOfDay(timeSelected);

  return time;
}

String formatOrderDateTime(String? date, String? time) {
  var inputDate = DateFormat("MM/dd/yyyy hh:mm a").parse("$date $time");
  return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(inputDate);
}