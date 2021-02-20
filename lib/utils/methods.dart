import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

/*TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
    fontSize: 15);*/

BoxShadow boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 1,
    offset: Offset(0, 3),
    blurRadius: 15);

TextStyle titleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Get.width * 0.06,
    fontFamily: "Poppins");

TextStyle titleTextMediumStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Get.width * 0.04,
    fontFamily: "Poppins");

TextStyle bodyLargeTestStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Get.width * 0.05,
    fontFamily: "Poppins");

TextStyle bodyMediumTestStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Get.width * 0.04,
    fontFamily: "Poppins");

TextStyle buttonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Get.width * 0.05,
    fontFamily: "Poppins");

TextStyle buttonMediumTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Get.width * 0.04,
    fontFamily: "Poppins");

void showToast(String msg, [int position]) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black54,
      gravity: position == 0 ? ToastGravity.BOTTOM : ToastGravity.CENTER);
}
