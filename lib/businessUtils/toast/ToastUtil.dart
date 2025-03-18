import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(String message, {ToastGravity gravity = ToastGravity.SNACKBAR}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: AppColors.darkGray,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
