import 'package:flutter/material.dart';
import 'package:virtual_learning/page/splash_page.dart';

import 'page/home_page.dart';

//flutter build apk --target-platform=android-arm64
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
//      home: HomePage(),
    );
  }
}
