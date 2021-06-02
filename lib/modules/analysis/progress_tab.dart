import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/utils/methods.dart';

class ProgressTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateProgressTab();
  }
}

class _StateProgressTab extends State<ProgressTab> {
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: _themeController.isDarkTheme.value
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: _themeController.isDarkTheme.value
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: _themeController.background.value,
        statusBarColor: _themeController.background.value));

    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Container(
            margin: EdgeInsets.only(right: margin16),
          ),
        ));
  }
}
