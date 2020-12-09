import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class TestController extends GetxController {
  var selectedQuestion = 0.obs;
  var arrOfQuestion = List<ModelQuestion>().obs;
  var isGetQuestion = false.obs;
  var isSubmitting = false.obs;
  var controller = PageController();

  @override
  void onInit() {
    super.onInit();
    getQuestion();
  }

  void getQuestion() async {
    isGetQuestion.value = true;

    Request request = Request(url: urlGetTestQuestion, body: {
      'type': "API",
      'test_id': "1",
      'user_id': "26",
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);
      isGetQuestion.value = false;
      if (responseData['status_code'] == 1) {
        arrOfQuestion.value = (responseData['data'] as List)
            .map((data) => ModelQuestion.fromJson(data))
            .toList();
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }

      print("Successful");
    }).catchError((onError) {
      isGetQuestion.value = false;
      print(onError);
    });
  }

  void setSelection(int index) {
    selectedQuestion.value = index;
    controller.animateToPage(selectedQuestion.value,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
  }
}
