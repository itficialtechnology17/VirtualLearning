import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_question_bank.dart';
import 'package:virtual_learning/utils/methods.dart';

class QuestionBankTest extends StatefulWidget {
  final ModeQuestionBank modeQuestionBank;

  QuestionBankTest(this.modeQuestionBank);

  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBankTest();
  }
}

class _StateQuestionBankTest extends State<QuestionBankTest> {
  final PageController controller = PageController();

  var animatedProgressValue = 0.0;
  var currentIndex = 0;

  List<ModelQuestion> arrOfQuestion;
  SubjectController _subjectController = Get.find();
  TestController _testController = Get.find();

  @override
  void initState() {
    // setAnimatedProgressValue();
    super.initState();
    arrOfQuestion = widget.modeQuestionBank.question;
    clearSelection();
    setState(() {
      arrOfQuestion[0].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill))),*/
          Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                /* leading: InkWell(
                onTap: () {

                },
                child: Icon(
                  Icons.close_rounded,
                  size: 25,
                ),
              ),*/
                // leading: Container(),
                automaticallyImplyLeading: false,
                titleSpacing: 16,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      HexColor.fromHex(
                          _subjectController.selectedSubject.value.color1),
                      HexColor.fromHex(
                          _subjectController.selectedSubject.value.color2),
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
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            "End",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
                title: Text(widget.modeQuestionBank.title.toString() +
                    " Marks Question"),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Get.height * 0.04),
                  child: /*AnimatedProgressbar(value: animatedProgressValue)*/ Container(
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
                                          : Colors.grey,
                                    )),
                              ),
                              index < arrOfQuestion.length - 1
                                  ? Container(
                                      width: 10,
                                      color: arrOfQuestion[index].isSelected
                                          ? Colors.white
                                          : Colors.grey,
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
                            /*SizedBox(
                            height: Get.height * 0.05,
                          ),*/
                            Container(
                              padding: EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: Html(
                                data: arrOfQuestion[index].question,
                              ), /*Text(
                              arrOfQuestion[index].question,
                              style: titleTextStyle.copyWith(
                                  fontSize: Get.width * 0.05,
                                  fontWeight: FontWeight.w400),
                            )*/
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
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                              _bottomSheet(
                                                  context, index, optionIndex);
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
                                                        data:
                                                            arrOfQuestion[index]
                                                                .answers[
                                                                    optionIndex]
                                                                .answer,
                                                      ) /*Text(
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
                                                    )*/
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
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*Material(
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
                  ),*/
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          nextPage();
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            currentIndex == arrOfQuestion.length - 1
                                ? 'Finished'.toUpperCase()
                                : 'Next'.toUpperCase(),
                            style: new TextStyle(
                                fontSize: Get.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  _bottomSheet(BuildContext context, int index, int optionIndex) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(minHeight: 250, maxHeight: 400),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          padding: EdgeInsets.all(16),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Lottie.asset(
                      arrOfQuestion[index].answers[optionIndex].isRight == 1
                          ? 'assets/json/ic_right_answer.json'
                          : 'assets/json/ic_wrong_answer.json',
                      width: Get.width * 0.20,
                      height: Get.width * 0.20,
                      repeat: false),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Solution",
                    style: titleTextStyle.copyWith(fontSize: 18),
                  ),
                ),
                Center(
                  child: Text(
                    arrOfQuestion[index].solution != null
                        ? arrOfQuestion[index].solution
                        : "",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            HexColor.fromHex(_subjectController
                                .selectedSubject.value.color1),
                            HexColor.fromHex(_subjectController
                                .selectedSubject.value.color2),
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
                                  arrOfQuestion[index].givenAnswer =
                                      arrOfQuestion[index]
                                          .answers[optionIndex]
                                          .id;
                                  Navigator.pop(context);
                                  nextPage();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void nextPage() async {
    if (currentIndex == arrOfQuestion.length - 1) {
      Get.back();
    } else {
      setAnimatedProgressValue();
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  setAnimatedProgressValue() {
    setState(() {
      animatedProgressValue = (currentIndex + 1) / arrOfQuestion.length;
    });
  }

  void clearSelection() {
    for (int i = 0; i < arrOfQuestion.length; i++) {
      for (int j = 0; j < arrOfQuestion[i].answers.length; j++) {
        arrOfQuestion[i].answers[j].isSelected = false;
      }
    }
  }
}
