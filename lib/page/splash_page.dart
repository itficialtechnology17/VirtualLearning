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
    var _duration = new Duration(seconds: 2);
    Timer(_duration, loadPrefs);
  }

  Future<void> disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
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
              "assets/images/ic_virtualE_logo.png",
            ),
            height: MediaQuery.of(context).size.width * 0.50,
            width: MediaQuery.of(context).size.width * 0.50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

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
}
