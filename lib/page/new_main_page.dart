import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/tab/home_tab.dart';
import 'package:virtual_learning/tab/more_tab.dart';
import 'package:virtual_learning/tab/practice_tab.dart';
import 'package:virtual_learning/tab/subscription_tab.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMainPage();
  }
}

class _StateMainPage extends State<MainPage> with TickerProviderStateMixin {
  var userProfile = "";
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  bool isCollapsed = true;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  DashboardController _dashboardController = Get.put(DashboardController());
  SubscriptionController _subscriptionController =
      Get.put(SubscriptionController());

  SubjectController _subjectController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TestController _testController = Get.put(TestController());

  final List<Widget> listOfTab = [
    HomeTab(),
    PracticeTab(),
    SubscriptionTab(),
    MoreTab(),
    SubscriptionTab()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  var currentTab = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        body: Obx(() => PageStorage(
              bucket: bucket,
              child: listOfTab[_dashboardController.currentTab.value],
            )),
        bottomNavigationBar: Obx(() => Container(
              height: Get.height * 0.16,
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.only(
                  left: margin8,
                  right: margin8,
                  bottom: kBottomNavigationBarHeight - 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      margin: EdgeInsets.only(top: margin12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(margin4),
                                    bottomLeft: Radius.circular(margin4)),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _dashboardController.currentTab.value = 0;
                                    });
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + "/ic_home.png",
                                          width: iconBottomHeightWidth,
                                          height: iconBottomHeightWidth,
                                          color: _dashboardController
                                                      .currentTab.value ==
                                                  0
                                              ? Color(0xffF9CC12)
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin2,
                                        ),
                                        Text(
                                          "Home",
                                          style: textStyle10.copyWith(
                                              color: _dashboardController
                                                          .currentTab.value ==
                                                      0
                                                  ? Color(0xffF9CC12)
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _dashboardController.currentTab.value = 1;
                                    });
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            ASSETS_ICONS_PATH +
                                                "/ic_puzzle.png",
                                            width: iconBottomHeightWidth,
                                            height: iconBottomHeightWidth,
                                            color: _dashboardController
                                                        .currentTab.value ==
                                                    1
                                                ? Color(0xffF9CC12)
                                                : Colors.black),
                                        SizedBox(
                                          height: margin2,
                                        ),
                                        Text(
                                          "Practice",
                                          style: textStyle10.copyWith(
                                              color: _dashboardController
                                                          .currentTab.value ==
                                                      1
                                                  ? Color(0xffF9CC12)
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _dashboardController.currentTab.value = 2;
                                    });
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH +
                                              "/ic_bookmark.png",
                                          width: iconBottomHeightWidth,
                                          height: iconBottomHeightWidth,
                                          color: _dashboardController
                                                      .currentTab.value ==
                                                  2
                                              ? Color(0xffF9CC12)
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin2,
                                        ),
                                        Text(
                                          "Bookmark",
                                          style: textStyle10.copyWith(
                                              color: _dashboardController
                                                          .currentTab.value ==
                                                      2
                                                  ? Color(0xffF9CC12)
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _dashboardController.currentTab.value = 3;
                                    });
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + "/ic_more.png",
                                          width: iconBottomHeightWidth,
                                          height: iconBottomHeightWidth,
                                          color: _dashboardController
                                                      .currentTab.value ==
                                                  3
                                              ? Color(0xffF9CC12)
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin2,
                                        ),
                                        Text(
                                          "More",
                                          style: textStyle10.copyWith(
                                              color: _dashboardController
                                                          .currentTab.value ==
                                                      3
                                                  ? Color(0xffF9CC12)
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        margin: EdgeInsets.only(bottom: margin24),
                        decoration: BoxDecoration(
                            color: Color(0xffF9CC12), shape: BoxShape.circle),
                        child: Center(
                          child: Image.asset(
                            ASSETS_ICONS_PATH + "/ic_lightbulb.png",
                            width: iconBottomHeightWidth + 5,
                            height: iconBottomHeightWidth + 5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          setState(() {
            currentTab = -1;
            // currentScreen = HomeTab();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.all(margin8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        // currentScreen = CategoryTab();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        // currentScreen = OrdersTab();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Orders',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                        // currentScreen = LearnTab();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Learn',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                        // currentScreen = ProfileTab();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),*/
        );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill))),
        ],
      ),
    );
  }
}
