import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/modules/subscription/subscription.dart';
import 'package:virtual_learning/tab/bookmark_tab.dart';
import 'package:virtual_learning/tab/home_tab.dart';
import 'package:virtual_learning/tab/more_tab.dart';
import 'package:virtual_learning/tab/practice_tab.dart';
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
    BookmarkTab(),
    MoreTab(),
  ];

  ThemeController _themeController = Get.find();
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
        statusBarIconBrightness: _themeController.isDarkTheme.value
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: _themeController.isDarkTheme.value
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: _themeController.background.value,
        statusBarColor: _themeController.background.value));

    return Obx(() => Scaffold(
        backgroundColor: _themeController.background.value,
        body: Obx(() => PageStorage(
              bucket: bucket,
              child: listOfTab[_dashboardController.currentTab.value],
            )),
        bottomNavigationBar: Obx(() => _dashboardController
                .isDashboardLoading.value
            ? SizedBox.shrink()
            : Container(
                height: Get.height * 0.10,
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: margin8),
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
                                        _dashboardController.currentTab.value =
                                            0;
                                      });
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ASSETS_ICONS_PATH + "ic_home.png",
                                            width: iconBottomHeightWidth,
                                            height: iconBottomHeightWidth,
                                            color: _dashboardController
                                                        .currentTab.value ==
                                                    0
                                                ? Color(0xff7FCB4F)
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: margin2,
                                          ),
                                          Text(
                                            "Home",
                                            textScaleFactor: 0.8,
                                            style: textStyle10.copyWith(
                                                color: _dashboardController
                                                            .currentTab.value ==
                                                        0
                                                    ? Color(0xff7FCB4F)
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
                                        _dashboardController.currentTab.value =
                                            1;
                                      });
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              ASSETS_ICONS_PATH +
                                                  "ic_puzzle.png",
                                              width: iconBottomHeightWidth,
                                              height: iconBottomHeightWidth,
                                              color: _dashboardController
                                                          .currentTab.value ==
                                                      1
                                                  ? Color(0xff7FCB4F)
                                                  : Colors.black),
                                          SizedBox(
                                            height: margin2,
                                          ),
                                          Text(
                                            "Practice",
                                            textScaleFactor: 0.8,
                                            style: textStyle10.copyWith(
                                                color: _dashboardController
                                                            .currentTab.value ==
                                                        1
                                                    ? Color(0xff7FCB4F)
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
                                        _dashboardController.currentTab.value =
                                            2;
                                      });
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ASSETS_ICONS_PATH +
                                                "ic_bookmark.png",
                                            width: iconBottomHeightWidth,
                                            height: iconBottomHeightWidth,
                                            color: _dashboardController
                                                        .currentTab.value ==
                                                    2
                                                ? Color(0xff7FCB4F)
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: margin2,
                                          ),
                                          Text(
                                            "Bookmarks",
                                            textScaleFactor: 0.8,
                                            style: textStyle10.copyWith(
                                                color: _dashboardController
                                                            .currentTab.value ==
                                                        2
                                                    ? Color(0xff7FCB4F)
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
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(margin4),
                                      bottomRight: Radius.circular(margin4)),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _dashboardController.currentTab.value =
                                            3;
                                      });
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ASSETS_ICONS_PATH + "ic_more.png",
                                            width: iconBottomHeightWidth,
                                            height: iconBottomHeightWidth,
                                            color: _dashboardController
                                                        .currentTab.value ==
                                                    3
                                                ? Color(0xff7FCB4F)
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: margin2,
                                          ),
                                          Text(
                                            "More",
                                            textScaleFactor: 0.8,
                                            style: textStyle10.copyWith(
                                                color: _dashboardController
                                                            .currentTab.value ==
                                                        3
                                                    ? Color(0xff7FCB4F)
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF9CC12),
                          ),
                          margin: EdgeInsets.only(bottom: Get.height * 0.04),
                          child: Material(
                            color: Color(0xffF9CC12),
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Get.to(Subscription());
                                });
                              },
                              child: Container(
                                width: Get.width * 0.15,
                                height: Get.width * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    ASSETS_ICONS_PATH + "ic_lightbulb.png",
                                    width: iconBottomHeightWidth + 5,
                                    height: iconBottomHeightWidth + 5,
                                    color:
                                        _dashboardController.currentTab.value ==
                                                4
                                            ? Colors.black
                                            : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      /*Center(
                      child: Container(
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF9CC12),
                        ),
                        margin: EdgeInsets.only(bottom: Get.height * 0.04),
                        child: Center(
                          child: Material(
                            type: MaterialType.circle,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _dashboardController.currentTab.value = 4;
                                });
                              },
                              child: Image.asset(
                                ASSETS_ICONS_PATH + "ic_lightbulb.png",
                                width: iconBottomHeightWidth,
                                height: iconBottomHeightWidth,
                                color:
                                    _dashboardController.currentTab.value == 4
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )*/
                    ],
                  ),
                ),
              ))));
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
