import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/utils/methods.dart';

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

  @override
  void initState() {
    super.initState();
    correctAnswer = widget.correctAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        /*decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor.fromHex(_subjectController.selectedSubject.value.color1),
              HexColor.fromHex(_subjectController.selectedSubject.value.color2),
            ],
          ),
        )*/
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.dark,
            elevation: 0,
            backgroundColor: Colors.transparent,
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
                      ? Icons.keyboard_backspace
                      : Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              "Highlights",
              style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
            ),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient:
                        _subjectController.selectedSubject.value.id == null
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
                                  /*Color(0xff14C269),
                  Color(0xff0A0A78),*/
                                  HexColor.fromHex(_subjectController
                                      .selectedSubject.value.color1),
                                  HexColor.fromHex(_subjectController
                                      .selectedSubject.value.color2),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ))),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Container(
                height: AppBar().preferredSize.height,
                child: ListView.builder(
                  itemCount: correctAnswer.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      type: MaterialType.circle,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedQuestion = index;
                          });
                          controller.jumpToPage(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 8,
                              right: index == correctAnswer.length - 1 ? 8 : 0),
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedQuestion == index
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(
                                  color: selectedQuestion == index
                                      ? Colors.transparent
                                      : Colors.white,
                                  width: 1)),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedQuestion == index
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          body: PageView.builder(
            controller: controller,
            itemCount: correctAnswer.length,
            onPageChanged: (index) {
              setState(() {
                selectedQuestion = index;
              });
              // setSelectedPosition(index);
            },
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text(
                        correctAnswer[index].question.question.toString(),
                        style: titleTextStyle.copyWith(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: correctAnswer[index].question.answers.length,
                        itemBuilder: (context, optionIndex) {
                          return Container(
                            margin: EdgeInsets.only(bottom: Get.height * 0.03),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: correctAnswer[index]
                                                    .question
                                                    .answers[optionIndex]
                                                    .isRight ==
                                                1
                                            ? Colors.green
                                            : correctAnswer[index].answerId ==
                                                    correctAnswer[index]
                                                        .question
                                                        .answers[optionIndex]
                                                        .id
                                                ? Colors.red
                                                : Colors.transparent),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      boxShadow,
                                    ],
                                    gradient: correctAnswer[index]
                                            .question
                                            .answers[optionIndex]
                                            .isSelected
                                        ? LinearGradient(
                                            begin: Alignment.bottomLeft,
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
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      correctAnswer[index]
                                              .question
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
                                          margin: EdgeInsets.only(left: 16),
                                          child: Text(
                                            correctAnswer[index]
                                                .question
                                                .answers[optionIndex]
                                                .answer,
                                            style: TextStyle(
                                                color: correctAnswer[index]
                                                        .question
                                                        .answers[optionIndex]
                                                        .isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    ],
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
                            )*/
                      ,
                    )

                    /*Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: correctAnswer[index]
                                          .question
                                          .answers[0]
                                          .isRight ==
                                      1
                                  ? Colors.green
                                  : correctAnswer[index].answerId ==
                                          correctAnswer[index]
                                              .question
                                              .answers[0]
                                              .id
                                      ? Colors.red
                                      : Colors.grey[200],
                              width: 1.5),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "A.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: correctAnswer[index]
                                      .question
                                      .answers[0]
                                      .answer,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: correctAnswer[index]
                                          .question
                                          .answers[1]
                                          .isRight ==
                                      1
                                  ? Colors.green
                                  : correctAnswer[index].answerId ==
                                          correctAnswer[index]
                                              .question
                                              .answers[1]
                                              .id
                                      ? Colors.red
                                      : Colors.grey[200],
                              width: 1.5),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "B.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: correctAnswer[index]
                                      .question
                                      .answers[1]
                                      .answer,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: correctAnswer[index]
                                          .question
                                          .answers[2]
                                          .isRight ==
                                      1
                                  ? Colors.green
                                  : correctAnswer[index].answerId ==
                                          correctAnswer[index]
                                              .question
                                              .answers[2]
                                              .id
                                      ? Colors.red
                                      : Colors.grey[200],
                              width: 1.5),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "C.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: correctAnswer[index]
                                      .question
                                      .answers[2]
                                      .answer,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: correctAnswer[index]
                                          .question
                                          .answers[3]
                                          .isRight ==
                                      1
                                  ? Colors.green
                                  : correctAnswer[index].answerId ==
                                          correctAnswer[index]
                                              .question
                                              .answers[3]
                                              .id
                                      ? Colors.red
                                      : Colors.grey[200],
                              width: 1.5),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "D.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: correctAnswer[index]
                                      .question
                                      .answers[3]
                                      .answer,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 14)),
                            ),
                          )
                        ],
                      ),
                    ),*/
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Container(
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
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      /*setState(() {
                          currentIndex = currentIndex + 1;
                        });
                        await controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );*/
                      previousPage();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        selectedQuestion == 0 ? '' : 'PREVIOUS'.toUpperCase(),
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
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        selectedQuestion == widget.correctAnswer.length - 1
                            ? 'Finished'.toUpperCase()
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
          ),
        ),
      ),
    );
  }

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
