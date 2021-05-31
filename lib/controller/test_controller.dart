import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/modules/lesson/topic_test_report.dart';
import 'package:virtual_learning/modules/test/chapter_test_report.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class TestController extends GetxController {
  var isSubmittingTest = false.obs;
  var isSubmittingReport = false.obs;
  var isGettingTopicTestResult = false.obs;
  var isGettingChapterTestResult = false.obs;

  var isVideoPlaying = false.obs;
  var arrOfQuestion = List<ModelAnswer>().obs;

  void submitTopicTest(String testId, List<ModelQuestion> arrOfQuestion,
      ModelTopic modelTopic) async {
    isSubmittingTest.value = true;
    var queAnd = jsonEncode(arrOfQuestion);

    Request request = Request(url: urlSubmitTopicTest, body: {
      'type': "API",
      'student_id': studentId.toString(),
      'test_id': testId.toString(),
      'que_ans': queAnd.toString(),
    });
    request.post().then((value) {
      isSubmittingTest.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        Get.off(TopicTestReport(modelTopic));
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }

      print("Successful");
    }).catchError((onError) {
      isSubmittingTest.value = false;
      print(onError);
    });
  }

  void submitChapterTest(String testId, List<ModelQuestion> arrOfQuestion,
      ModelTestDescription modelTestDescription) async {
    isSubmittingTest.value = true;
    var queAnd = jsonEncode(arrOfQuestion);

    Request request = Request(url: urlSubmitChapterTest, body: {
      'type': "API",
      'student_id': studentId.toString(),
      'test_id': testId.toString(),
      'que_ans': queAnd.toString(),
    });
    request.post().then((value) {
      isSubmittingTest.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        Get.off(ChapterTestReport(modelTestDescription));
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }

      print("Successful");
    }).catchError((onError) {
      isSubmittingTest.value = false;
      print(onError);
    });
  }

  void setQuestionBookmark(String id, String bookmarkType) async {
    Request request = Request(url: urlSetQuestionBookmark, body: {
      'type': "API",
      'question_id': id,
      'module_type': bookmarkType.toLowerCase(),
      'student_id': studentId,
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  void submitReport(
      String id, String questionType, String title, String issue) async {
    isSubmittingReport.value = true;
    Request request = Request(url: urlReportIssue, body: {
      'type': "API",
      'student_id': studentId,
      'question_id': id,
      'module_type': questionType.toLowerCase(),
      'title': title,
      'issue': issue,
    });
    request.post().then((value) {
      isSubmittingReport.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isSubmittingReport.value = false;
      print(onError);
    });
  }
}
