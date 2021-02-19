import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_answer.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/modules/test/chapter_test_report.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class TestController extends GetxController {
  var isSubmittingTest = false.obs;
  var isGettingTopicTestResult = false.obs;
  var isGettingChapterTestResult = false.obs;
  var percentage = "".obs;
  var correctAnswer = 0.obs;
  var wrongAnswer = 0.obs;
  var skippedAnswer = 0.obs;

  var isVideoPlaying = false.obs;

  var arrOfQuestion = List<ModelAnswer>().obs;

  void submitTopicTest(String testId, List<ModelQuestion> arrOfQuestion) async {
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
        /*Get.off(TestResult.value(
            TestResultResponse.fromJson(responseData['data'])));*/
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
        /*Get.off(TestResult.value(
            TestResultResponse.fromJson(responseData['data'])));*/
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

  void getTopicTestResult(String contentId) async {
    isGettingTopicTestResult.value = true;

    Request request = Request(url: urlTopicTestResult, body: {
      'type': "API",
      'test_id': contentId.toString(),
      'student_id': studentId,
    });
    request.post().then((value) {
      isGettingTopicTestResult.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        percentage.value = responseData['data']['percentage'];

        correctAnswer.value = responseData['correct_answer'];
        wrongAnswer.value = responseData['wrong_answer'];
        skippedAnswer.value = responseData['skip_answer'];

        /*if (correctAnswer > 0) {
          arrOfCorrectQuestion =
              ((responseData['data']['correct_answer'][0]['question'] as List)
                  .map((data) => ModelAnswer.fromJson(data))
                  .toList());
        }

        if (wrongAnswer > 0) {
          arrOfWrongQuestion =
              ((responseData['data']['wrong_answer'][0]['question'] as List)
                  .map((data) => ModelAnswer.fromJson(data))
                  .toList());
        }

        if (skippedAnswer > 0) {
          arrOfSkippedQuestion = ((responseData['data']['correct_answer'][0]
                  ['skip_answer'] as List)
              .map((data) => ModelAnswer.fromJson(data))
              .toList());
        }*/

        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isGettingTopicTestResult.value = false;
      print(onError);
    });
  }
}
