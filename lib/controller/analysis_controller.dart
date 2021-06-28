import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_performance.dart';
import 'package:virtual_learning/model/model_progress.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';
import 'package:virtual_learning/utils/url.dart';

class AnalysisController extends GetxController {
  var isLoading = false.obs;
  var isLoadingProgress = false.obs;

  var arrOfPerformance = List<ModelPerformance>().obs;
  var arrOfProgress = List<ModelProgress>().obs;

  void getPerformance() async {
    isLoading.value = true;

    Request request = Request(url: urlPerformance, body: {
      'type': "API",
      'standard_id': standardId,
      'student_id': studentId,
      // 'student_id': "9",
    });
    request.post().then((value) {
      isLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfPerformance.assignAll((responseData['subjects'] as List)
            .map((data) => ModelPerformance.fromJson(data))
            .toList());
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }

  void getProgress() async {
    isLoadingProgress.value = true;

    Request request = Request(url: urlProgress, body: {
      'type': "API",
      'standard_id': standardId,
      'student_id': studentId,
      // 'student_id': "9",
    });
    request.post().then((value) {
      isLoadingProgress.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfProgress.assignAll((responseData['subjects'] as List)
            .map((data) => ModelProgress.fromJson(data))
            .toList());
        print("");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoadingProgress.value = false;
      print(onError);
    });
  }
}
