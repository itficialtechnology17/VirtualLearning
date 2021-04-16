import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
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

  /* @override
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
                      colors: [Color(0xff14C269), Color(0xff0A0A78)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                  : LinearGradient(
                      colors: [
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color1),
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color2)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
        ),
        title: Text(
          widget.testName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
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
      body: isLoadingTest
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
              height: Get.height - (AppBar().preferredSize.height + 10),
            )
          : Container(
              margin: EdgeInsets.all(16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    widget.testName,
                    style: bodyLargeTestStyle,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            // color: Color(0xff0A0A78).withOpacity(0.2),
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                            blurRadius: 15)
                      ],
                    ),
                    height: AppBar().preferredSize.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " ? Total Question",
                          style: buttonTextStyle.copyWith(
                              color: Color(0xfffd5ca0)),
                        ),
                        Text(
                            arrOfQuestion.isEmpty
                                ? "0"
                                : arrOfQuestion.length.toString(),
                            style: buttonTextStyle.copyWith(
                                color: Color(0xff162129))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.10,
                  ),
                  Text("Instruction"),
                  SizedBox(
                    height: 16,
                  ),
                  widget.modelTestDescription.instruction != null
                      ? Html(
                          data: widget.modelTestDescription.instruction,
                        )
                      : Text("No instruction added.")
                ],
              ),
            ),
      bottomNavigationBar: isLoadingTest
          ? Container(
              height: 1,
              color: Colors.white,
            )
          : Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(24)),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.30,
                  vertical: Platform.isAndroid ? 0 : 24),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                            child: Text(
                          "Start".toUpperCase(),
                          style: buttonTextStyle.copyWith(color: Colors.white),
                        )),
                        Material(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            splashColor: Colors.grey[50],
                            onTap: () {
                              if (widget.testId != "") {
                                ModelTestDescription _modelTestDescription =
                                    ModelTestDescription();
                                _modelTestDescription.id =
                                    int.parse(widget.testId);
                                _modelTestDescription.title = widget.testName;
                                Get.off(ChapterTest(
                                    arrOfQuestion, _modelTestDescription));
                              } else {
                                Get.off(ChapterTest(arrOfQuestion,
                                    widget.modelTestDescription));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }*/

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
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        body: Stack(children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
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
                    child: Stack(
                      children: [
                        SizedBox(
                          width: margin4,
                        ),
                        Material(
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
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            widget.testName.toUpperCase(),
                            textScaleFactor: 1.0,
                            style: textStyle11Bold,
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
                    style: textStyle12Bold,
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
                        )
                      : Text(
                          "No instruction added.",
                          textScaleFactor: 1.0,
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
                          Get.off(ChapterTest(
                              arrOfQuestion, _modelTestDescription));
                        } else {
                          Get.off(ChapterTest(
                              arrOfQuestion, widget.modelTestDescription));
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
        ]));
  }
}
