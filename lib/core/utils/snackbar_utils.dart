import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._(); // private constructor

  static void showCustomSnackBar(
    BuildContext context,
    bool isSuccess,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        closeIconColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4, // controls height
        ),
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
