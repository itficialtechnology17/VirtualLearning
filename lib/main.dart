import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/page/main_page.dart';

//flutter build apk --target-platform=android-arm64
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
      fontFamily: "Poppins",
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Poppins",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashPage(),
      home: MainPage(),
    );
  }
}*/
