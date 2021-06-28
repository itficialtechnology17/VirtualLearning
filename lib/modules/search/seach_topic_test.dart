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
import 'package:virtual_learning/model/model_search_topic.dart';
import 'package:virtual_learning/page/report_question.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class SearchTopicTest extends StatefulWidget {
  ModelSearchTopic modelSearchTopic;

  SearchTopicTest(this.modelSearchTopic);

  @override
  State<StatefulWidget> createState() {
    return _StateTopicTest();
  }
}

class _StateTopicTest extends State<SearchTopicTest> {
  ThemeController _themeController = Get.find();
  final PageController controller = PageController();

  var animatedProgressValue = 0.0;
  var currentIndex = 0;
  var isOptionSelected = false;
  // var isSolutionVisible = false;

  // List<ModelQuestion> arrOfQuestion;
  List<ModelQuestion> arrOfQuestion = List<ModelQuestion>();
  SubjectController _subjectController = Get.find();
  TestController _testController = Get.find();

  @override
  void initState() {
    // setAnimatedProgressValue();
    super.initState();
    arrOfQuestion = widget.modelSearchTopic.content.question;
    clearSelection();
    setState(() {
      arrOfQuestion[0].isSelected = true;
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
                        Container(
                          // color: Colors.lightGreenAccent,
                          child: Row(
                            children: [
                              SizedBox(
                                width: margin8,
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
                                      color: _themeController.iconColor.value,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: margin16,
                              ),
                              Expanded(
                                child: Text(
                                  widget.modelSearchTopic.name,
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
                                ),
                              ),
                              SizedBox(
                                width: margin8,
                              )
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
                                                style: textStyle10Bold.copyWith(
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
                              onTap: () {
                                if (arrOfQuestion[currentIndex].isBookmark ==
                                    0) {
                                  _testController.setQuestionBookmark(
                                      arrOfQuestion[currentIndex].id.toString(),
                                      "topic");
                                  setState(() {
                                    arrOfQuestion[currentIndex].isBookmark = 1;
                                  });
                                } else {
                                  _testController.setQuestionBookmark(
                                      arrOfQuestion[currentIndex]
                                          .isBookmark
                                          .toString(),
                                      "topic");
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
                                    "Topic"));
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
                                            color: _themeController
                                                .textColor.value,
                                            fontFamily: "Nunito"),
                                      })),
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
                                                    .isSolutionVisible
                                                ? arrOfQuestion[index]
                                                            .answers[
                                                                answerIndex]
                                                            .isRight ==
                                                        1
                                                    ? Colors.green
                                                    : arrOfQuestion[index]
                                                                .givenAnswer ==
                                                            arrOfQuestion[index]
                                                                .answers[
                                                                    answerIndex]
                                                                .id
                                                        ? Colors.red
                                                        : Colors.white
                                                : arrOfQuestion[index]
                                                        .answers[answerIndex]
                                                        .isSelected
                                                    ? Color(0xff17212A)
                                                    : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(margin24),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      margin24),
                                              onTap: () {
                                                setState(() {
                                                  if (!arrOfQuestion[index]
                                                      .isSolutionVisible) {
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
                                                    isOptionSelected = true;
                                                    arrOfQuestion[index]
                                                        .answers[answerIndex]
                                                        .isSelected = true;
                                                    arrOfQuestion[index]
                                                            .givenAnswer =
                                                        arrOfQuestion[index]
                                                            .answers[
                                                                answerIndex]
                                                            .id;
                                                  }
                                                });
                                                // _bottomSheet(context);
                                                // nextPage();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: margin2),
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
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: arrOfQuestion[
                                                                              index]
                                                                          .isSolutionVisible
                                                                      ? arrOfQuestion[index].answers[answerIndex].isRight ==
                                                                              1
                                                                          ? Colors
                                                                              .white
                                                                          : arrOfQuestion[index].givenAnswer == arrOfQuestion[index].answers[answerIndex].id
                                                                              ? Colors.white
                                                                              : Colors.black
                                                                      : arrOfQuestion[index].answers[answerIndex].isSelected
                                                                          ? Colors.white
                                                                          : Colors.black),
                                                            }),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: margin16,
                                                    ),
                                                    arrOfQuestion[index]
                                                            .isSolutionVisible
                                                        ? arrOfQuestion[index]
                                                                    .answers[
                                                                        answerIndex]
                                                                    .isRight ==
                                                                1
                                                            ? Image.asset(
                                                                "assets/icons/ic_right.png",
                                                                width:
                                                                    iconHeightWidth -
                                                                        5,
                                                                height:
                                                                    iconHeightWidth -
                                                                        5,
                                                              )
                                                            : arrOfQuestion[index]
                                                                        .givenAnswer ==
                                                                    arrOfQuestion[
                                                                            index]
                                                                        .answers[
                                                                            answerIndex]
                                                                        .id
                                                                ? Image.asset(
                                                                    "assets/icons/ic_wrong.png",
                                                                    width:
                                                                        iconHeightWidth -
                                                                            5,
                                                                    height:
                                                                        iconHeightWidth -
                                                                            5,
                                                                  )
                                                                : SizedBox
                                                                    .shrink()
                                                        : SizedBox.shrink(),
                                                    SizedBox(
                                                      width: margin16,
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
                              arrOfQuestion[index].isSolutionVisible
                                  ? arrOfQuestion[index].solution == null
                                      ? SizedBox.shrink()
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xff38AF48)
                                                  .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      margin8),
                                              border: Border.all(
                                                  color: Color(0xff38AF48))),
                                          padding: EdgeInsets.all(margin16),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: margin16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Solution:",
                                                style: textStyle10Bold.copyWith(
                                                    color: Color(0xff22813D)),
                                              ),
                                              SizedBox(
                                                height: margin8,
                                              ),
                                              Html(
                                                  data: arrOfQuestion[index]
                                                      .solution,
                                                  style: {
                                                    "body": Style(
                                                        color: _themeController
                                                            .textColor.value),
                                                  })
                                            ],
                                          ),
                                        )
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: margin16,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: Container(
                  height: Get.height * 0.05,
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
                                padding: EdgeInsets.all(margin4),
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
                                if (!isOptionSelected) {
                                  nextPage();
                                } else {
                                  if (arrOfQuestion[currentIndex]
                                      .isSolutionVisible) {
                                    isOptionSelected = false;
                                    nextPage();
                                  } else {
                                    setState(() {
                                      arrOfQuestion[currentIndex]
                                          .isSolutionVisible = true;
                                    });
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(margin4),
                                child: Text(
                                  !isOptionSelected
                                      ? "Skip".toUpperCase()
                                      : arrOfQuestion[currentIndex]
                                              .isSolutionVisible
                                          ? 'Next'.toUpperCase()
                                          : "Check".toUpperCase(),
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
      Get.back();
      // showDialog(
      //     context: context, builder: (context) => _confirmSubmit(context));
    } else {
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         /*Container(
  //             decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/images/ic_bg.png"),
  //                     fit: BoxFit.fill))),*/
  //         Scaffold(
  //             backgroundColor: Colors.white,
  //             appBar: AppBar(
  //               /* leading: InkWell(
  //               onTap: () {
  //               },
  //               child: Icon(
  //                 Icons.close_rounded,
  //                 size: 25,
  //               ),
  //             ),*/
  //               // leading: Container(),
  //               automaticallyImplyLeading: false,
  //               titleSpacing: 16,
  //               flexibleSpace: Container(
  //                 decoration: BoxDecoration(
  //                     gradient: LinearGradient(
  //                   colors: [
  //                     HexColor.fromHex(
  //                         _subjectController.selectedSubject.value.color1),
  //                     HexColor.fromHex(
  //                         _subjectController.selectedSubject.value.color2),
  //                   ],
  //                   begin: Alignment.bottomLeft,
  //                   end: Alignment.topRight,
  //                 )),
  //               ),
  //               actions: [
  //                 Center(
  //                   child: Material(
  //                     color: Colors.transparent,
  //                     child: InkWell(
  //                       onTap: () {
  //                         Get.back();
  //                       },
  //                       child: Padding(
  //                         padding:
  //                             EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                         child: Text(
  //                           "End",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 16,
  //                 ),
  //               ],
  //               title: Text(widget.modelTopic.name.toString()),
  //               bottom: PreferredSize(
  //                 preferredSize: Size.fromHeight(Get.height * 0.04),
  //                 child: /*AnimatedProgressbar(value: animatedProgressValue)*/ Container(
  //                   // color: Colors.white,
  //                   margin: EdgeInsets.only(left: 16, bottom: 8),
  //                   height: Get.height * 0.03,
  //                   child: Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: ListView.builder(
  //                       itemCount: arrOfQuestion.length,
  //                       scrollDirection: Axis.horizontal,
  //                       itemBuilder: (context, index) {
  //                         return Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Container(
  //                               height: Get.height * 0.02,
  //                               width: Get.height * 0.02,
  //                               decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   border: Border.all(
  //                                     color: arrOfQuestion[index].isSelected
  //                                         ? Colors.white
  //                                         : Colors.grey,
  //                                   )),
  //                             ),
  //                             index < arrOfQuestion.length - 1
  //                                 ? Container(
  //                                     width: 10,
  //                                     color: arrOfQuestion[index].isSelected
  //                                         ? Colors.white
  //                                         : Colors.grey,
  //                                     height: 1,
  //                                   )
  //                                 : Container()
  //                           ],
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             body: Column(
  //               children: [
  //                 Expanded(
  //                   child: PageView.builder(
  //                     physics: NeverScrollableScrollPhysics(),
  //                     scrollDirection: Axis.horizontal,
  //                     itemCount: arrOfQuestion.length,
  //                     controller: controller,
  //                     onPageChanged: (index) {
  //                       currentIndex = index;
  //                       setState(() {
  //                         arrOfQuestion[index].isSelected = true;
  //                       });
  //                     },
  //                     itemBuilder: (BuildContext context, int index) {
  //                       return ListView(
  //                         shrinkWrap: true,
  //                         children: [
  //                           /*SizedBox(
  //                           height: Get.height * 0.05,
  //                         ),*/
  //                           Container(
  //                             padding: EdgeInsets.all(16),
  //                             alignment: Alignment.center,
  //                             child: Html(
  //                               data: arrOfQuestion[index].question,
  //                             ), /*Text(
  //                             arrOfQuestion[index].question,
  //                             style: titleTextStyle.copyWith(
  //                                 fontSize: Get.width * 0.05,
  //                                 fontWeight: FontWeight.w400),
  //                           )*/
  //                           ),
  //                           // Spacer(),
  //                           Container(
  //                             padding: EdgeInsets.symmetric(
  //                               horizontal: 16,
  //                             ),
  //                             child: ListView.builder(
  //                               shrinkWrap: true,
  //                               physics: NeverScrollableScrollPhysics(),
  //                               itemCount: arrOfQuestion[index].answers.length,
  //                               itemBuilder: (context, optionIndex) {
  //                                 return Container(
  //                                   margin: EdgeInsets.only(
  //                                       bottom: Get.height * 0.03),
  //                                   child: Container(
  //                                       decoration: BoxDecoration(
  //                                           borderRadius:
  //                                               BorderRadius.circular(16),
  //                                           boxShadow: [
  //                                             boxShadow,
  //                                           ],
  //                                           gradient: arrOfQuestion[index]
  //                                                   .answers[optionIndex]
  //                                                   .isSelected
  //                                               ? LinearGradient(
  //                                                   begin: Alignment.bottomLeft,
  //                                                   end: Alignment.topRight,
  //                                                   colors: [
  //                                                       HexColor.fromHex(
  //                                                           _subjectController
  //                                                               .selectedSubject
  //                                                               .value
  //                                                               .color2),
  //                                                       HexColor.fromHex(
  //                                                           _subjectController
  //                                                               .selectedSubject
  //                                                               .value
  //                                                               .color1),
  //                                                     ])
  //                                               : LinearGradient(
  //                                                   begin: Alignment.bottomLeft,
  //                                                   end: Alignment.topRight,
  //                                                   colors: [
  //                                                       Color(0xffFFFFFF),
  //                                                       Color(0xffFFFFFF),
  //                                                     ])),
  //                                       child: Material(
  //                                         color: Colors.transparent,
  //                                         borderRadius:
  //                                             BorderRadius.circular(4),
  //                                         child: InkWell(
  //                                           onTap: () {
  //                                             setState(() {
  //                                               for (int i = 0;
  //                                                   i <
  //                                                       arrOfQuestion[index]
  //                                                           .answers
  //                                                           .length;
  //                                                   i++) {
  //                                                 arrOfQuestion[index]
  //                                                     .answers[i]
  //                                                     .isSelected = false;
  //                                               }
  //                                               arrOfQuestion[index]
  //                                                   .answers[optionIndex]
  //                                                   .isSelected = true;
  //                                             });
  //                                             _bottomSheet(
  //                                                 context, index, optionIndex);
  //                                             // nextPage();
  //                                           },
  //                                           child: Container(
  //                                             padding: EdgeInsets.all(16),
  //                                             child: Row(
  //                                               children: [
  //                                                 arrOfQuestion[index]
  //                                                         .answers[optionIndex]
  //                                                         .isSelected
  //                                                     ? Icon(
  //                                                         Icons.check_box,
  //                                                         size: 30,
  //                                                         color: Colors.white,
  //                                                       )
  //                                                     : Icon(
  //                                                         Icons.crop_square,
  //                                                         size: 30,
  //                                                         color: Colors.grey,
  //                                                       ),
  //                                                 Expanded(
  //                                                   child: Container(
  //                                                     margin: EdgeInsets.only(
  //                                                         left: 16),
  //                                                     child: Html(
  //                                                       data:
  //                                                           arrOfQuestion[index]
  //                                                               .answers[
  //                                                                   optionIndex]
  //                                                               .answer,
  //                                                     ) /*Text(
  //                                                     arrOfQuestion[index]
  //                                                         .answers[optionIndex]
  //                                                         .answer,
  //                                                     style: TextStyle(
  //                                                         color: arrOfQuestion[
  //                                                                     index]
  //                                                                 .answers[
  //                                                                     optionIndex]
  //                                                                 .isSelected
  //                                                             ? Colors.white
  //                                                             : Colors.black,
  //                                                         fontSize: 16,
  //                                                         fontWeight:
  //                                                             FontWeight.w500),
  //                                                   )*/
  //                                                     ,
  //                                                   ),
  //                                                 )
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       )),
  //                                 );
  //                               },
  //                             ) /*Column(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: arrOfQuestion[index].answers.map((opt) {
  //                               return Container(
  //                                 margin: EdgeInsets.only(
  //                                     bottom: Get.height * 0.03),
  //                                 child: Container(
  //                                     decoration: BoxDecoration(boxShadow: [
  //                                       BoxShadow(
  //                                           color: Colors.grey[300],
  //                                           blurRadius: 1,
  //                                           offset: Offset(0.5, 1),
  //                                           spreadRadius: 1)
  //                                     ]),
  //                                     child: Material(
  //                                       color: Colors.white,
  //                                       borderRadius: BorderRadius.circular(4),
  //                                       child: InkWell(
  //                                         onTap: () {
  //                                           _bottomSheet(context, index);
  //                                           // nextPage();
  //                                         },
  //                                         child: Container(
  //                                           padding: EdgeInsets.all(16),
  //                                           child: Row(
  //                                             children: [
  //                                               Icon(
  //                                                 Icons.crop_square,
  //                                                 size: 30,
  //                                                 color: Colors.grey,
  //                                               ),
  //                                               Expanded(
  //                                                 child: Container(
  //                                                   margin: EdgeInsets.only(
  //                                                       left: 16),
  //                                                   child: Text(
  //                                                     opt.answer,
  //                                                     style: Theme.of(context)
  //                                                         .textTheme
  //                                                         .body2,
  //                                                   ),
  //                                                 ),
  //                                               )
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     )),
  //                               );
  //                             }).toList(),
  //                           )*/
  //                             ,
  //                           ),
  //                         ],
  //                       );
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //             bottomNavigationBar: Container(
  //               height: Get.height * 0.06,
  //               width: Get.width,
  //               padding: EdgeInsets.symmetric(horizontal: 8),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black,
  //                     blurRadius: 2.0,
  //                     spreadRadius: 0.0,
  //                     offset:
  //                         Offset(2.0, 2.0), // shadow direction: bottom right
  //                   )
  //                 ],
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   /*Material(
  //                   child: InkWell(
  //                       onTap: () {
  //                         setState(() {
  //                           currentIndex = currentIndex - 1;
  //                           controller.animateToPage(currentIndex,
  //                               duration: Duration(milliseconds: 400),
  //                               curve: Curves.ease);
  //                         });
  //                       },
  //                       child: Padding(
  //                         padding: EdgeInsets.all(10),
  //                         child: Icon(
  //                           Icons.arrow_back_ios_outlined,
  //                           size: Get.width * 0.04,
  //                           color: Colors.black,
  //                         ),
  //                       )),
  //                   color: Colors.transparent,
  //                   type: MaterialType.circle,
  //                 ),*/
  //                   Spacer(),
  //                   Material(
  //                     color: Colors.transparent,
  //                     child: InkWell(
  //                       onTap: () {
  //                         nextPage();
  //                       },
  //                       child: Padding(
  //                         padding:
  //                             EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                         child: Text(
  //                           currentIndex == arrOfQuestion.length - 1
  //                               ? 'Submit'.toUpperCase()
  //                               : 'Skip'.toUpperCase(),
  //                           style: new TextStyle(
  //                               fontSize: Get.width * 0.04,
  //                               fontWeight: FontWeight.w500,
  //                               color: Colors.grey),
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ))
  //       ],
  //     ),
  //   );
  // }

  // _bottomSheet(BuildContext context, int index, int optionIndex) {
  //   showModalBottomSheet(
  //     context: context,
  //     isDismissible: false,
  //     enableDrag: false,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(16.0),
  //     ),
  //     builder: (BuildContext context) {
  //       return Container(
  //         constraints: BoxConstraints(minHeight: 250, maxHeight: 400),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(16), topRight: Radius.circular(16))),
  //         padding: EdgeInsets.all(16),
  //         child: Container(
  //           child: ListView(
  //             shrinkWrap: true,
  //             children: <Widget>[
  //               Center(
  //                 child: Lottie.asset(
  //                     arrOfQuestion[index].answers[optionIndex].isRight == 1
  //                         ? 'assets/json/ic_right_answer.json'
  //                         : 'assets/json/ic_wrong_answer.json',
  //                     width: Get.width * 0.20,
  //                     height: Get.width * 0.20,
  //                     repeat: false),
  //               ),
  //               SizedBox(
  //                 height: 16,
  //               ),
  //               Center(
  //                 child: Text(
  //                   "Solution",
  //                   style: titleTextStyle.copyWith(fontSize: 18),
  //                 ),
  //               ),
  //               Center(
  //                 child: Text(
  //                   arrOfQuestion[index].solution != null
  //                       ? arrOfQuestion[index].solution
  //                       : "",
  //                   textAlign: TextAlign.center,
  //                   style: titleTextStyle.copyWith(fontWeight: FontWeight.w400),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 16,
  //               ),
  //               Container(
  //                 height: Get.height * 0.06,
  //                 decoration: BoxDecoration(
  //                     gradient: LinearGradient(
  //                         begin: Alignment.bottomLeft,
  //                         end: Alignment.topRight,
  //                         colors: [
  //                           HexColor.fromHex(_subjectController
  //                               .selectedSubject.value.color1),
  //                           HexColor.fromHex(_subjectController
  //                               .selectedSubject.value.color2),
  //                         ]),
  //                     borderRadius: BorderRadius.circular(24)),
  //                 margin: EdgeInsets.symmetric(
  //                     horizontal: Get.width * 0.30,
  //                     vertical: Platform.isAndroid ? 0 : 24),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: Stack(
  //                         fit: StackFit.expand,
  //                         children: [
  //                           Center(
  //                               child: Text(
  //                             "Next".toUpperCase(),
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.w600),
  //                           )),
  //                           Material(
  //                             color: Colors.transparent,
  //                             child: InkWell(
  //                               splashColor: Colors.grey[50],
  //                               onTap: () {
  //                                 arrOfQuestion[index].givenAnswer =
  //                                     arrOfQuestion[index]
  //                                         .answers[optionIndex]
  //                                         .id;
  //                                 Navigator.pop(context);
  //                                 nextPage();
  //                               },
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // _bottomSheet(BuildContext context, int index, int optionIndex) {
  //   showModalBottomSheet(
  //     context: context,
  //     isDismissible: false,
  //     enableDrag: false,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(16.0),
  //     ),
  //     builder: (BuildContext context) {
  //       return Container(
  //         constraints: BoxConstraints(minHeight: 250, maxHeight: 300),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(16), topRight: Radius.circular(16))),
  //         padding: EdgeInsets.all(16),
  //         child: Container(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Lottie.asset(
  //                   arrOfQuestion[index].answers[optionIndex].isRight == 1
  //                       ? 'assets/json/ic_right_answer.json'
  //                       : 'assets/json/ic_wrong_answer.json',
  //                   width: Get.width * 0.20,
  //                   height: Get.width * 0.20,
  //                   repeat: false),
  //               SizedBox(
  //                 height: 16,
  //               ),
  //               Text(
  //                 "Solution",
  //                 style: titleTextStyle.copyWith(fontSize: 18),
  //               ),
  //               Text(
  //                 arrOfQuestion[index].solution != null
  //                     ? arrOfQuestion[index].solution
  //                     : "",
  //                 textAlign: TextAlign.center,
  //                 style: titleTextStyle.copyWith(fontWeight: FontWeight.w400),
  //               ),
  //               SizedBox(
  //                 height: 16,
  //               ),
  //               Container(
  //                 height: Get.height * 0.06,
  //                 decoration: BoxDecoration(
  //                     gradient: LinearGradient(
  //                         begin: Alignment.bottomLeft,
  //                         end: Alignment.topRight,
  //                         colors: [
  //                           HexColor.fromHex(_subjectController
  //                               .selectedSubject.value.color1),
  //                           HexColor.fromHex(_subjectController
  //                               .selectedSubject.value.color2),
  //                         ]),
  //                     borderRadius: BorderRadius.circular(24)),
  //                 margin: EdgeInsets.symmetric(
  //                     horizontal: Get.width * 0.30,
  //                     vertical: Platform.isAndroid ? 0 : 24),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: Stack(
  //                         fit: StackFit.expand,
  //                         children: [
  //                           Center(
  //                               child: Text(
  //                             "Next".toUpperCase(),
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 18,
  //                                 fontWeight: FontWeight.w600),
  //                           )),
  //                           Material(
  //                             color: Colors.transparent,
  //                             child: InkWell(
  //                               splashColor: Colors.grey[50],
  //                               onTap: () {
  //                                 arrOfQuestion[index].givenAnswer =
  //                                     arrOfQuestion[index]
  //                                         .answers[optionIndex]
  //                                         .id;
  //                                 Navigator.pop(context);
  //                                 nextPage();
  //                               },
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  /*void nextPage() async {
    if (currentIndex == arrOfQuestion.length - 1) {
      _testController.submitTopicTest(widget.modelTopic.content.id.toString(),
          arrOfQuestion, widget.modelTopic);
    } else {
      setAnimatedProgressValue();
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }*/

  setAnimatedProgressValue() {
    setState(() {
      animatedProgressValue = (currentIndex + 1) / arrOfQuestion.length;
    });
  }

  void clearSelection() {
    for (int i = 0; i < arrOfQuestion.length; i++) {
      arrOfQuestion[i].isSolutionVisible = false;
      for (int j = 0; j < arrOfQuestion[i].answers.length; j++) {
        arrOfQuestion[i].answers[j].isSelected = false;
      }
    }
  }
}
