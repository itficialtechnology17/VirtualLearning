import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_search_chapter.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';
import 'package:virtual_learning/utils/url.dart';

class SearchController extends GetxController {
  var isLoading = false.obs;

  var arrOfSubject = List<ModelSubject>().obs;
  var arrOfChapter = List<ModelSearchChapter>().obs;
  var arrOfTopic = List<ModelTopic>().obs;
  // var arrOfTopic = List<Topic>().obs;

  void getSearch(String searchText) async {
    if (arrOfSubject.isNotEmpty ||
        arrOfChapter.isNotEmpty ||
        arrOfTopic.isNotEmpty) {
      isLoading.value = false;
    } else {
      isLoading.value = true;
    }

    Request request = Request(url: urlSearch, body: {
      'type': "API",
      'standard_id': standardId,
      'student_id': studentId,
      'search': searchText,
    });
    request.post().then((value) {
      isLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfSubject.assignAll((responseData['subject'] as List)
            .map((data) => ModelSubject.fromJson(data))
            .toList());

        arrOfChapter.assignAll((responseData['chapter'] as List)
            .map((data) => ModelSearchChapter.fromJson(data))
            .toList());

        arrOfTopic.assignAll((responseData['topic'] as List)
            .map((data) => ModelTopic.fromJson(data))
            .toList());

        print(arrOfTopic.toString());
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoading.value = false;
      print(onError);
    });
  }
}
