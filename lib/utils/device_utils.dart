import 'package:flutter/material.dart';

class DeviceUtils {
  // reusable snackbar
  static showSnackBar(BuildContext context, String textMessage, Color bgColor) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textMessage),
        backgroundColor: bgColor,
      ),
    );
  }

  // reusable Circular progress indicator
  static Widget showCircularProgressIndicator() {
    return const Center(child: CircularProgressIndicator(),);
  }
}