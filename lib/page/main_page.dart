import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/page/ask_doubt.dart';
import 'package:virtual_learning/page/lesson_listing.dart';
import 'package:virtual_learning/page/mcq_test_page.dart';
import 'package:virtual_learning/page/play_video.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMainPage();
  }
}

class _StateMainPage extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Color> subjectColor = [
    Color(0xffF3FFD7),
    Color(0xffFED4D5),
    Color(0xffFFF2D0),
    Color(0xffDCFFF9),
    Color(0xffD4E6FE),
    Color(0xffDBE9E9),
    Color(0xffF6E9D3)
  ];

  List<ModelSubject> arrOfSubject = [
    ModelSubject(
        Color(0xffF3FFD7), "assets/subject/chemistry.svg", "Chemistry"),
    ModelSubject(
        Color(0xffFED4D5), "assets/subject/economics.svg", "Economics"),
    ModelSubject(Color(0xffFFF2D0), "assets/subject/geometry.svg", "Geometry"),
    ModelSubject(Color(0xffF6E9D3), "assets/subject/STATS.svg", "Stats"),
    ModelSubject(Color(0xffDCFFF9), "assets/subject/mathematics.svg", "Maths"),
    ModelSubject(Color(0xffD4E6FE), "assets/subject/physics.svg", "Physics"),
  ];
  var userProfile = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        elevation: 0,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Container(
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Color(0xffD0E6EE),
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
        actions: [
          userProfile == ""
              ? CircleAvatar(
                  radius: 20,
                  child: SvgPicture.network(
                    "https://www.flaticon.com/svg/static/icons/svg/599/599305.svg",
                  ),
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(userProfile),
                ),
          SizedBox(
            width: 8,
          )
        ],
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
              "Hey Guest",
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
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
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
                    "Search for Course, Test, Subject",
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
                arrOfSubject.length,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LessonListing.modelSubject(
                                        arrOfSubject[index])));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            arrOfSubject[index].icon,
                            height: MediaQuery.of(context).size.width * 0.20,
                            width: MediaQuery.of(context).size.width * 0.20,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            arrOfSubject[index].name,
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
            Material(
              color: Color(0xffF5FAF5),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayVideo()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "https://image.freepik.com/free-vector/geography-tool-diploma_24911-9910.jpg",
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Basic What is Virtual E ?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                              maxLines: 1,
                            ),
                            Text(
                              "2 hours, 40 Min",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        radius: 40.0,
                        lineWidth: 3.0,
                        percent: 0.7,
                        backgroundColor: Colors.white,
                        center: Icon(
                          Icons.play_arrow,
                          color: Colors.green[300],
                        ),
                        progressColor: Colors.green[300],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Color(0xffFEF6F4),
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayVideo()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "https://image.freepik.com/free-vector/colorful-illustration-about-geography-modern-flat-style_1040-3200.jpg",
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Basic What is Virtual E ?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                              maxLines: 1,
                            ),
                            Text(
                              "2 hours, 40 Min",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        radius: 40.0,
                        lineWidth: 3.0,
                        percent: 0.7,
                        backgroundColor: Colors.white,
                        center: Icon(
                          Icons.play_arrow,
                          color: Colors.green[300],
                        ),
                        progressColor: Colors.green[300],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
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
                          Get.to(MCQTest());
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                margin: EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffD8EBF2)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "assets/images/ic_exam_01.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Text(
                                    "Test",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
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
                    width: MediaQuery.of(context).size.width * 0.05,
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
                                  builder: (context) => AskDoubt()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                margin: EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffD8EBF2)),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "assets/images/ic_ask_doubt.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.35,
                                  isAntiAlias: true,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Text(
                                      "Ask a doubt",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
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
    );
  }
}
