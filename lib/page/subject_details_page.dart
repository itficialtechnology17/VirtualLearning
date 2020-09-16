import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/tabs/lessons_tab.dart';
import 'package:virtual_learning/tabs/mock_test_tab.dart';
import 'package:virtual_learning/tabs/question_bank_tab.dart';
import 'package:virtual_learning/utils/SABT.dart';
import 'package:virtual_learning/utils/custom_color.dart';

class SubjectDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSubjectDetails();
  }
}

class _StateSubjectDetails extends State<SubjectDetailsPage> {
  var arrOfSubject = List<ModelSubject>();

  PageController _pageController;
  var currentPosition = 0;

  final List<String> numbers = [
    "https://www.classcentral.com/report/wp-content/uploads/2020/04/learn-for-free-coronavirus-1024x512.png",
    "https://www.classcentral.com/report/wp-content/uploads/2020/04/covid-19-learning.png",
    "https://mailer-ssc.s3-ap-southeast-1.amazonaws.com/FutureSkills/May+22+2020/header-banner.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPosition);

    var modelSubject = ModelSubject();
    modelSubject.subjectName = "Science";
    modelSubject.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501392.svg";
    arrOfSubject.add(modelSubject);

    var modelSubject1 = ModelSubject();
    modelSubject1.subjectName = "Computer";
    modelSubject1.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501428.svg";
    arrOfSubject.add(modelSubject1);

    var modelSubject2 = ModelSubject();
    modelSubject2.subjectName = "Maths";
    modelSubject2.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501434.svg";
    arrOfSubject.add(modelSubject2);

    var modelSubject3 = ModelSubject();
    modelSubject3.subjectName = "Statistics";
    modelSubject3.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501405.svg";
    arrOfSubject.add(modelSubject3);

    var modelSubject4 = ModelSubject();
    modelSubject4.subjectName = "Account";
    modelSubject4.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501396.svg";
    arrOfSubject.add(modelSubject4);

    var modelSubject5 = ModelSubject();
    modelSubject5.subjectName = "Economics";
    modelSubject5.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501399.svg";
    arrOfSubject.add(modelSubject5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              backgroundColor: Colors.white,
              pinned: true,
              centerTitle: true,
              elevation: 0,
              title: SABT(
                child: Text("Mathematics",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    )),
              ),
              leading: Material(
                color: Colors.transparent,
                type: MaterialType.circle,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Platform.isAndroid
                        ? Icons.arrow_back
                        : Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  /* title: SABT(
                    child: Text("Subject Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                  ),*/
                  background: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 50, left: 24),
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.20,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: SvgPicture.network(
                                "https://www.flaticon.com/svg/static/icons/svg/501/501405.svg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Mathematics",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            Text("8 Chapters | 47 Videos",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12)),
                          ],
                        ),
                      ))),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 4,
                        offset: Offset(1, 1))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentPosition = 0;
                            _pageController.jumpToPage(0);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentPosition == 0
                                ? Color(CustomColor.colorThemeDark)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24)),
                          ),
                          child: Center(
                            child: Text(
                              "Lessons".toUpperCase(),
                              style: TextStyle(
                                  color: currentPosition == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 1,
                    margin: EdgeInsets.only(top: 4, bottom: 4),
                    color: Colors.grey[100],
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentPosition = 1;
                            _pageController.jumpToPage(1);
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: currentPosition == 1
                                  ? Color(CustomColor.colorThemeDark)
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Mock Test".toUpperCase(),
                                style: TextStyle(
                                    color: currentPosition == 1
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: 1,
                    margin: EdgeInsets.only(top: 4, bottom: 4),
                    color: Colors.grey[100],
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentPosition = 2;
                            _pageController.jumpToPage(2);
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: currentPosition == 2
                                  ? Color(CustomColor.colorThemeDark)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  bottomRight: Radius.circular(24)),
                            ),
                            child: Center(
                              child: Text(
                                "Question Bank".toUpperCase(),
                                style: TextStyle(
                                    color: currentPosition == 2
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: _pageController,
                children: [LessonsTab(), MockTestTab(), QuestionBankTab()],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onTapSubject(int position) {}
}
