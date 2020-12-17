import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/page/main_page.dart';
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
    var _duration = new Duration(seconds: 2);
    Timer(_duration, loadPrefs);
  }

  @override
  Widget build(BuildContext context) {
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
      userId = await getStringValuesSF(KEY_IS_USER_ID) ?? "0";

      Get.off(MainPage());
    } else {
      Get.off(LoginPage());
    }
  }
}
