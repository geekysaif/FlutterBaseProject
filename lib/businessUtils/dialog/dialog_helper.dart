import 'package:flutter/material.dart';
import 'package:flutterbaseproject/businessUtils/colors/colors.dart';

import '../fontFamily/font_family.dart';
import '../fontSize/font_sizes.dart';

class DialogHelper {
  /// A global function to show a reusable dialog with dynamic button text and return value
  static Future<bool> showGlobalDialog({
    required BuildContext context,
    required String title,
    required String content,
    String cancelText = 'Cancel',
    String confirmText = 'OK',
  }) async {
    // Show the dialog and wait for the user's response
    bool result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title,style: TextStyle(color: AppColors.black,fontSize: FontSizes.font16,
            fontFamily: FontFamily.playFairDisplay,fontWeight: FontWeight.bold),),
        content: Text(content,
          style: TextStyle(color: AppColors.black,fontSize: FontSizes.font16,
              fontFamily: FontFamily.playFairDisplay,fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // Return false on cancel
            },
            child: Text(cancelText,style: TextStyle(color: AppColors.red,fontSize: FontSizes.font16,
                fontFamily: FontFamily.playFairDisplay,fontWeight: FontWeight.bold),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true); // Return true on confirm
            },
            child: Text(confirmText,style: TextStyle(color: AppColors.primaryColor,fontSize: FontSizes.font16,
                fontFamily: FontFamily.playFairDisplay,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );

    // Return the result (true for confirm, false for cancel)
    return result;
  }
}
