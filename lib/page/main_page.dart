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
import 'package:virtual_learning/modules/search/search_page.dart';
import 'package:virtual_learning/modules/test/test_page.dart';
import 'package:virtual_learning/page/ask_doubt.dart';
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
        body: Obx(() => _dashboardController.isDashboardLoading.value
            ? ShimmerPage()
            : Stack(
                children: [
                  Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/ic_bg.png"),
                              fit: BoxFit.fill))),
                  Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: Colors.transparent,
                    drawer: CustomDrawer(),
                    appBar: AppBar(
                      centerTitle: true,
                      brightness: Brightness.light,
                      elevation: 0,
                      titleSpacing: 0.0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      leading: Container(
                        child: Center(
                          child: Material(
                            color: Color(0xffD0E6EE),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                            child: InkWell(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                )),
                                width: double.infinity,
                                height: AppBar().preferredSize.height -
                                    AppBar().preferredSize.height * 0.30,
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset(
                                    "assets/icons/ic_menu.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      flexibleSpace: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xffFFAB4B),
                          Color(0xffFD5CA0),
                        ])),
                      ),
                    ),
                    body: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          Text(
                            "Hey " + _loginController.modelUser.value.firstName,
                            // "Hey Student",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Text("You have completed 6 lesson in this week.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.grey)),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
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
                                          fontWeight: FontWeight.w500,
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
                          GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 24.0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(
                              _subjectController.arrOfSubject.length,
                              (index) {
                                return Material(
                                  // color: arrOfSubject[index].bgColor,
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    splashColor: Colors.grey[200],
                                    onTap: () {
                                      _subjectController.selectedSubject.value =
                                          _subjectController
                                              .arrOfSubject[index];
                                      Get.to(LessonListing());
                                      /*Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LessonListing.modelSubject(
                                                      _subjectController
                                                              .arrOfSubject[
                                                          index])));*/
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          _subjectController
                                              .arrOfSubject[index].icon,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.20,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          _subjectController
                                              .arrOfSubject[index].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _dashboardController.arrOfWatchHistory.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      shrinkWrap: true,
                                      itemCount: _dashboardController
                                                  .arrOfWatchHistory.length >
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
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlayVideo()));*/
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              padding: EdgeInsets.all(8),
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize:
                                                                      14)),
                                                          maxLines: 1,
                                                        ),
                                                        Text(
                                                          "Continue Learning",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12),
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
                                                      color: Colors.green[300],
                                                    ),
                                                    progressColor:
                                                        Colors.green[300],
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
                                      separatorBuilder: (context, index) {
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
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Color(0xffD8EBF2),
                                      onTap: () {
                                        Get.to(TestPage("Chapter Name"));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.16,
                                              margin: EdgeInsets.only(top: 25),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffD8EBF2)),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                "assets/images/ic_exam_01.png",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 16),
                                                child: Text(
                                                  "Test",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Expanded(
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AskDoubt()));
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.16,
                                              margin: EdgeInsets.only(top: 25),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffD8EBF2)),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Image.asset(
                                                "assets/images/ic_ask_doubt.png",
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                isAntiAlias: true,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 16),
                                                  child: Text(
                                                    "Ask a doubt",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
