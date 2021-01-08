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
      textTheme: TextTheme(
        body1: TextStyle(fontSize: 18),
        body2: TextStyle(fontSize: 16),
        button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
        headline: TextStyle(fontWeight: FontWeight.bold),
        subhead: TextStyle(color: Colors.grey),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
