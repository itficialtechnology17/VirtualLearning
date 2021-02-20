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
}
