import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/test/test_controller.dart';

class MCQTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMCQTes();
  }
}

class _StateMCQTes extends State<MCQTest> {
  TestController _testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _testController.isGetQuestion.value
        ? Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffD0E6EE),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            )),
                        width: double.infinity,
                        height: AppBar().preferredSize.height -
                            AppBar().preferredSize.height * 0.30,
                        child: Icon(
                            Platform.isAndroid
                                ? Icons.keyboard_backspace
                                : Icons.arrow_back_ios,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: Center(
              child: SizedBox(
                height: Get.width * 0.08,
                width: Get.width * 0.08,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffD0E6EE),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            )),
                        width: double.infinity,
                        height: AppBar().preferredSize.height -
                            AppBar().preferredSize.height * 0.30,
                        child: Icon(
                            Platform.isAndroid
                                ? Icons.keyboard_backspace
                                : Icons.arrow_back_ios,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Center(
                  child: Row(
                    children: [
                      Text("Time:",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "05:00",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              spreadRadius: 1,
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )),
                    child: Center(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: _testController.arrOfQuestion.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Material(
                              color: Colors.transparent,
                              type: MaterialType.circle,
                              child: InkWell(
                                onTap: () {
                                  _testController.setSelection(index);
                                },
                                child: Container(
                                  // padding: EdgeInsets.only(left: index==0?16:0,right: index==_testController.arrOfQuestion.length-1?16:0),
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 16 : 0,
                                      right: index == 10 - 1 ? 16 : 0),
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: _testController
                                                          .selectedQuestion
                                                          .value ==
                                                      index
                                                  ? 18
                                                  : 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Center(
                                        child: _testController
                                                    .selectedQuestion.value ==
                                                index
                                            ? Container(
                                                width: 20,
                                                height: 3,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(8),
                                                    )),
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Obx(() => PageView.builder(
                            controller: _testController.controller,
                            itemCount: _testController.arrOfQuestion.length,
                            onPageChanged: (index) {
                              _testController.setSelection(index);
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
                                        /*const SizedBox(
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
                                        ),*/
                                        RichText(
                                          text: TextSpan(
                                              text: _testController
                                                  .arrOfQuestion[index]
                                                  .question,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Nunito",
                                                  fontSize: 16)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              setState(() {
                                                _testController
                                                    .arrOfQuestion[index]
                                                    .givenAnswer = 1;
                                                _testController
                                                        .arrOfQuestion[index]
                                                        .givenAnswer =
                                                    _testController
                                                        .arrOfQuestion[index]
                                                        .answers[0]
                                                        .id;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 8),
                                              decoration: BoxDecoration(

                                                  /* border: Border.all(
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAns ==
                                                              1
                                                          ? Colors.blue
                                                          : Colors.grey[200],
                                                      width: 1.5),*/
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAnswer ==
                                                              1
                                                          ? Colors.green[200]
                                                          : Colors.grey[200],
                                                    ),
                                                    child: Text(
                                                      "A",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: _testController
                                                                      .arrOfQuestion[
                                                                          index]
                                                                      .givenAnswer ==
                                                                  1
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text: _testController
                                                              .arrOfQuestion[
                                                                  index]
                                                              .answers[0]
                                                              .answer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 14)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              setState(() {
                                                _testController
                                                    .arrOfQuestion[index]
                                                    .givenAnswer = 2;
                                                _testController
                                                        .arrOfQuestion[index]
                                                        .givenAnswer =
                                                    _testController
                                                        .arrOfQuestion[index]
                                                        .answers[1]
                                                        .id;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 8),
                                              decoration: BoxDecoration(

                                                  /*border: Border.all(
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAns ==
                                                              2
                                                          ? Colors.blue
                                                          : Colors.grey[200],
                                                      width: 1.5),*/
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAnswer ==
                                                              2
                                                          ? Colors.green[200]
                                                          : Colors.grey[200],
                                                    ),
                                                    child: Text(
                                                      "B",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: _testController
                                                                      .arrOfQuestion[
                                                                          index]
                                                                      .givenAnswer ==
                                                                  2
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text: _testController
                                                              .arrOfQuestion[
                                                                  index]
                                                              .answers[1]
                                                              .answer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 14)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              setState(() {
                                                _testController
                                                    .arrOfQuestion[index]
                                                    .givenAnswer = 3;
                                                _testController
                                                        .arrOfQuestion[index]
                                                        .givenAnswer =
                                                    _testController
                                                        .arrOfQuestion[index]
                                                        .answers[2]
                                                        .id;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 8),
                                              decoration: BoxDecoration(

                                                  /* border: Border.all(
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAns ==
                                                              3
                                                          ? Colors.blue
                                                          : Colors.grey[200],
                                                      width: 1.5),*/
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAnswer ==
                                                              3
                                                          ? Colors.green[200]
                                                          : Colors.grey[200],
                                                    ),
                                                    child: Text(
                                                      "C",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: _testController
                                                                      .arrOfQuestion[
                                                                          index]
                                                                      .givenAnswer ==
                                                                  3
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text: _testController
                                                              .arrOfQuestion[
                                                                  index]
                                                              .answers[2]
                                                              .answer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 14)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              setState(() {
                                                _testController
                                                    .arrOfQuestion[index]
                                                    .givenAnswer = 4;
                                                _testController
                                                        .arrOfQuestion[index]
                                                        .givenAnswer =
                                                    _testController
                                                        .arrOfQuestion[index]
                                                        .answers[3]
                                                        .id;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 8),
                                              decoration: BoxDecoration(

                                                  /*border: Border.all(
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAns ==
                                                              4
                                                          ? Colors.blue
                                                          : Colors.grey[200],
                                                      width: 1.5),*/
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: _testController
                                                                  .arrOfQuestion[
                                                                      index]
                                                                  .givenAnswer ==
                                                              4
                                                          ? Colors.green[200]
                                                          : Colors.grey[200],
                                                    ),
                                                    child: Text(
                                                      "D",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: _testController
                                                                      .arrOfQuestion[
                                                                          index]
                                                                      .givenAnswer ==
                                                                  4
                                                              ? Colors.white
                                                              : Colors.black),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text: _testController
                                                              .arrOfQuestion[
                                                                  index]
                                                              .answers[3]
                                                              .answer,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 14)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              splashColor: Color.fromARGB(
                                                  255, 25, 178, 238),
                                              onTap: () {
                                                setState(() {
                                                  _testController
                                                      .selectedQuestion
                                                      .value = _testController
                                                          .selectedQuestion
                                                          .value -
                                                      1;
                                                  _testController.controller
                                                      .animateToPage(
                                                          _testController
                                                              .selectedQuestion
                                                              .value,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  400),
                                                          curve: Curves.ease);
                                                });
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    minWidth: 100),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Colors.blue[50]),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Previous".toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              splashColor: Color.fromARGB(
                                                  255, 25, 178, 238),
                                              onTap: () {
                                                if (index ==
                                                    _testController
                                                            .arrOfQuestion
                                                            .length -
                                                        1) {
                                                  // _submitTest();
                                                } else {
                                                  _testController
                                                      .selectedQuestion
                                                      .value = _testController
                                                          .selectedQuestion
                                                          .value +
                                                      1;
                                                  _testController.controller
                                                      .animateToPage(
                                                          _testController
                                                              .selectedQuestion
                                                              .value,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  400),
                                                          curve: Curves.easeIn);
                                                }
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: _testController
                                                        .isSubmitting.value
                                                    ? Container(
                                                        width: 50,
                                                        height: 30,
                                                        child: Center(
                                                          child: SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child:
                                                                CircularProgressIndicator(
                                                              strokeWidth: 2,
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          25,
                                                                          178,
                                                                          238),
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Color.fromARGB(
                                                                          255,
                                                                          25,
                                                                          178,
                                                                          238)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        constraints:
                                                            BoxConstraints(
                                                                minWidth: 100),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            color: Colors
                                                                .blue[200]),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                  vertical: 8),
                                                          child: Text(
                                                              index ==
                                                                      _testController
                                                                              .arrOfQuestion
                                                                              .length -
                                                                          1
                                                                  ? "SUBMIT"
                                                                  : "NEXT"
                                                                      .toUpperCase(),
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}
