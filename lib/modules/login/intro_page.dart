import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/course_page.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateIntroPage();
  }
}

class _StateIntroPage extends State<IntroPage> {
  var arrOfSlider = [
    'assets/images/ic_slider_01.png',
    'assets/images/ic_slider_01.png',
    'assets/images/ic_slider_01.png',
  ];

  var _currentPosition = 0.0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Container(
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
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: PageView.builder(
                controller: _pageController,
                itemCount: arrOfSlider.length,
                itemBuilder: (BuildContext context, int position) {
                  return Center(
                    child: Image(
                      image: AssetImage(
                        arrOfSlider[position],
                      ),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPosition = index.toDouble();
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: DotsIndicator(
                  dotsCount: arrOfSlider.length,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                    color: const Color(0xff205072), // Inactive color
                    activeColor: const Color(0xff3AA59B),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                        type: MaterialType.transparency,
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Get.to(CoursePage());
                            },
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Color(0xff3aa59b))),
                              child: Center(
                                child: Text(
                                  'GET STARTED',
                                  style: TextStyle(
                                    fontFamily: "",
                                    fontSize: 16,
                                    color: const Color(0xff205072),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
