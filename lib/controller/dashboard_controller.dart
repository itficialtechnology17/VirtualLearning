import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/model/model_user.dart';
import 'package:virtual_learning/model/model_watch_history.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class DashboardController extends GetxController {
  var isDashboardLoading = false.obs;
  SubjectController _subjectController = Get.put(SubjectController());
  var arrOfWatchHistory = List<ModelWatchHistory>().obs;
  LoginController loginController = Get.put(LoginController());
  var lastGivenTestId = 0.obs;
  var currentTab = 0.obs;

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }

  void getDashboard() async {
    isDashboardLoading.value = true;

    Request request = Request(url: urlGetDashboard, body: {
      'type': "API",
      'standard_id': standardId,
      'student_id': studentId,
    });
    request.post().then((value) {
      isDashboardLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        _subjectController.arrOfSubject.assignAll(
            (responseData['subject'] as List)
                .map((data) => ModelSubject.fromJson(data))
                .toList());

        print("Subject Loaded");
        arrOfWatchHistory.assignAll((responseData['watchHistory'] as List)
            .map((data) => ModelWatchHistory.fromJson(data))
            .toList());
        print("Watch History Loaded");

        lastGivenTestId.value = responseData['last_test'];

        loginController.modelUser.value =
            ModelUser.fromJson(responseData['student']);

        print("Student Info Loaded");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isDashboardLoading.value = false;
      print(onError);
    });
  }
}
