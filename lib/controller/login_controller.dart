import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_course.dart';
import 'package:virtual_learning/model/model_user.dart';
import 'package:virtual_learning/modules/login/course_page.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/page/main_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/utils/url.dart';

class LoginController extends GetxController {
  var isLoadingCourse = false.obs;
  var isGettingOTP = false.obs;
  var isSignUp = false.obs;
  var modelUser = ModelUser().obs;
  var arrOfCourse = List<ModelCourse>().obs;

  var selectedCoursePosition = -1.obs;
  var enterMobileNumber = "0";
  var receivedOTP = "";

  @override
  void onInit() {
    getCourse();
    super.onInit();
  }

  void getOTP() async {
    isGettingOTP.value = true;

    Request request = Request(url: urlLogin, body: {
      'type': "API",
      'login_as': "STUDENT",
      'mobile_number': enterMobileNumber.toString(),
    });
    request.post().then((value) {
      isGettingOTP.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        modelUser.value = ModelUser.fromJson(responseData['data']);
        receivedOTP = responseData['otp'].toString();
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isGettingOTP.value = false;
      print(onError);
    });
  }

  void getCourse() async {
    isLoadingCourse.value = true;

    Request request = Request(url: urlGetCourse, body: {
      'type': "API",
    });
    request.post().then((value) {
      isLoadingCourse.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfCourse.assignAll((responseData['data'] as List)
            .map((data) => ModelCourse.fromJson(data))
            .toList());
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoadingCourse.value = false;
      print(onError);
    });
  }

  void updateUserDetails() async {
    isSignUp.value = true;

    Request request = Request(url: urlUpdateProfile, body: {
      'type': "API",
      'id': modelUser.value.id.toString(),
      'first_name': modelUser.value.firstName.toString(),
      'school_name': modelUser.value.schoolName.toString(),
      'address': modelUser.value.address.toString(),
      'email': modelUser.value.email.toString(),
      'standard_id': arrOfCourse[selectedCoursePosition].id.toString(),
    });

    request.post().then((value) async {
      isSignUp.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        await addBoolToSF(KEY_IS_LOGIN, true);
        Get.to(MainPage());
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isSignUp.value = false;
      print(onError);
    });
  }

  void onSelectSubject(int index) async {
    for (int i = 0; i < arrOfCourse.length; i++) {
      if (index == i) {
        arrOfCourse[i].selected = true;
        selectedCoursePosition = index;
        standardId = arrOfCourse[i].id.toString();
        await addStringToSF(KEY_STANDARD_ID, arrOfCourse[i].id.toString());
      } else {
        arrOfCourse[i].selected = false;
      }
    }

    ModelCourse modelCourse = arrOfCourse[index];
    modelCourse.selected = true;
    arrOfCourse[index] = modelCourse;
  }

  void checkOTP(enterOTP) async {
    if (enterOTP == receivedOTP) {
      if (modelUser.value.firstName == null ||
          modelUser.value.firstName == "") {
        Get.to(CoursePage());
      } else {
        await addBoolToSF(KEY_IS_LOGIN, true);
        studentId = modelUser.value.id.toString();
        await addStringToSF(KEY_IS_USER_ID, studentId);
        standardId = modelUser.value.standardId.toString();
        await addStringToSF(KEY_STANDARD_ID, standardId);
        Get.offAll(MainPage());
      }
    } else {
      showSnackBar("Mismatched", "Please enter valid otp", Colors.red);
    }
  }
}
