import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_learning/model/model_bookmark.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';
import 'package:virtual_learning/utils/url.dart';

class BookmarkController extends GetxController {
  var isBookmarkLoading = false.obs;
  var arrOfBookmark = List<ModelBookmark>().obs;
  var currentBookmarkIndex = 0.obs;

  Future<List<ModelBookmark>> getBookmark() async {
    var url =
        "$baseUrl$urlGetBookmark?type=API&standard_id=$standardId&student_id=$studentId";
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final response = json.decode(res.body);
      arrOfBookmark.assignAll((response['data'] as List)
          .map((data) => ModelBookmark.fromJson(data))
          .toList());
      var arr = response['data'] as List;
      return arr.map((e) => ModelBookmark.fromJson(e)).toList();
    }

    return List<ModelBookmark>();
  }

  void setFavorite(String subjectId, String ids) async {
    Request request = Request(url: urlSetFavorite, body: {
      'type': "API",
      'subject_id': subjectId,
      'topic_ids': ids,
      'student_id': studentId,
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  void removeFavorite(String ids) async {
    Request request = Request(url: urlRemoveFavorite, body: {
      'type': "API",
      'favourite_id': ids,
      'student_id': studentId,
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showSnackBar("Success", responseData['message'], Colors.green);
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
