import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterTest extends StatefulWidget {
  ModelTestDescription modelTestDescription;
  final List<ModelQuestion> arrOfQuestion;
  String testId;

  ChapterTest(this.arrOfQuestion, this.modelTestDescription);

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
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white));

    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Stack(
        children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: Colors.transparent,
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
                    Container(
                      // color: Colors.lightGreenAccent,
                      child: Row(
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
                          Spacer(),
                          Text(
                            _subjectController.selectedSubject.value.name
                                .toUpperCase(),
                            style: textStyle10Bold,
                          ),
                          Spacer(),
                          Material(
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
                          /*Material(
                            color: Colors.transparent,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Image.asset(
                                  ASSETS_ICONS_PATH + 'ic_close.png',
                                  height: iconHeightWidth - 5,
                                  width: iconHeightWidth - 5,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          )*/
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: margin4),
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
                                                        : Color(0xff7FCB4F)),
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
                                child: Icon(Icons.navigate_next),
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
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(margin8),
                            child: Icon(
                              Icons.bookmark_border_outlined,
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
                          onTap: () {},
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
                            ),
                          ),
                          // Spacer(),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: arrOfQuestion[index].answers.length,
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
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            offset: Offset(0, 0),
                                            blurRadius: 10.0,
                                          ),
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
                                              BorderRadius.circular(margin24),
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
                                              arrOfQuestion[index].givenAnswer =
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
                                                      data: arrOfQuestion[index]
                                                          .answers[answerIndex]
                                                          .answer,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ) /*Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: arrOfQuestion[index].answers.map((opt) {
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
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(margin24),
                                          bottomLeft: Radius.circular(margin24),
                                          bottomRight:
                                              Radius.circular(margin24),
                                          topRight: Radius.circular(
                                              margin24), // FLUTTER BUG FIX
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            offset: Offset(0, 0),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: opt.isSelected
                                            ? Color(0xff7FCB4F)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(margin24),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(margin24),
                                          onTap: () {
                                            setState(() {
                                              opt.isSelected = true;
                                            });
                                            _bottomSheet(context);
                                            // nextPage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Text(
                                                      opt.answer,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .body2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList(),
                            )*/
                            ,
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
                    margin: EdgeInsets.only(bottom: Platform.isAndroid ? 0 : 0),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                        /*Expanded(
                          child: Center(
                            child: Material(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24),
                              child: InkWell(
                                splashColor: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _confirmSubmit(context));
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
                                        'Submit Test'.toUpperCase(),
                                        style: textStyle9Bold.copyWith(
                                            color: Color(0xffFD5CA0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )*/
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
    );
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
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                      // textAlign: TextAlign.center,
                      style: textStyle12Bold.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  margin: EdgeInsets.only(top: margin20),
                  child: Center(
                    child: Text(
                      "Are you sure, you want to submit this test?",
                      textAlign: TextAlign.center,
                      style: textStyle10.copyWith(fontSize: Get.width * 0.05),
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
      /* actions: <Widget>[
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("cc"),
            )
            */ /*new FlatButton(
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop('dialog');
                _testController.submitChapterTest(
                    widget.modelTestDescription.id.toString(),
                    arrOfQuestion,
                    widget.modelTestDescription);
              },
              textColor: Colors.black,
              child: const Text('YES'),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              textColor: Colors.red,
              child: const Text('NO'),
            ),*/ /*
          ],
        ),
        */ /* new FlatButton(
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            _testController.submitChapterTest(
                widget.modelTestDescription.id.toString(),
                arrOfQuestion,
                widget.modelTestDescription);
          },
          textColor: Colors.black,
          child: const Text('YES'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          textColor: Colors.red,
          child: const Text('NO'),
        ),*/ /*
      ],*/
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

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          */ /*Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill))),*/ /*
          */ /*Scaffold(
            backgroundColor: Colors.transparent,
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
                    height: Get.height - (AppBar().preferredSize.height),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: AppBar().preferredSize.height * 2,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close_rounded,
                              size: 35,
                            ),
                          ),
                          Expanded(
                            child: AnimatedProgressbar(
                                value: animatedProgressValue),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: arrOfQuestion.length,
                          controller: controller,
                          onPageChanged: (index) {
                            currentIndex = index;
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ListView(
                              shrinkWrap: true,
                              children: [
                                */ /* */ /*SizedBox(
                                  height: Get.height * 0.03,
                                ),*/ /* */ /*
                                Container(
                                  padding: EdgeInsets.all(16),
                                  alignment: Alignment.center,
                                  child: Text(arrOfQuestion[index].question),
                                ),
                                // Spacer(),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children:
                                        arrOfQuestion[index].answers.map((opt) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: Get.height * 0.03),
                                        child: Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey[300],
                                                  blurRadius: 1,
                                                  offset: Offset(0.5, 1),
                                                  spreadRadius: 1)
                                            ]),
                                            child: Material(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: InkWell(
                                                onTap: () {
                                                  // _bottomSheet(context);
                                                  nextPage();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(16),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.crop_square,
                                                        size: 30,
                                                        color: Colors.grey,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 16),
                                                          child: Text(
                                                            opt.answer
                                                                .toUpperCase(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .body2,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
          )*/ /*
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 16,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient:
                        _subjectController.selectedSubject.value.id == null
                            ? LinearGradient(
                                colors: [Color(0xff14C269), Color(0xff0A0A78)],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                            : LinearGradient(
                                colors: [
                                  HexColor.fromHex(_subjectController
                                      .selectedSubject.value.color1),
                                  HexColor.fromHex(_subjectController
                                      .selectedSubject.value.color2)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )),
              ),
              actions: [
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Text(
                          "End".toUpperCase(),
                          style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
              title: Text(widget.modelTestDescription.title.toString()),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Get.height * 0.04),
                child: */ /*AnimatedProgressbar(value: animatedProgressValue)*/ /* Container(
                  // color: Colors.white,
                  margin: EdgeInsets.only(left: 16, bottom: 8),
                  height: Get.height * 0.03,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      itemCount: arrOfQuestion.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: Get.height * 0.02,
                              width: Get.height * 0.02,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: arrOfQuestion[index].isSelected
                                        ? Colors.white
                                        : Colors.white38,
                                  )),
                            ),
                            index < arrOfQuestion.length - 1
                                ? Container(
                                    width: 10,
                                    color: arrOfQuestion[index].isSelected
                                        ? Colors.white
                                        : Colors.white38,
                                    height: 1,
                                  )
                                : Container()
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: arrOfQuestion.length,
                    controller: controller,
                    onPageChanged: (index) {
                      currentIndex = index;
                      setState(() {
                        arrOfQuestion[index].isSelected = true;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          */ /*SizedBox(
                            height: Get.height * 0.05,
                          ),*/ /*
                          Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Html(
                              data: arrOfQuestion[index].question,
                            ) */ /*Text(
                              arrOfQuestion[index].question,
                              style: titleTextStyle.copyWith(fontSize: 18),
                            )*/ /*
                            ,
                          ),
                          // Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: arrOfQuestion[index].answers.length,
                              itemBuilder: (context, optionIndex) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: Get.height * 0.03),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            boxShadow,
                                          ],
                                          gradient: arrOfQuestion[index]
                                                  .answers[optionIndex]
                                                  .isSelected
                                              ? _subjectController
                                                          .selectedSubject
                                                          .value
                                                          .id ==
                                                      null
                                                  ? LinearGradient(
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                          Color(0xff14C269),
                                                          Color(0xff0A0A78),
                                                        ])
                                                  : LinearGradient(
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                          HexColor.fromHex(
                                                              _subjectController
                                                                  .selectedSubject
                                                                  .value
                                                                  .color2),
                                                          HexColor.fromHex(
                                                              _subjectController
                                                                  .selectedSubject
                                                                  .value
                                                                  .color1),
                                                        ])
                                              : LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                      Color(0xffFFFFFF),
                                                      Color(0xffFFFFFF),
                                                    ])),
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              for (int i = 0;
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
                                                  .answers[optionIndex]
                                                  .isSelected = true;
                                            });
                                            arrOfQuestion[index].givenAnswer =
                                                arrOfQuestion[index]
                                                    .answers[optionIndex]
                                                    .id;
                                            // _bottomSheet(context, index, optionIndex);
                                            // nextPage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                arrOfQuestion[index]
                                                        .answers[optionIndex]
                                                        .isSelected
                                                    ? Icon(
                                                        Icons.check_box,
                                                        size: 30,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons.crop_square,
                                                        size: 30,
                                                        color: Colors.grey,
                                                      ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Html(
                                                      data: arrOfQuestion[index]
                                                          .answers[optionIndex]
                                                          .answer,
                                                    ) */ /*Text(
                                                      arrOfQuestion[index]
                                                          .answers[optionIndex]
                                                          .answer,
                                                      style: TextStyle(
                                                          color: arrOfQuestion[
                                                                      index]
                                                                  .answers[
                                                                      optionIndex]
                                                                  .isSelected
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )*/ /*
                                                    ,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ) */ /*Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: arrOfQuestion[index].answers.map((opt) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: Get.height * 0.03),
                                  child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 1,
                                            offset: Offset(0.5, 1),
                                            spreadRadius: 1)
                                      ]),
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          onTap: () {
                                            _bottomSheet(context, index);
                                            // nextPage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.crop_square,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Text(
                                                      opt.answer,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .body2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList(),
                            )*/ /*
                            ,
                          ),
                        ],
                      );
                    },
                  ),
                )
                */ /*Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: arrOfQuestion.length,
                    controller: controller,
                    onPageChanged: (index) {
                      currentIndex = index;
                      setState(() {
                        arrOfQuestion[index].isSelected = true;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Text(arrOfQuestion[index].question),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: arrOfQuestion[index].answers.map((opt) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: Get.height * 0.03),
                                  child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 1,
                                            offset: Offset(0.5, 1),
                                            spreadRadius: 1)
                                      ]),
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          onTap: () {
                                            _bottomSheet(context);
                                            // nextPage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.crop_square,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Text(
                                                      opt.answer,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .body2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          )
                        ],
                      );
                    },
                  ),
                )*/ /*
              ],
            ),
            bottomNavigationBar: isLoadingTest
                ? Container(
                    height: 0,
                  )
                : Container(
                    height: Get.height * 0.06,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        */ /*Material(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = currentIndex - 1;
                            controller.animateToPage(currentIndex,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.ease);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: Get.width * 0.04,
                            color: Colors.black,
                          ),
                        )),
                    color: Colors.transparent,
                    type: MaterialType.circle,
                  ),*/ /*
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              */ /*setState(() {
                          currentIndex = currentIndex + 1;
                        });
                        await controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );*/ /*
                              previousPage();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                currentIndex == 0
                                    ? ''
                                    : 'PREVIOUS'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              nextPage();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Text(
                                currentIndex == arrOfQuestion.length - 1
                                    ? 'Submit'.toUpperCase()
                                    : 'Next'.toUpperCase(),
                                style: new TextStyle(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xfffd5ca0)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ) */ /*Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color1),
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color2),
                      ]),
                  borderRadius: BorderRadius.circular(24)),
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
                          "Next".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.grey[50],
                            onTap: () {
                              nextPage();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )*/ /*
            ,
          )
        ],
      ),
    );
  }*/
