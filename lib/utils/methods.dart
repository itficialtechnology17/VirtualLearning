import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String message, Color color) {
  Get.snackbar("", "",
      colorText: Colors.white,
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
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
        style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
      ),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
      ),
      backgroundColor: Colors.black,
      leftBarIndicatorColor: color,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(4),
      animationDuration: Duration(milliseconds: 500),
      borderRadius: 0);
}

bool checkEmailId(email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
