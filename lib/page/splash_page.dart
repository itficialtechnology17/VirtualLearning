import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_learning/Intro11.dart';
import 'package:virtual_learning/page/intro_page.dart';

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => IntroPage()),
    );
  }
}
