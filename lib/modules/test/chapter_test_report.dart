import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/modules/test/test_result_details.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class ChapterTestReport extends StatefulWidget {
  final ModelTestDescription modelTestDescription;

  ChapterTestReport(this.modelTestDescription);

  @override
  State<StatefulWidget> createState() {
    return StateChapterTestReport();
  }
}

class StateChapterTestReport extends State<ChapterTestReport> {
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    getChapterTestResult(widget.modelTestDescription.id.toString());
  }

  bool isGettingTopicTestResult = false;

  @override
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
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color1),
                        HexColor.fromHex(
                            _subjectController.selectedSubject.value.color2),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
        ),
        title: Text(
          widget.modelTestDescription.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
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
      body: isGettingTopicTestResult
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
          : Container(
              color: Colors.white,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/svg/test_report.svg",
                    width: Get.width * 0.40,
                  ),
                  Text(correctAnswer.toString() + "/" + totalQuestion),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Text(
                                  correctAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Right\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  wrongAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Wrong\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  skippedAnswer.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Skipped\nAnswer",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        Get.to(TestResultDetails(arrOfQuestion));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          "View Solution".toUpperCase(),
                          style: buttonTextStyle.copyWith(
                              color: Colors.white, fontSize: Get.width * 0.04),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  String percentage = "";
  String totalQuestion = "";
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int skippedAnswer = 0;
  List<ModelAnswer> arrOfQuestion = List<ModelAnswer>();

  void getChapterTestResult(String contentId) async {
    setState(() {
      isGettingTopicTestResult = true;
    });

    Request request = Request(url: urlChapterTestResult, body: {
      'type': "API",
      'test_id': contentId.toString(),
      'student_id': studentId,
    });

    request.post().then((value) {
      setState(() {
        isGettingTopicTestResult = false;
      });
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        setState(() {
          percentage = responseData['data']['percentage'].toString();
          totalQuestion = responseData['data']['total_question'].toString();
          correctAnswer = responseData['correct_answer'];
          wrongAnswer = responseData['wrong_answer'];
          skippedAnswer = responseData['skip_answer'];
          arrOfQuestion = ((responseData['data']['total_answer'] as List)
              .map((data) => ModelAnswer.fromJson(data))
              .toList());
        });
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      setState(() {
        isGettingTopicTestResult = false;
      });
      print(onError);
    });
  }
}
