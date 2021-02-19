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
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor.fromHex(_subjectController.selectedSubject.value.color1),
              HexColor.fromHex(_subjectController.selectedSubject.value.color2),
            ],
          ),
        ),
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
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Center(
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
                                left: 16,
                                right:
                                    index == correctAnswer.length - 1 ? 16 : 0),
                            width: MediaQuery.of(context).size.width * 0.10,
                            height: MediaQuery.of(context).size.width * 0.10,
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
                                    color: selectedQuestion == index
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: PageView.builder(
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
                        margin: EdgeInsets.only(left: 16, right: 16),
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            color: Colors.white),
                        child: Stack(
                          children: [
                            ListView(
                              shrinkWrap: true,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  (index + 1).toString() + ".",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: correctAnswer[index]
                                          .question
                                          .question
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins",
                                          fontSize: 18)),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor:
                                      Color.fromARGB(255, 25, 178, 238),
                                  onTap: () {
                                    setState(() {
                                      selectedQuestion = selectedQuestion - 1;
                                      controller.animateToPage(selectedQuestion,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: index > 0
                                        ? Text(
                                            "Previous".toUpperCase(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            index == correctAnswer.length - 1
                                ? Text("")
                                : Align(
                                    alignment: Alignment.bottomRight,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor:
                                            Color.fromARGB(255, 25, 178, 238),
                                        onTap: () {
                                          selectedQuestion =
                                              selectedQuestion + 1;
                                          controller.animateToPage(
                                              selectedQuestion,
                                              duration:
                                                  Duration(milliseconds: 400),
                                              curve: Curves.easeIn);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text("NEXT".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
