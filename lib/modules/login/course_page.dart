import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/page/new_main_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

import 'lets_know_you.dart';

class CoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateCoursePage();
  }
}

class _StateCoursePage extends State<CoursePage> {
  var selectedPosition = 0;

  LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    if (_loginController.arrOfCourse.isEmpty) {
      _loginController.getCourse();
    }

    super.initState();
  }

  getBoxShadow(int i) {
    if (_loginController.arrOfCourse[i].selected) {
      return [
        BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(4.0, 3.0))
      ];
    } else
      return null;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_select_course_bg.png"),
                fit: BoxFit.cover)),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.18,
                ),
                Text(
                  'Select Standard',
                  style: textStyle14Bold.copyWith(color: Colors.white),
                ),
                Expanded(
                  child: _loginController.isLoadingCourse.value
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: margin16),
                          width: Get.width,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white12,
                            highlightColor: Colors.white30,
                            // period: Duration(milliseconds: 700),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width * 0.70,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                                Container(
                                  width: Get.width * 0.40,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                                Container(
                                  width: Get.width * 0.50,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                                SizedBox(
                                  height: margin16,
                                ),
                                Container(
                                  width: Get.width * 0.70,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                                Container(
                                  width: Get.width * 0.40,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                                Container(
                                  width: Get.width * 0.50,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  margin: EdgeInsets.only(bottom: margin12),
                                ),
                              ],
                            ),
                          ),
                        )
                      : GridView.count(
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 8,
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 5,
                          children: List.generate(
                              _loginController.arrOfCourse.length, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(_loginController
                                              .arrOfCourse[index].selected
                                          ? "assets/images/ic_selected_course_bg.png"
                                          : "assets/images/ic_course_bg.png"),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 11),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      _loginController.onSelectSubject(index);
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _loginController
                                                .arrOfCourse[index].name,
                                            style: textStyle14Bold.copyWith(
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "th",
                                            style: textStyle10Bold.copyWith(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                _loginController.isLoadingCourse.value
                    ? SizedBox.shrink()
                    : Material(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            if (_loginController.selectedCoursePosition == -1) {
                              Flushbar(
                                messageText: Text(
                                  "Please select course",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Color(0xff205072),
                              )..show(context);
                            } else {
                              if (_loginController.modelUser.value.firstName ==
                                      null ||
                                  _loginController.modelUser.value.firstName ==
                                      "") {
                                if (studentId == "79") {
                                  Get.to(MainPage());
                                } else {
                                  Get.off(LetsKnowYou());
                                }
                              } else {
                                Get.off(MainPage());
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4)),
                            constraints: BoxConstraints(
                              minWidth: Get.width * 0.20,
                              maxWidth: Get.width * 0.30,
                              minHeight: Get.height * 0.06,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next",
                                    style: textStyle10Bold.copyWith(
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: margin4,
                                  ),
                                  Icon(
                                    Icons.navigate_next_outlined,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: Get.height * 0.18,
                ),
              ],
            )),
      ),
    );
  }
}
