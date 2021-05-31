import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

import 'chapter_test.dart';

class TestGuide extends StatefulWidget {
  ModelTestDescription modelTestDescription;
  String testName = "";
  String testId = "";

  TestGuide.testId(this.testId);

  TestGuide(this.modelTestDescription, this.testName);

  @override
  State<StatefulWidget> createState() {
    return _StateTestGuide();
  }
}

class _StateTestGuide extends State<TestGuide> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  var isLoadingTest = false;

  List<ModelQuestion> arrOfQuestion = List<ModelQuestion>();

  @override
  void initState() {
    super.initState();
    if (widget.testId == "") {
      getChapterTest(widget.modelTestDescription.id.toString());
    } else {
      getChapterTest(widget.testId);
    }
  }

  void getChapterTest(String testId) async {
    setState(() {
      isLoadingTest = true;
    });

    Request request = Request(url: urlChapterTest, body: {
      'type': "API",
      'test_id': testId,
      'student_id': studentId,
    });
    request.post().then((value) {
      setState(() {
        isLoadingTest = false;
      });
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        setState(() {
          arrOfQuestion = (responseData['data'][0]['question'] as List)
              .map((data) => ModelQuestion.fromJson(data))
              .toList();

          if (arrOfQuestion.isNotEmpty) {
            setState(() {
              arrOfQuestion[0].isSelected = true;
            });
          }

          if (widget.testId != "") {
            widget.testName = responseData['data'][0]['title'];
          }
        });
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      setState(() {
        isLoadingTest = false;
      });
      print(onError);
    });
  }

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
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: _themeController.background.value,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: margin8),
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
                        ),
                        Center(
                          child: Text(
                            widget.testName.toUpperCase(),
                            textScaleFactor: 1.0,
                            style: textStyle11Bold.copyWith(
                                color: _themeController.textColor.value),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: margin16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: margin16,
                    ),
                    Expanded(
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: Get.height * 0.13),
                        decoration: BoxDecoration(
                            color: Color(0xff7FCB4F),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              arrOfQuestion.length.toString(),
                              textScaleFactor: 1.0,
                              style:
                                  textStyle12Bold.copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: margin2,
                            ),
                            Text(
                              "No. of Questions",
                              textScaleFactor: 1.0,
                              style: textStyle9.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: margin16,
                    ),
                    Expanded(
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: Get.height * 0.13),
                        decoration: BoxDecoration(
                            color: Color(0xffF9CC12),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.modelTestDescription.marks,
                              textScaleFactor: 1.0,
                              style:
                                  textStyle12Bold.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: margin2,
                            ),
                            Text(
                              "Total Marks",
                              textScaleFactor: 1.0,
                              style: textStyle9.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: margin16,
                    ),
                  ],
                ),
                SizedBox(
                  height: margin16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  child: Text(
                    "Instructions",
                    style: textStyle12Bold.copyWith(
                        color: _themeController.textColor.value),
                    textScaleFactor: 1.0,
                  ),
                ),
                SizedBox(
                  height: margin12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  child: widget.modelTestDescription.instruction != null
                      ? Html(
                          data: widget.modelTestDescription.instruction,
                          style: {
                              "body": Style(
                                  color: _themeController.textColor.value,
                                  fontFamily: "Nunito"),
                            })
                      : Text(
                          "No instruction added.",
                          textScaleFactor: 1.0,
                          style: textStyle9,
                        ),
                ),
                Spacer(),
                Center(
                  child: Material(
                    color: Color(0xff7FCB4F),
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        if (widget.testId != "") {
                          ModelTestDescription _modelTestDescription =
                              ModelTestDescription();
                          _modelTestDescription.id = int.parse(widget.testId);
                          _modelTestDescription.title = widget.testName;
                          Get.off(ChapterTest(arrOfQuestion,
                              _modelTestDescription, widget.testName));
                        } else {
                          Get.off(ChapterTest(arrOfQuestion,
                              widget.modelTestDescription, widget.testName));
                        }
                      },
                      child: Container(
                        width: Get.width * 0.40,
                        height: Get.height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
                              textScaleFactor: 1.0,
                              style:
                                  textStyle10Bold.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: margin12,
                ),
              ],
            ),
          )
        ])));
  }
}
