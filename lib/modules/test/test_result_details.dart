import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class TestResultDetails extends StatefulWidget {
  final List<ModelAnswer> correctAnswer;

  @override
  State<StatefulWidget> createState() {
    return _StateTestResultDetails();
  }

  TestResultDetails(this.correctAnswer);
}

class _StateTestResultDetails extends State<TestResultDetails> {
  List<ModelAnswer> correctAnswer;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.black, Colors.black],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final controller = PageController();

  var selectedQuestion = 0;
  SubjectController _subjectController = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var currentIndex = 0;
  @override
  void initState() {
    super.initState();
    correctAnswer = widget.correctAnswer;
    print("");
  }

  void setSelectedQuestion(int index) {
    setState(() {
      for (var i = 0; i < correctAnswer.length; i++) {
        if (i == currentIndex) {
          setState(() {
            correctAnswer[index].isSelected = true;
          });
        } else {
          setState(() {
            correctAnswer[index].isSelected = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Stack(
        children: [
          //
          // Image.asset(
          //                ASSETS_BG_PATH + 'ic_home_top_bg.png',
          //                height: Get.height * 0.20,
          //                width: Get.width * 0.60,
          //                fit: BoxFit.fill,
          //              ),

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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Highlights",
                                style: textStyle11Bold,
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
                                itemCount: correctAnswer.length,
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
                      itemCount: correctAnswer.length,
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
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: Html(
                                data: correctAnswer[index]
                                    .question
                                    .question
                                    .toString(),
                              ),
                            ),
                            // Spacer(),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: correctAnswer[index]
                                    .question
                                    .answers
                                    .length,
                                itemBuilder: (context, answerIndex) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        bottom: Get.height * 0.03),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: correctAnswer[index]
                                                      .question
                                                      .answers[answerIndex]
                                                      .isRight ==
                                                  1
                                              ? Colors.green
                                              : correctAnswer[index].answerId ==
                                                      correctAnswer[index]
                                                          .question
                                                          .answers[answerIndex]
                                                          .id
                                                  ? Colors.red
                                                  : Colors.white,

                                          borderRadius: BorderRadius.circular(
                                              margin24), //
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              offset: Offset(0, 0),
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          // padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 16),
                                                  child: Html(
                                                      data: correctAnswer[index]
                                                          .question
                                                          .answers[answerIndex]
                                                          .answer,
                                                      style: {
                                                        "body": Style(
                                                            color: correctAnswer[
                                                                            index]
                                                                        .question
                                                                        .answers[
                                                                            answerIndex]
                                                                        .isRight ==
                                                                    1
                                                                ? Colors.white
                                                                : correctAnswer[index]
                                                                            .answerId ==
                                                                        correctAnswer[index]
                                                                            .question
                                                                            .answers[
                                                                                answerIndex]
                                                                            .id
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                      }),
                                                ),
                                              ),
                                              SizedBox(
                                                width: margin16,
                                              ),
                                              correctAnswer[index]
                                                          .question
                                                          .answers[answerIndex]
                                                          .isRight ==
                                                      1
                                                  ? Image.asset(
                                                      "assets/icons/ic_right.png",
                                                      width:
                                                          iconHeightWidth - 5,
                                                      height:
                                                          iconHeightWidth - 5,
                                                    )
                                                  : correctAnswer[index]
                                                              .answerId ==
                                                          correctAnswer[index]
                                                              .question
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
                                                      : SizedBox.shrink(),
                                              SizedBox(
                                                width: margin16,
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ),
                            correctAnswer[index].question.solution == null
                                ? SizedBox.shrink()
                                : Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xff38AF48).withOpacity(0.15),
                                        borderRadius:
                                            BorderRadius.circular(margin8),
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
                                            data: correctAnswer[index]
                                                .question
                                                .solution,
                                            style: {
                                              "body":
                                                  Style(color: Colors.black),
                                            })
                                      ],
                                    ),
                                  ),
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
                height: Get.height * 0.06,
                width: Get.width,
                margin:
                    EdgeInsets.only(bottom: Platform.isAndroid ? 0 : margin16),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9FB),
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
                    /*Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Material(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xff7FCB4F),
                          type: MaterialType.circle,
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
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: iconHeightWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            splashColor: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              Get.back();
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
                                    "Finished",
                                    style: textStyle10Bold.copyWith(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          color: Color(0xff7FCB4F),
                          type: MaterialType.circle,
                          child: InkWell(
                            onTap: () async {
                              nextPage();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(margin8),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: iconHeightWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )*/
                  ],
                ),
              ))
        ],
      ),
    );
  }

  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     body: Container(
  //       decoration: new BoxDecoration(
  //         gradient: new LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           colors: [
  //             HexColor.fromHex(_subjectController.selectedSubject.value.color1),
  //             HexColor.fromHex(_subjectController.selectedSubject.value.color2),
  //           ],
  //         ),
  //       ),
  //       color: Colors.white,
  //       child: Scaffold(
  //         backgroundColor: Colors.transparent,
  //         appBar: AppBar(
  //           brightness: Brightness.dark,
  //           elevation: 0,
  //           backgroundColor: Colors.transparent,
  //           leading: Material(
  //             color: Colors.transparent,
  //             type: MaterialType.circle,
  //             clipBehavior: Clip.hardEdge,
  //             child: InkWell(
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Icon(
  //                 Platform.isAndroid
  //                     ? Icons.keyboard_backspace
  //                     : Icons.arrow_back_ios,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //           centerTitle: true,
  //           title: Text(
  //             "Highlights",
  //             style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
  //           ),
  //           flexibleSpace: Container(
  //               decoration: BoxDecoration(
  //                   gradient:
  //                       _subjectController.selectedSubject.value.id == null
  //                           ? LinearGradient(
  //                               colors: [
  //                                 Color(0xff14C269),
  //                                 Color(0xff0A0A78),
  //                               ],
  //                               begin: Alignment.bottomLeft,
  //                               end: Alignment.topRight,
  //                             )
  //                           : LinearGradient(
  //                               colors: [
  //                                 Color(0xff14C269),
  //                                 Color(0xff0A0A78),
  //                                 HexColor.fromHex(_subjectController
  //                                     .selectedSubject.value.color1),
  //                                 HexColor.fromHex(_subjectController
  //                                     .selectedSubject.value.color2),
  //                               ],
  //                               begin: Alignment.bottomLeft,
  //                               end: Alignment.topRight,
  //                             ))),
  //           bottom: PreferredSize(
  //             preferredSize: Size.fromHeight(AppBar().preferredSize.height),
  //             child: Container(
  //               height: AppBar().preferredSize.height,
  //               child: ListView.builder(
  //                 itemCount: correctAnswer.length,
  //                 scrollDirection: Axis.horizontal,
  //                 shrinkWrap: true,
  //                 itemBuilder: (context, index) {
  //                   return Material(
  //                     color: Colors.transparent,
  //                     type: MaterialType.circle,
  //                     child: InkWell(
  //                       onTap: () {
  //                         setState(() {
  //                           selectedQuestion = index;
  //                         });
  //                         controller.jumpToPage(index);
  //                       },
  //                       child: Container(
  //                         margin: EdgeInsets.only(
  //                             left: 8,
  //                             right: index == correctAnswer.length - 1 ? 8 : 0),
  //                         width: MediaQuery.of(context).size.width * 0.08,
  //                         height: MediaQuery.of(context).size.width * 0.08,
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: selectedQuestion == index
  //                                 ? Colors.white
  //                                 : Colors.transparent,
  //                             border: Border.all(
  //                                 color: selectedQuestion == index
  //                                     ? Colors.transparent
  //                                     : Colors.white,
  //                                 width: 1)),
  //                         child: Center(
  //                           child: Text(
  //                             (index + 1).toString(),
  //                             style: TextStyle(
  //                                 fontSize: 12,
  //                                 color: selectedQuestion == index
  //                                     ? Colors.black
  //                                     : Colors.white,
  //                                 fontWeight: FontWeight.w400),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //         body: PageView.builder(
  //           controller: controller,
  //           itemCount: correctAnswer.length,
  //           onPageChanged: (index) {
  //             setState(() {
  //               selectedQuestion = index;
  //             });
  //             // setSelectedPosition(index);
  //           },
  //           itemBuilder: (context, index) {
  //             return Container(
  //               width: MediaQuery.of(context).size.width * 0.90,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(16),
  //                     topRight: Radius.circular(16)),
  //               ),
  //               child: ListView(
  //                 shrinkWrap: true,
  //                 children: [
  //                   const SizedBox(
  //                     height: 16,
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.all(16),
  //                     alignment: Alignment.center,
  //                     child: Text(
  //                       correctAnswer[index].question.question.toString(),
  //                       style: titleTextStyle.copyWith(
  //                           fontSize: Get.width * 0.05,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * 0.05,
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.symmetric(
  //                       horizontal: 16,
  //                     ),
  //                     child: ListView.builder(
  //                       shrinkWrap: true,
  //                       physics: NeverScrollableScrollPhysics(),
  //                       itemCount: correctAnswer[index].question.answers.length,
  //                       itemBuilder: (context, optionIndex) {
  //                         return Container(
  //                           margin: EdgeInsets.only(bottom: Get.height * 0.03),
  //                           child: Container(
  //                               decoration: BoxDecoration(
  //                                   border: Border.all(
  //                                       color: correctAnswer[index]
  //                                                   .question
  //                                                   .answers[optionIndex]
  //                                                   .isRight ==
  //                                               1
  //                                           ? Colors.green
  //                                           : correctAnswer[index].answerId ==
  //                                                   correctAnswer[index]
  //                                                       .question
  //                                                       .answers[optionIndex]
  //                                                       .id
  //                                               ? Colors.red
  //                                               : Colors.transparent),
  //                                   borderRadius: BorderRadius.circular(16),
  //                                   boxShadow: [
  //                                     boxShadow,
  //                                   ],
  //                                   gradient: correctAnswer[index]
  //                                           .question
  //                                           .answers[optionIndex]
  //                                           .isSelected
  //                                       ? LinearGradient(
  //                                           begin: Alignment.bottomLeft,
  //                                           end: Alignment.topRight,
  //                                           colors: [
  //                                               HexColor.fromHex(
  //                                                   _subjectController
  //                                                       .selectedSubject
  //                                                       .value
  //                                                       .color2),
  //                                               HexColor.fromHex(
  //                                                   _subjectController
  //                                                       .selectedSubject
  //                                                       .value
  //                                                       .color1),
  //                                             ])
  //                                       : LinearGradient(
  //                                           begin: Alignment.bottomLeft,
  //                                           end: Alignment.topRight,
  //                                           colors: [
  //                                               Color(0xffFFFFFF),
  //                                               Color(0xffFFFFFF),
  //                                             ])),
  //                               child: Container(
  //                                 padding: EdgeInsets.all(16),
  //                                 child: Row(
  //                                   children: [
  //                                     correctAnswer[index]
  //                                             .question
  //                                             .answers[optionIndex]
  //                                             .isSelected
  //                                         ? Icon(
  //                                             Icons.check_box,
  //                                             size: 30,
  //                                             color: Colors.white,
  //                                           )
  //                                         : Icon(
  //                                             Icons.crop_square,
  //                                             size: 30,
  //                                             color: Colors.grey,
  //                                           ),
  //                                     Expanded(
  //                                       child: Container(
  //                                         margin: EdgeInsets.only(left: 16),
  //                                         child: Text(
  //                                           correctAnswer[index]
  //                                               .question
  //                                               .answers[optionIndex]
  //                                               .answer,
  //                                           style: TextStyle(
  //                                               color: correctAnswer[index]
  //                                                       .question
  //                                                       .answers[optionIndex]
  //                                                       .isSelected
  //                                                   ? Colors.white
  //                                                   : Colors.black,
  //                                               fontSize: 16,
  //                                               fontWeight: FontWeight.w500),
  //                                         ),
  //                                       ),
  //                                     )
  //                                   ],
  //                                 ),
  //                               )),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //         bottomNavigationBar: Container(
  //           height: Get.height * 0.06,
  //           width: Get.width,
  //           padding: EdgeInsets.symmetric(horizontal: 8),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black,
  //                 blurRadius: 2.0,
  //                 spreadRadius: 0.0,
  //                 offset: Offset(2.0, 2.0), // shadow direction: bottom right
  //               )
  //             ],
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Material(
  //                 color: Colors.transparent,
  //                 child: InkWell(
  //                   onTap: () async {
  //                     setState(() {
  //                       currentIndex = currentIndex + 1;
  //                     });
  //                     await controller.nextPage(
  //                       duration: Duration(milliseconds: 500),
  //                       curve: Curves.easeOut,
  //                     );
  //
  //                     previousPage();
  //                   },
  //                   child: Padding(
  //                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                     child: Text(
  //                       selectedQuestion == 0 ? '' : 'PREVIOUS'.toUpperCase(),
  //                       style: TextStyle(
  //                           fontSize: Get.width * 0.04,
  //                           fontWeight: FontWeight.w500,
  //                           color: Colors.grey),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Material(
  //                 color: Colors.transparent,
  //                 child: InkWell(
  //                   onTap: () {
  //                     nextPage();
  //                   },
  //                   child: Padding(
  //                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                     child: Text(
  //                       selectedQuestion == widget.correctAnswer.length - 1
  //                           ? 'Finished'.toUpperCase()
  //                           : 'Next'.toUpperCase(),
  //                       style: new TextStyle(
  //                           fontSize: Get.width * 0.04,
  //                           fontWeight: FontWeight.w500,
  //                           color: Color(0xfffd5ca0)),
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void previousPage() async {
    setState(() {
      setState(() {
        selectedQuestion = selectedQuestion - 1;
      });
    });
    await controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void nextPage() async {
    if (selectedQuestion == widget.correctAnswer.length - 1) {
      Get.back();
    } else {
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }
}
