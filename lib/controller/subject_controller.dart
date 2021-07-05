import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_chapter.dart';
import 'package:virtual_learning/model/model_pdf.dart';
import 'package:virtual_learning/model/model_question_bank.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/model/model_test_description.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/model/model_watch_history.dart';
import 'package:virtual_learning/modules/subject/chapter_details.dart';
import 'package:virtual_learning/modules/subject/custom_next_video_player.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class SubjectController extends GetxController {
  List<ModelSubject> arrOfSubject = <ModelSubject>[].obs;
  List<ModelChapter> arrOfChapter = <ModelChapter>[].obs;
  List<ModelPdf> arrOfPdf = <ModelPdf>[].obs;
  List<ModelWatchHistory> arrOfWatchHistory = <ModelWatchHistory>[].obs;
  List<ModeQuestionBank> arrOfQuestionBank = <ModeQuestionBank>[].obs;
  List<ModelTestDescription> arrOfTestDescription =
      <ModelTestDescription>[].obs;

  var arrOfTopic = List<ModelTopic>().obs;

  var isChapterLoading = false.obs;
  var isTopicLoading = false.obs;
  var isAddingLoading = false.obs;

  var selectedSubject = ModelSubject().obs;
  var selectedChapter = ModelChapter().obs;
  var selectedSubjectPosition = -1.obs;
  var selectedTopicPosition = -1.obs;
  var selectedChapterPosition = -1.obs;

  var selectedTab = 0.obs;

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

        arrOfWatchHistory.assignAll((responseData['watchHistory'] as List)
            .map((data) => ModelWatchHistory.fromJson(data))
            .toList());

        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isChapterLoading.value = false;
      print(onError);
    });
  }

  void getPractiseChapters() async {
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
      String jsonFormat = jsonEncode(responseData);

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

  var arrOfNextFourVideo = List<ModelTopic>().obs;
  void getNextFourVideo() {
    arrOfNextFourVideo.clear();

    var topics = arrOfChapter[selectedChapterPosition].topic;
    for (var i = selectedTopicPosition + 1; i < topics.length; i++) {
      arrOfNextFourVideo.add(topics[i]);
      if (arrOfNextFourVideo.length == 4) break;
    }
  }

  void getUpNextFourVideo(BuildContext context, String id) {
    arrOfNextFourVideo.clear();

    var topics = arrOfChapter[selectedChapterPosition].topic;
    int lastIndex;
    for (var i = 0; i < topics.length; i++) {
      if (topics[i].id.toString() == id) {
        lastIndex = i;
        break;
      }
    }

    for (var i = lastIndex; i < topics.length; i++) {
      arrOfNextFourVideo.add(topics[i]);
      if (arrOfNextFourVideo.length == 4) break;
    }

    for (var i = 0; i < arrOfNextFourVideo.length; i++) {
      if (arrOfNextFourVideo[i].id.toString() == id) {
        break;
      }
    }

    Navigator.pop(context);
    Get.to(CustomNextVideoPlayer(arrOfNextFourVideo[0]));
  }

  void getTopic() async {
    isTopicLoading.value = true;
    arrOfTopic.clear();
    arrOfPdf.clear();
    arrOfQuestionBank.clear();
    arrOfTestDescription.clear();

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
        /*arrOfTopic.assignAll((responseData['data'] as List)
            .map((data) => ModelTopic.fromJson(data))
            .toList());*/

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
    selectedChapterPosition = index;
    Get.to(ChapterDetails());
    // Get.to(TopicListing());
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
        arrOfChapter[selectedChapterPosition]
            .topic[selectedTopicPosition]
            .isFavorite = responseData['favorite_id'];
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isAddingLoading.value = false;
      print(onError);
    });
  }

  void removeFavorite(String ids, isQuestion) async {
    isAddingLoading.value = true;

    Request request = Request(url: urlRemoveFavorite, body: {
      'type': "API",
      'favourite_id': isQuestion ? "" : ids,
      'bookmark_id': isQuestion ? ids : "",
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
      'student_id': studentId.toString(),
      'minutes': minutes.toString(),
      'content_id': contentId.toString(),
      'topic_id': topicId.toString(),
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);
      if (responseData['status_code'] == 1) {
        print(responseData['message']);
      } else {
        print(responseData['message']);
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
