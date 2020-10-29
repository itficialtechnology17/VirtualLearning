import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'file:///E:/ITficialProject/FlutterProject/VirtualE/virtual_learning/lib/q-bank/type_of_question_bank.dart';

class LessonListing extends StatefulWidget {
  ModelSubject modelSubject;

  LessonListing.modelSubject(_) {
    this.modelSubject = _;
  }

  @override
  State<StatefulWidget> createState() {
    return _StateLessonListing();
  }
}

class _StateLessonListing extends State<LessonListing> {
  List<String> arrOfChapter = [
    'https://images.unsplash.com/photo-1586986572014-8261434379cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1516534775068-ba3e7458af70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1516534775068-ba3e7458af70?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1432888498266-38ffec3eaf0a?ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80',
    'https://images.unsplash.com/photo-1456735190827-d1262f71b8a3?ixlib=rb-1.2.1&auto=format&fit=crop&w=748&q=80',
    'https://images.unsplash.com/photo-1507955987999-df4864ee80d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
    'https://images.unsplash.com/photo-1599081595833-a54f00b6ed08?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'
  ];

  //0xffF6F2FF

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xff667db6), Color(0xff0082c8)])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  var selectedPosition = -1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: widget.modelSubject.bgColor,
      appBar: AppBar(
        backgroundColor: widget.modelSubject.bgColor,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          widget.modelSubject.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
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
                      color: Color(0xffFFFFFF),
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
      body: Container(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: arrOfChapter.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: index == selectedPosition
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24))
                  : null,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            arrOfChapter[index],
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.height * 0.08,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lesson " + (index + 1).toString(),
                                style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Basic What is Virtual E ?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontSize: 15)),
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "3 Topics",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              setState(() {
                                if (index == selectedPosition) {
                                  selectedPosition = -1;
                                } else {
                                  selectedPosition = index;
                                }
                              });
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Center(
                                child: Icon(
                                  index == selectedPosition
                                      ? Icons.remove
                                      : Icons.add,
                                  size: 15,
                                ),
                              ),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: index == selectedPosition ? 1 : 0,
                    curve: Curves.easeIn,
                    duration: Duration(seconds: 1),
                    child: Visibility(
                      visible: index == selectedPosition ? true : false,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: ListView.separated(
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, nIndex) {
                                return Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          nIndex == 0
                                              ? Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      shape: BoxShape.circle),
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Image(
                                                    image: AssetImage(
                                                        "assets/images/ic_done.png"),
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : Container(
                                                  height: 15,
                                                  width: 15,
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 1),
                                                      shape: BoxShape.circle),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text:
                                                      "Basic What is VirtualE ?",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Poppins",
                                                      fontSize: 13)),
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              children: [
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TypeOfQuestionBank()));
                                                    },
                                                    child: Container(
                                                      child: Text("Q-Bank",
                                                          style: TextStyle(
                                                              foreground: Paint()
                                                                ..shader =
                                                                    linearGradient)),
                                                      padding: EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 4,
                                                          bottom: 4),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey[200],
                                                                blurRadius: 2,
                                                                spreadRadius: 1)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 16),
                                                  child: Text("Test",
                                                      style: TextStyle(
                                                          foreground: Paint()
                                                            ..shader =
                                                                linearGradient)),
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 16,
                                                      top: 4,
                                                      bottom: 4),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey[200],
                                                            blurRadius: 2,
                                                            spreadRadius: 1)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularPercentIndicator(
                                            radius: 30.0,
                                            lineWidth: 2.0,
                                            percent: 0.2,
                                            backgroundColor: Colors.green[50],
                                            center: Icon(
                                              Icons.play_arrow,
                                              color: Colors.green[300],
                                              size: 20,
                                            ),
                                            progressColor: Colors.green[300],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, nIndex) {
                                return Container(
                                  margin: EdgeInsets.only(top: 4, bottom: 4),
                                  color: Colors.grey[200],
                                  height: 0.5,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffff5e62),
                                  Color(0xffff9966)
                                ]),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(24),
                                    bottomLeft: Radius.circular(24))),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      child: Text("Q-Bank".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 4,
                                          bottom: 4),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      child: Text("Test".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      padding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 4,
                                          bottom: 4),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
        ),
      ),
    );
  }
}
