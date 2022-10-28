import 'package:flutter/material.dart';

class DatePicker {

  static Future<DateTime?> onPick(BuildContext context, int firstDate, int lastDate) async {
    DateTime? date;
    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(firstDate),
        lastDate: DateTime(lastDate)
    );
    return date;
  }

}