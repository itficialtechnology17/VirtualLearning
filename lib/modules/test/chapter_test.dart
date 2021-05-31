import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/page/report_question.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterTest extends StatefulWidget {
  ModelTestDescription modelTestDescription;
  final List<ModelQuestion> arrOfQuestion;
  String testId;
  String testName;

  ChapterTest(this.arrOfQuestion, this.modelTestDescription, this.testName);

  @override
  State<StatefulWidget> createState() {
    return _StateChapterTest();
  }
}

class _StateChapterTest extends State<ChapterTest> {
  List<ModelQuestion> arrOfQuestion = List<ModelQuestion>();

  final PageController controller = PageController();

  var animatedProgressValue = 0.0;
  var currentIndex = 0;

  var isLoadingTest = false;
  ThemeController _themeController = Get.find();
  TestController _testController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    arrOfQuestion = widget.arrOfQuestion;
    clearSelection();
    arrOfQuestion[0].isSelected = true;
  }

  void clearSelection() {
    for (int i = 0; i < arrOfQuestion.length; i++) {
      arrOfQuestion[i].isSelected = false;
      for (int j = 0; j < arrOfQuestion[i].answers.length; j++) {
        arrOfQuestion[i].answers[j].isSelected = false;
      }
    }
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
          body: Stack(
            children: [
              /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
              Scaffold(
                backgroundColor: _themeController.background.value,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      AppBar().preferredSize.height + Get.height * 0.056),
                  child: Container(
                    // color: Colors.yellow,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
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
                                  widget.testName.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Material(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.transparent,
                                  // type: MaterialType.circle,
                                  child: InkWell(
                                    onTap: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              _confirmSubmit(context));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Text(
                                        "Submit".toUpperCase(),
                                        style: textStyle9Bold.copyWith(
                                            color: Color(0xff00B4FF)),
                                      ) /*Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                    size: iconHeightWidth,
                                  )*/
                                      ,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.06,
                          width: Get.width,
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              SizedBox(
                                width: margin8,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: arrOfQuestion.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: margin4),
                                      child: Material(
                                        type: MaterialType.circle,
                                        color: currentIndex == index
                                            ? Color(0xff7FCB4F)
                                            : Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            setSelectedQuestion(index);
                                            if (index != currentIndex) {
                                              await controller.animateToPage(
                                                index,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeOut,
                                              );
                                            }
                                          },
                                          child: Container(
                                            height: Get.height * 0.06,
                                            padding: EdgeInsets.all(margin8),
                                            child: Center(
                                              child: Text(
                                                "" + (index + 1).toString(),
                                                style: textStyle9Bold.copyWith(
                                                    color: currentIndex == index
                                                        ? Colors.white
                                                        : arrOfQuestion[index]
                                                                    .givenAnswer ==
                                                                -1
                                                            ? Colors.grey
                                                            : Color(
                                                                0xff7FCB4F)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: _themeController.iconColor.value,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 2,
                      margin: EdgeInsets.symmetric(horizontal: margin8),
                      color: Color(0xffE9E9E9),
                    ),
                    Container(
                      // color: Colors.lightGreenAccent,
                      child: Row(
                        children: [
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                if (arrOfQuestion[currentIndex].isBookmark ==
                                    0) {
                                  _testController.setQuestionBookmark(
                                      arrOfQuestion[currentIndex].id.toString(),
                                      "chapter");
                                  setState(() {
                                    arrOfQuestion[currentIndex].isBookmark = 1;
                                  });
                                } else {
                                  _testController.setQuestionBookmark(
                                      arrOfQuestion[currentIndex]
                                          .isBookmark
                                          .toString(),
                                      "chapter");
                                  setState(() {
                                    arrOfQuestion[currentIndex].isBookmark = 0;
                                  });
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Icon(
                                  arrOfQuestion[currentIndex].isBookmark == 0
                                      ? Icons.bookmark_border_outlined
                                      : Icons.bookmark,
                                  color: Color(0xff7FCB4F),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                Get.to(ReportQuestion(
                                    _subjectController.selectedSubject.value,
                                    arrOfQuestion[currentIndex],
                                    "Chapter"));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Image.asset(
                                  ASSETS_ICONS_PATH + 'ic_report.png',
                                  height: iconHeightWidth,
                                  width: iconHeightWidth,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: arrOfQuestion.length,
                        controller: controller,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                            setSelectedQuestion(index);
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ListView(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: Html(
                                    data: arrOfQuestion[index].question,
                                    style: {
                                      "body": Style(
                                          color:
                                              _themeController.textColor.value,
                                          fontFamily: "Nunito"),
                                    }),
                              ),
                              // Spacer(),
                              Container(
                                padding: EdgeInsets.all(20),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      arrOfQuestion[index].answers.length,
                                  itemBuilder: (context, answerIndex) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          bottom: Get.height * 0.03),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(margin24),
                                            boxShadow: <BoxShadow>[
                                              !_themeController
                                                      .isDarkTheme.value
                                                  ? BoxShadow(
                                                      color: Colors.grey[300],
                                                      offset: Offset(0, 0),
                                                      blurRadius: 10.0,
                                                    )
                                                  : BoxShadow(),
                                            ],
                                          ),
                                          child: Material(
                                            color: arrOfQuestion[index]
                                                    .answers[answerIndex]
                                                    .isSelected
                                                ? Color(0xff7FCB4F)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(margin24),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      margin24),
                                              onTap: () {
                                                setState(() {
                                                  for (var i = 0;
                                                      i <
                                                          arrOfQuestion[index]
                                                              .answers
                                                              .length;
                                                      i++) {
                                                    arrOfQuestion[index]
                                                        .answers[i]
                                                        .isSelected = false;
                                                  }
                                                  arrOfQuestion[index]
                                                      .answers[answerIndex]
                                                      .isSelected = true;
                                                  arrOfQuestion[index]
                                                          .givenAnswer =
                                                      arrOfQuestion[index]
                                                          .answers[answerIndex]
                                                          .id;
                                                });
                                                // _bottomSheet(context);
                                                // nextPage();
                                              },
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 16),
                                                        child: Html(
                                                            data: arrOfQuestion[
                                                                    index]
                                                                .answers[
                                                                    answerIndex]
                                                                .answer,
                                                            style: {
                                                              "body": Style(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Nunito"),
                                                            }),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: isLoadingTest
                    ? SizedBox.shrink()
                    : Container(
                        height: Get.height * 0.07,
                        width: Get.width,
                        margin:
                            EdgeInsets.only(bottom: Platform.isAndroid ? 0 : 0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Material(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.transparent,
                                  // type: MaterialType.circle,
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        if (currentIndex != 0)
                                          currentIndex = currentIndex - 1;
                                      });
                                      previousPage();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Text(
                                        currentIndex == 0
                                            ? ''
                                            : 'PREVIOUS'.toUpperCase(),
                                        style: textStyle9Bold.copyWith(
                                            color: Color(0xff7FCB4F)),
                                      ) /*Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                    size: iconHeightWidth,
                                  )*/
                                      ,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Material(
                                  color: Colors.transparent,
                                  // type: MaterialType.circle,
                                  child: InkWell(
                                    onTap: () async {
                                      nextPage();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Text(
                                        'Next'.toUpperCase(),
                                        style: textStyle9Bold.copyWith(
                                            color: Color(0xffFD5CA0)),
                                      ) /*Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: iconHeightWidth,
                                  )*/
                                      ,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              )
            ],
          ),
        ));
  }

  void previousPage() async {
    setState(() {
      arrOfQuestion[currentIndex].isSelected = false;
    });
    await controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void nextPage() async {
    if (currentIndex == arrOfQuestion.length - 1) {
      showDialog(
          context: context, builder: (context) => _confirmSubmit(context));
    } else {
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  _confirmSubmit(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: new Container(
        decoration: BoxDecoration(
            color: _themeController.background.value,
            borderRadius: BorderRadius.circular(margin4)),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: Get.height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(4))),
                  child: Center(
                    child: Text(
                      "Submit Test ?",
                      style: textStyle12Bold.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: _themeController.background.value,
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  margin: EdgeInsets.only(top: margin20),
                  child: Center(
                    child: Text(
                      "Are you sure, you want to submit this test?",
                      textAlign: TextAlign.center,
                      style: textStyle10.copyWith(
                          fontSize: Get.width * 0.05,
                          color: _themeController.isDarkTheme.value
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: margin20, bottom: margin20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xff7FCB4F),
                        type: MaterialType.circle,
                        child: InkWell(
                          onTap: () async {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            _testController.submitChapterTest(
                                widget.modelTestDescription.id.toString(),
                                arrOfQuestion,
                                widget.modelTestDescription);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(margin8),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: iconHeightWidth,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: margin16,
                      ),
                      Material(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xffFD5C5C),
                        type: MaterialType.circle,
                        child: InkWell(
                          onTap: () async {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(margin8),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: iconHeightWidth,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void setSelectedQuestion(int index) {
    setState(() {
      for (var i = 0; i < arrOfQuestion.length; i++) {
        if (i == currentIndex) {
          setState(() {
            arrOfQuestion[index].isSelected = true;
          });
        } else {
          setState(() {
            arrOfQuestion[index].isSelected = false;
          });
        }
      }
    });
  }
}
