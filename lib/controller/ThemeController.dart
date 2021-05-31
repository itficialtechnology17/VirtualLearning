import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:virtual_learning/utils/constant.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  var background = Colors.black.obs;
  var cardBackground = Color(0xff17212A).obs;
  var textColor = Colors.white.obs;
  var diffTextColor = Colors.black.obs;
  var textColorGreyWhite = Colors.white.obs;
  var iconColor = Colors.white.obs;
  var playIconBGColor = Colors.white.obs;
  var playIconColor = Colors.black.obs;
  var shimmerColor1 = Colors.white12.obs;
  var shimmerColor2 = Colors.white30.obs;

  final appData = GetStorage();

  @override
  void onInit() {
    super.onInit();
    appData.writeIfNull(KEY_IS_DARK_THEME, false);
    isDarkTheme.value = appData.read(KEY_IS_DARK_THEME);

    setTheme();
  }

  void setTheme() {
    background.value =
        isDarkTheme.value ? Color(0xff13181F) : Color(0xffF9F9FB);
    cardBackground.value = isDarkTheme.value ? Color(0xff17212A) : Colors.white;
    textColor.value = isDarkTheme.value ? Colors.white : Colors.black;
    diffTextColor.value = isDarkTheme.value ? Colors.black : Colors.white;
    textColorGreyWhite.value = isDarkTheme.value ? Colors.white : Colors.grey;
    iconColor.value = isDarkTheme.value ? Colors.white : Colors.black;
    playIconBGColor.value = isDarkTheme.value ? Colors.white : Colors.black12;
    playIconColor.value =
        isDarkTheme.value ? Color(0xff13181F) : Colors.white.withOpacity(0.90);
    shimmerColor1.value = isDarkTheme.value ? Colors.white12 : Colors.grey[100];
    shimmerColor2.value = isDarkTheme.value ? Colors.white30 : Colors.grey[200];
  }
}
