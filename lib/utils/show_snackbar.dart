import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String message, Color color) {
  Get.snackbar("", "",
      colorText: Colors.white,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
      ),
      backgroundColor: Colors.black,
      leftBarIndicatorColor: color,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(4),
      animationDuration: Duration(milliseconds: 500),
      borderRadius: 0);
}

void showSnackBarWithAction(String title, String message, Color color) {
  Get.snackbar("", "",
      colorText: Colors.white,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
      ),
      backgroundColor: Colors.black,
      leftBarIndicatorColor: color,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(4),
      animationDuration: Duration(milliseconds: 500),
      borderRadius: 0);
}
