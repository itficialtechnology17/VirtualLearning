import 'package:flutter/material.dart';
import 'package:get/get.dart';

final String KEY_IS_LOGIN = "KEY_IS_LOGIN";
final String KEY_IS_DARK_THEME = "KEY_IS_DARK_THEME";
final String KEY_IS_REGISTER = "KEY_IS_REGISTER";
final String KEY_IS_USER_ID = "KEY_IS_USER_ID";
final String KEY_STANDARD_ID = "KEY_STANDARD_ID";
final String ASSETS_BG_PATH = "assets/bg/";
final String ASSETS_ICONS_PATH = "assets/icons/";
final String ASSETS_IMAGE_PATH = "assets/images/";

// bool isDarkTheme = true;
String paymentStage = 'TEST';
// String paymentStage = 'PROD';

bool isRegister = false;
bool isLogin = false;
bool isSubscribe = false;
String studentId = "";
String standardId = "";

String contactEmail = "study@virtuale.com";
String contactNumber1 = "+91-97121 98951";
String contactNumber2 = "+91-96870 26223";
String privacyPolicy = "https://sites.google.com/view/virtual-e-learning/home";
String aboutUs = "https://virtuale.in";

String defaultChapterIcon =
    "https://images.unsplash.com/photo-1586986572014-8261434379cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80";

Color background = Get.isDarkMode ? Colors.black : Color(0xffF9F9FB);
Color cardBackground = Get.isDarkMode ? Color(0xff17212A) : Colors.white;
Color blackThemeWhite = Get.isDarkMode ? Colors.white54 : Colors.black;
Color textColor = Get.isDarkMode ? Colors.white : Colors.black;
Color textColorGreyWhite = Get.isDarkMode ? Colors.white : Colors.grey;
Color iconColor =
    Get.isDarkMode ? Colors.white : Colors.white.withOpacity(0.90);
Color playIconBGColor = Get.isDarkMode ? Colors.white : Colors.black12;
Color playIconColor =
    Get.isDarkMode ? Colors.black : Colors.white.withOpacity(0.90);
Color shimmerColor1 = Get.isDarkMode ? Colors.white12 : Colors.grey[100];
Color shimmerColor2 = Get.isDarkMode ? Colors.white30 : Colors.grey[200];
