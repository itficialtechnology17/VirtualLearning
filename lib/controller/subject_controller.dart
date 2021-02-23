import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_chapter.dart';
import 'package:virtual_learning/model/model_pdf.dart';
import 'package:virtual_learning/model/model_question_bank.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/modules/lesson/topic_listing.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class SubjectController extends GetxController {
  var arrOfSubject = List<ModelSubject>().obs;
  var arrOfChapter = List<ModelChapter>().obs;
  var arrOfPdf = List<ModelPdf>().obs;
  var arrOfQuestionBank = List<ModeQuestionBank>().obs;
  var arrOfTestDescription = List<ModelTestDescription>().obs;
  var arrOfTopic = List<ModelTopic>().obs;

  var isChapterLoading = false.obs;
  var isTopicLoading = false.obs;
  var isAddingLoading = false.obs;

  var selectedSubject = ModelSubject().obs;
  var selectedChapter = ModelChapter().obs;
  var activeTopicPosition = 0.obs;

  void getChapters() async {
    isChapterLoading.value = true;

    Request request = Request(url: urlGetChapter, body: {
      'type': "API",
      'standard_id': standardId.toString(),
      'subject_id': selectedSubject.value.id.toString(),
      'student_id': studentId,
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

  void getTopic() async {
    isTopicLoading.value = true;
    arrOfTopic.clear();
    arrOfPdf.clear();
    arrOfQuestionBank.clear();

    Request request = Request(url: urlGetTopic, body: {
      'type': "API",
      'chapter_id': selectedChapter.value.id.toString(),
      'standard_id': standardId.toString(),
      'student_id': studentId,
    });
    request.post().then((value) {
      isTopicLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfTopic.assignAll((responseData['data'] as List)
            .map((data) => ModelTopic.fromJson(data))
            .toList());

        if (responseData['question_bank'] != null) {
          arrOfPdf.assignAll((responseData['question_bank'] as List)
              .map((data) => ModelPdf.fromJson(data))
              .toList());
        }

        if (responseData['question_bank_mcq'] != null) {
          arrOfQuestionBank.assignAll(
              (responseData['question_bank_mcq'] as List)
                  .map((data) => ModeQuestionBank.fromJson(data))
                  .toList());
        }

        if (responseData['test'] != null) {
          arrOfTestDescription.assignAll((responseData['test'] as List)
              .map((data) => ModelTestDescription.fromJson(data))
              .toList());
        }

        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isTopicLoading.value = false;
      print(onError);
    });
  }

  void setSelectedChapter(int index) {
    selectedChapter.value = arrOfChapter[index];
    Get.to(TopicListing());
  }

  void setFavorite(String ids) async {
    isAddingLoading.value = true;

    Request request = Request(url: urlSetFavorite, body: {
      'type': "API",
      'subject_id': selectedSubject.value.id.toString(),
      'topic_ids': ids,
      'student_id': studentId,
    });
    request.post().then((value) {
      isAddingLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isAddingLoading.value = false;
      print(onError);
    });
  }

  void removeFavorite(String ids) async {
    isAddingLoading.value = true;

    Request request = Request(url: urlRemoveFavorite, body: {
      'type': "API",
      'favourite_id': ids,
      'student_id': studentId,
    });
    request.post().then((value) {
      isAddingLoading.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isAddingLoading.value = false;
      print(onError);
    });
  }

  void setWatchHistory(String minutes, String contentId, String topicId) async {
    Request request = Request(url: urlSetWatchHistory, body: {
      'type': "API",
      'student_id': studentId,
      'minutes': minutes,
      'content_id': contentId,
      'topic_id': topicId,
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);
      if (responseData['status_code'] == 1) {
        print("Saved Watch History");
      } else {
        print("Failed To Saved Watch History");
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
