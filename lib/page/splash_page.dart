import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/page/new_main_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSplashPage();
  }
}

class _StateSplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    disableCapture();
    var _duration = new Duration(seconds: 3);
    Timer(_duration, loadPrefs);
  }

  Future<void> disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  loadPrefs() async {
    isLogin = await getBoolValuesSF(KEY_IS_LOGIN) ?? false;
    isRegister = await getBoolValuesSF(KEY_IS_REGISTER) ?? false;

    if (isLogin) {
      studentId = await getStringValuesSF(KEY_IS_USER_ID) ?? "0";
      standardId = await getStringValuesSF(KEY_STANDARD_ID) ?? "0";
      Get.off(MainPage());
    } else {
      Get.off(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(
      // backgroundColor: Color(0xff0A0A78),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_splash.png"),
                fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(horizontal: margin20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.25),
            Image.asset(
              "assets/images/ic_app_logo_name.png",
              width: Get.width * 0.30,
            ),
            SizedBox(height: Get.height * 0.05),
            Text(
              "Path to",
              style: textStyle10.copyWith(color: Colors.white),
            ),
            Text(
              "Pinnacle",
              style: textStyle14Bold.copyWith(color: Colors.white),
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
