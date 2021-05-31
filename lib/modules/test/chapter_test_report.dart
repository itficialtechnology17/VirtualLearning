import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/modules/test/test_result_details.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class ChapterTestReport extends StatefulWidget {
  final ModelTestDescription modelTestDescription;

  ChapterTestReport(this.modelTestDescription);

  @override
  State<StatefulWidget> createState() {
    return StateChapterTestReport();
  }
}

class StateChapterTestReport extends State<ChapterTestReport> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    getChapterTestResult(widget.modelTestDescription.id.toString());
  }

  bool isGettingTopicTestResult = false;

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
        body: Stack(children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.lightGreenAccent,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Material(
                              color: Colors.transparent,
                              type: MaterialType.circle,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(margin8),
                                  child: Image.asset(
                                    ASSETS_ICONS_PATH + 'ic_back.png',
                                    height: iconHeightWidth,
                                    width: iconHeightWidth,
                                    fit: BoxFit.fitWidth,
                                    color: _themeController.iconColor.value,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Test Result",
                              style: textStyle11Bold.copyWith(
                                  color: _themeController.textColor.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: margin24 + margin16,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Score and",
                        style: textStyle12Bold.copyWith(
                            color: _themeController.textColor.value)),
                    TextSpan(
                        text: " Solutions",
                        style:
                            textStyle12Bold.copyWith(color: Color(0xff7FCB4F))),
                  ]),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: margin24 + margin24, vertical: margin16),
                    padding: EdgeInsets.symmetric(
                        horizontal: margin24 + margin16, vertical: margin24),
                    decoration: BoxDecoration(
                        color: _themeController.cardBackground.value,
                        boxShadow: [
                          !_themeController.isDarkTheme.value
                              ? BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(0, 0),
                                  blurRadius: 10.0,
                                )
                              : BoxShadow(),
                        ],
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "YOUR SCORE",
                          style: textStyle12Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              correctAnswer.toString(),
                              style: textStyle14Bold.copyWith(
                                  color: Color(0xffF9CC12),
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              " / ",
                              style: textStyle14Bold.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _themeController.textColor.value),
                            ),
                            Text(
                              totalQuestion,
                              style: textStyle14Bold.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _themeController.textColor.value),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16, vertical: margin24),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        !_themeController.isDarkTheme.value
                            ? BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(0, 0),
                                blurRadius: 10.0,
                              )
                            : BoxShadow(),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: _themeController.cardBackground.value),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              correctAnswer.toString(),
                              style: textStyle14Bold.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _themeController.textColor.value),
                            ),
                            Text(
                              "Correct",
                              textAlign: TextAlign.center,
                              style: textStyle10Bold.copyWith(
                                  color: _themeController.textColor.value),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        color: Color(0xffE9E9E9),
                        height: Get.height * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              wrongAnswer.toString(),
                              style: textStyle14Bold.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _themeController.textColor.value),
                            ),
                            Text(
                              "Wrong",
                              textAlign: TextAlign.center,
                              style: textStyle10Bold.copyWith(
                                  color: _themeController.textColor.value),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        color: Color(0xffE9E9E9),
                        height: Get.height * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              skippedAnswer.toString(),
                              style: textStyle14Bold.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _themeController.textColor.value),
                            ),
                            Text(
                              "Skipped",
                              textAlign: TextAlign.center,
                              style: textStyle10Bold.copyWith(
                                  color: _themeController.textColor.value),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      !_themeController.isDarkTheme.value
                          ? BoxShadow(
                              color: Colors.grey[100],
                              offset: Offset(0, 0),
                              blurRadius: 10.0,
                            )
                          : BoxShadow(),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: margin24 + margin24, vertical: margin16),
                  child: Material(
                    color: Color(0xff7FCB4F),
                    borderRadius: BorderRadius.circular(margin24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(margin24),
                      onTap: () {
                        Get.to(TestResultDetails(arrOfQuestion));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: margin24, vertical: margin8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(margin24)),
                        child: Center(
                          child: Text(
                            "View Solution".toUpperCase(),
                            style:
                                textStyle10Bold.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ])));
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: _subjectController.selectedSubject.value.id == null
                  ? LinearGradient(
                      colors: [
                        Color(0xff14C269),
                        Color(0xff0A0A78),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                  : LinearGradient(
                      colors: [
                        */ /*Color(0xff14C269),
                  Color(0xff0A0A78),*/ /*
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color1),
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color2),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
        ),
        title: Text(
          widget.modelTestDescription.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Container(
          child: Center(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
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
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: isGettingTopicTestResult
          ? Container(
              child: Center(
                child: SizedBox(
                  height: Get.width * 0.10,
                  width: Get.width * 0.10,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
              height: Get.height - (AppBar().preferredSize.height),
            )
          : Container(
              color: Colors.white,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/test_report.svg",
                    width: Get.width * 0.40,
                  ),
                  Text(correctAnswer.toString() + "/" + totalQuestion),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Text(
                                  correctAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Right\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  wrongAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Wrong\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  skippedAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Skipped\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        Get.to(TestResultDetails(arrOfQuestion));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          "View Solution".toUpperCase(),
                          style: buttonTextStyle.copyWith(
                              color: Colors.white, fontSize: Get.width * 0.04),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }*/

  String percentage = "";
  String totalQuestion = "";
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int skippedAnswer = 0;
  List<ModelAnswer> arrOfQuestion = List<ModelAnswer>();

  void getChapterTestResult(String contentId) async {
    setState(() {
      isGettingTopicTestResult = true;
    });

    Request request = Request(url: urlChapterTestResult, body: {
      'type': "API",
      'test_id': contentId.toString(),
      'student_id': studentId,
    });

    request.post().then((value) {
      setState(() {
        isGettingTopicTestResult = false;
      });
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        setState(() {
          percentage = responseData['data']['percentage'].toString();
          totalQuestion = responseData['data']['total_question'].toString();
          correctAnswer = responseData['correct_answer'];
          wrongAnswer = responseData['wrong_answer'];
          skippedAnswer = responseData['skip_answer'];
          arrOfQuestion = ((responseData['data']['total_answer'] as List)
              .map((data) => ModelAnswer.fromJson(data))
              .toList());
        });
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      setState(() {
        isGettingTopicTestResult = false;
      });
      print(onError);
    });
  }
}
