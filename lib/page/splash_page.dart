import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/course_page.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/utils/constant.dart';
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
    var _duration = new Duration(seconds: 4);
    Timer(_duration, loadPrefs);
  }

  Future<void> disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

/*  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Image(
            image: AssetImage(
              "assets/images/ic_logo_1024.png",
            ),
            // height: MediaQuery.of(context).size.width * 0.50,
            // width: MediaQuery.of(context).size.width * 0.50,
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }*/

  loadPrefs() async {
    isLogin = await getBoolValuesSF(KEY_IS_LOGIN) ?? false;
    isRegister = await getBoolValuesSF(KEY_IS_REGISTER) ?? false;

    if (isLogin) {
      studentId = await getStringValuesSF(KEY_IS_USER_ID) ?? "0";
      standardId = await getStringValuesSF(KEY_STANDARD_ID) ?? "0";

      // Get.off(MainPage());
      Get.off(CoursePage());
    } else {
      Get.off(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: Color(0xff0A0A78),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.20),
            Image.asset(
              "assets/images/ic_app_logo_name.png",
              width: Get.width * 0.30,
            ),
            SizedBox(height: Get.height * 0.05),
            Text(
              "Path to",
              style: textStyle12.copyWith(color: Colors.white),
            ),
            Text(
              "Pinnacle",
              style: textStyle14Bold.copyWith(color: Colors.white),
            ),
            SizedBox(height: Get.height * 0.03),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Center(
                    child: Image.asset(
                      "assets/images/ic_splash_illustration.png",
                      width: Get.width * 0.80,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
