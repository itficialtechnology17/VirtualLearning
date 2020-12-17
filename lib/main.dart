import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/page/splash_page.dart';

//flutter build apk --target-platform=android-arm64
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    // home: MenuDashboardPage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
      fontFamily: "Poppins",
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
