import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class DashboardController extends GetxController {
  var isDashboardLoading = false.obs;
  var arrOfSubject = List<ModelSubject>().obs;

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }

  void getDashboard() async {
    isDashboardLoading.value = true;

    Request request = Request(url: urlGetDashboard, body: {
      'type': "API",
      'standard_id': "3",
      'student_id': userId,
    });
    request.post().then((value) {
      isDashboardLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        var list = (responseData['data'] as List)
            .map((data) => ModelSubject.fromJson(data))
            .toList();

        arrOfSubject.assignAll(list);
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isDashboardLoading.value = false;
      print(onError);
    });
  }
}
