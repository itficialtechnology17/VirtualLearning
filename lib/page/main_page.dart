import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/modules/lesson/lesson_listing.dart';
import 'package:virtual_learning/modules/menu/custom_drawer.dart';
import 'package:virtual_learning/modules/player/play_recent_video.dart';
import 'package:virtual_learning/modules/search/search_page.dart';
import 'package:virtual_learning/modules/test/test_page.dart';
import 'package:virtual_learning/page/ask_doubt.dart';
import 'package:virtual_learning/utils/SABT.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';
import 'package:virtual_learning/widgets/shimmer_page.dart';

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
  LoginController _loginController = Get.find();
  SubjectController _subjectController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
        // key: _scaffoldKey,
        body: Obx(() => _dashboardController.isDashboardLoading.value
            ? ShimmerPage()
            : Stack(
                children: [
                  Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/ic_bg.png"),
                              fit: BoxFit.fill))),
                  Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: Colors.transparent,
                    body: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: Get.height * 0.30,
                            floating: false,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            pinned: true,
                            title: SABT(
                              child: Text("HOME"),
                            ),
                            leading: Container(
                              child: Material(
                                type: MaterialType.circle,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _scaffoldKey.currentState.openDrawer();
                                  },
                                  child: Image.asset(
                                    'assets/icons/ic_menu.png',
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              SABT(
                                child: Row(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      type: MaterialType.circle,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(SearchPage());
                                        },
                                        child: Image.asset(
                                          "assets/icons/ic_search.png",
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    )
                                  ],
                                ),
                              )
                            ],
                            flexibleSpace: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                children: [
                                  ListView(
                                    shrinkWrap: true,
                                    children: [
                                      SizedBox(
                                          height:
                                              AppBar().preferredSize.height +
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .top),
                                      Text(
                                        "Welcome " +
                                            _loginController
                                                .modelUser.value.firstName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        _loginController
                                            .modelUser.value.firstName
                                            .toString()
                                            .toUpperCase(),
                                        // "Hey Student",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          onTap: () {
                                            Get.to(SearchPage());
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Icon(
                                                  Icons.search,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Search for here",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: AppBar().preferredSize.height +
                                        MediaQuery.of(context).padding.top,
                                    child: Image.asset(
                                      "assets/icons/ic_logo_name.png",
                                      fit: BoxFit.contain,
                                      width: Get.width * 0.20,
                                      height: Get.width * 0.20,
                                    ),
                                  )
                                ],
                                fit: StackFit.expand,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        Color(0xff14C269),
                                        Color(0xff0A0A78),
                                      ])),
                            ),
                          ),
                        ];
                      },
                      body: Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            /*SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),*/
                            /* SizedBox(
                              height: 20,
                            ),*/
                            Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subjects",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 16, right: 16),
                            ),
                            Container(
                              height: Get.height * 0.18,
                              child: ListView.builder(
                                itemCount:
                                    _subjectController.arrOfSubject.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: Get.height * 0.15,
                                        height: Get.height * 0.18,
                                        margin: EdgeInsets.only(left: 16),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                                colors: [
                                                  HexColor.fromHex(
                                                      _subjectController
                                                          .arrOfSubject[index]
                                                          .color1),
                                                  HexColor.fromHex(
                                                      _subjectController
                                                          .arrOfSubject[index]
                                                          .color2),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter)),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                storageUrl +
                                                    _subjectController
                                                        .arrOfSubject[index]
                                                        .icon,
                                                height: Get.height * 0.08,
                                                width: Get.height * 0.08,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                _subjectController
                                                    .arrOfSubject[index].name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: InkWell(
                                            splashColor: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: () {
                                              _subjectController
                                                      .selectedSubject.value =
                                                  _subjectController
                                                      .arrOfSubject[index];
                                              Get.to(LessonListing());
                                            },
                                            child: Container(
                                              width: Get.height * 0.15,
                                              height: Get.height * 0.18,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _dashboardController
                                          .arrOfWatchHistory.isNotEmpty
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Here you left",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ListView.separated(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: _dashboardController
                                                          .arrOfWatchHistory
                                                          .length >
                                                      2
                                                  ? 2
                                                  : _dashboardController
                                                      .arrOfWatchHistory.length,
                                              itemBuilder: (context, index) {
                                                return Material(
                                                  color: Color(0xffF5FAF5),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: InkWell(
                                                    splashColor: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    onTap: () {
                                                      Get.to(PlayRecentVideo(
                                                          _dashboardController
                                                                  .arrOfWatchHistory[
                                                              index]));
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.10,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          /* ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      "https://image.freepik.com/free-vector/geography-tool-diploma_24911-9910.jpg",
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.07,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.07,
                                                    ),
                                                  ),*/
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                      text: _dashboardController
                                                                          .arrOfWatchHistory[
                                                                              index]
                                                                          .name,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontFamily:
                                                                              "Poppins",
                                                                          fontSize:
                                                                              14)),
                                                                  maxLines: 1,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Continue Learning",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 2),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_outlined,
                                                                        color: Colors
                                                                            .grey,
                                                                        size:
                                                                            10,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            radius: 30.0,
                                                            lineWidth: 2.5,
                                                            percent: 1.0,
                                                            backgroundColor:
                                                                Colors.white,
                                                            center: Icon(
                                                              Icons.play_arrow,
                                                              color: Colors
                                                                  .green[300],
                                                            ),
                                                            progressColor:
                                                                Colors
                                                                    .green[300],
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 16,
                                                );
                                              },
                                            )
                                          ],
                                        )
                                      : Container(
                                          height: 1,
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/icons/ic_test_banner.png"),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.05),
                                                        // color: Color(0xff0A0A78).withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 15)
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.16),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8),
                                                      child: Text(
                                                        "Test".toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16),
                                                      ),
                                                    )),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    onTap: () {
                                                      Get.to(TestPage(
                                                          "Chapter Name"));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/icons/ic_ask_doubt_banner.png"),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.05),
                                                        // color: Color(0xff0A0A78).withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 15)
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.16),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8),
                                                      child: Text(
                                                        "Ask Doubt"
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16),
                                                      ),
                                                    )),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: Get.height * 0.15,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    onTap: () {
                                                      Get.to(AskDoubt());
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 16, right: 16),
                            )

                            /*SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Test".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: arrOfSubject.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.only(right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(colors: [
                                        Color(0xffFFFFFF),
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                      ])),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                          "assets/images/ic_test_start.png")
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                  SizedBox(
                    height: 20,
                  ),*/
                          ],
                        ),
                      ),
                    ),
                    drawer: CustomDrawer(),
                  )
                ],
              )));
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Messages",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Utility Bills",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
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
