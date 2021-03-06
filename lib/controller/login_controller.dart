import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_course.dart';
import 'package:virtual_learning/model/model_user.dart';
import 'package:virtual_learning/modules/login/course_page.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/page/new_main_page.dart';
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
  var arrOfContactHours = List<String>().obs;

  var selectedCoursePosition = -1.obs;
  var selectedContactTimePosition = -1.obs;
  var enterMobileNumber = "0";
  var selectedTimeToContact = "";
  var receivedOTP = "";

  @override
  void onInit() {
    getCourse();
    getContactHours();
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
        print(receivedOTP);
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

  void getContactHours() async {
    Request request = Request(url: urlContactHours, body: {
      'type': "API",
    });
    request.post().then((value) {
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfContactHours.assignAll(List.from(responseData['contact']));

        print("Success");
      } else {}
    }).catchError((onError) {
      print(onError);
    });
  }

  void updateUserDetails(isRegister) async {
    isSignUp.value = true;

    Request request = Request(url: urlUpdateProfile, body: {
      'type': "API",
      'id': studentId.toString(),
      'first_name': modelUser.value.firstName.toString(),
      // 'last_name': modelUser.value.lastName.toString(),
      // 'school_name': modelUser.value.schoolName.toString(),
      // 'address': modelUser.value.address.toString(),
      'email': modelUser.value.email.toString(),
      'contact_time': selectedTimeToContact.toString(),
      'is_registered': isRegister,
      'standard_id': arrOfCourse[selectedCoursePosition].id.toString(),
    });

    request.post().then((value) async {
      isSignUp.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        await addBoolToSF(KEY_IS_LOGIN, true);
        Get.off(MainPage());
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isSignUp.value = false;
      showSnackBar("Error", "Opps! Internal App Error", Colors.red);
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
    if (enterOTP == modelUser.value.otp.toString()) {
      if (modelUser.value.firstName == null ||
          modelUser.value.firstName == "") {
        isLogin = true;
        await addBoolToSF(KEY_IS_LOGIN, isLogin);
        studentId = modelUser.value.id.toString();
        Get.to(CoursePage());
      } else {
        isLogin = true;
        await addBoolToSF(KEY_IS_LOGIN, true);
        studentId = modelUser.value.id.toString();
        await addStringToSF(KEY_IS_USER_ID, studentId);
        standardId = modelUser.value.standardId.toString();
        await addStringToSF(KEY_STANDARD_ID, standardId);
        Get.offAll(MainPage());
      }
    } else {
      showToast("Please Enter Valid OTP.", 0);
    }
  }
}
