import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackbar {
  static void showInfo(String message) {
    _showSnackbar('Notice', message, Colors.blue, Icons.info);
  }

  static void showError(String message) {
    _showSnackbar('Error Occured', message, Colors.red, Icons.error);
  }

  static void showSuccess(String message) {
    _showSnackbar('Success', message, Colors.green, Icons.check_circle);
  }

  static void _showSnackbar(
      String title, String message, Color color, IconData icon) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: color,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInCubic,
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}
