import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_chapter.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class SubjectController extends GetxController {
  var arrOfSubject = List<ModelSubject>().obs;
  var arrOfChapter = List<ModelChapter>().obs;

  var isChapterLoading = false.obs;

  void getChapters() async {
    isChapterLoading.value = true;

    Request request = Request(url: urlGetChapter, body: {
      'type': "API",
      'standard_id': "3",
      'subject_id': "3",
      'student_id': userId,
    });
    request.post().then((value) {
      isChapterLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        var list = (responseData['data'] as List)
            .map((data) => ModelChapter.fromJson(data))
            .toList();

        arrOfChapter.assignAll(list);
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isChapterLoading.value = false;
      print(onError);
    });
  }
}
