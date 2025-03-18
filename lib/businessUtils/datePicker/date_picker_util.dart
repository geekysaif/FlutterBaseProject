import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:intl/intl.dart';

class DatePickerUtil {
  /// Opens the date picker and returns the selected date as a formatted string.
  static Future<String?> selectDate(
      BuildContext context, {
        String format = 'dd-MM-yyyy',
        bool disableFutureDates = false, // Option to disable future dates
        bool disablePastDates = false,   // Option to disable past dates
        String title = 'Select BirthDay',  // Custom title
        Color primaryColor = AppColors.primaryColor, // Custom color
      }) async {
    DateTime now = DateTime.now();

    DateTime firstDate = disablePastDates ? now : DateTime(1900);
    DateTime lastDate = disableFutureDates ? now : DateTime(2050);

    ThemeData datePickerTheme = ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(primary: primaryColor),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    );

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: title, // Custom title
      builder: (context, child) {
        return Theme(data: datePickerTheme, child: child!);
      },
    );

    if (pickedDate != null) {
      return DateFormat(format).format(pickedDate); // Return formatted date
    }
    return null; // If no date is selected
  }
}
