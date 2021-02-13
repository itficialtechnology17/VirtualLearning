import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class TestController extends GetxController {
  var isSubmittingTest = false.obs;

  void submitTest(String testId, List<ModelQuestion> arrOfQuestion) async {
    isSubmittingTest.value = true;
    var queAnd = jsonEncode(arrOfQuestion);

    Request request = Request(url: urlSubmitTest, body: {
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
}
