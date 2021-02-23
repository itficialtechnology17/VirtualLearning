import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/modules/login/signup_page.dart';
import 'package:virtual_learning/page/main_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/textstyle.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        'assets/svg/ic_back.svg',
                        height: MediaQuery.of(context).size.width * 0.05,
                        width: MediaQuery.of(context).size.width * 0.05,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32, left: 14),
                    child: Text(
                      'Choose Course',
                      style: textStyle14Bold.copyWith(color: Color(0xff205072)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Select course you are interested in',
                      style: textStyle12.copyWith(
                          color: Color(0xff3aa59b),
                          fontSize: Get.height * 0.018),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Obx(() => _loginController.isLoadingCourse.value
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: List.generate(
                          _loginController.arrOfCourse.length, (index) {
                        return Container(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // boxShadow: getBoxShadow(index),
                                    border: Border.all(
                                        color: Color(
                                            /*_loginController
                                                .arrOfCourse[index].selected
                                            ? 0xff205072
                                            : */
                                            0xff3AA59B),
                                        width: _loginController
                                                .arrOfCourse[index].selected
                                            ? 3
                                            : 1),
                                    borderRadius: BorderRadius.circular(16)),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Wrap(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _loginController
                                                          .arrOfCourse[index]
                                                          .name,
                                                      style: textStyle16Bold.copyWith(
                                                          color: Color(
                                                              selectedPosition ==
                                                                      1
                                                                  ? 0xff205072
                                                                  : 0xff3AA59B)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          'th',
                                                          style: textStyle10Bold.copyWith(
                                                              color: Color(
                                                                  selectedPosition ==
                                                                          1
                                                                      ? 0xff205072
                                                                      : 0xff3AA59B)),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        SizedBox(
                                                          height: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                isNumeric(_loginController
                                                        .arrOfCourse[index]
                                                        .displayName)
                                                    ? Text("")
                                                    : Text(
                                                        _loginController
                                                            .arrOfCourse[index]
                                                            .displayName,
                                                        style: textStyle10.copyWith(
                                                            color: Color(
                                                                selectedPosition ==
                                                                        1
                                                                    ? 0xff205072
                                                                    : 0xff3AA59B)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                type: MaterialType.transparency,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    _loginController.onSelectSubject(index);
                                  },
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Material(
                          color: Colors.transparent,
                          type: MaterialType.circle,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () async {
                              if (_loginController.selectedCoursePosition ==
                                  -1) {
                                Flushbar(
                                  messageText: Text(
                                    "Please select course",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Color(0xff205072),
                                )..show(context);
                              } else {
                                //
                                if (_loginController
                                            .modelUser.value.firstName ==
                                        null ||
                                    _loginController
                                            .modelUser.value.firstName ==
                                        "") {
                                  if (isLogin) {
                                    Get.to(MainPage());
                                  } else {
                                    Get.off(SignUpPage());
                                  }
                                } else {
                                  Get.off(MainPage());
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff205072)),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                'assets/svg/ic_bg_next.svg',
                                height:
                                    MediaQuery.of(context).size.width * 0.01,
                                width: MediaQuery.of(context).size.width * 0.01,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ) /*Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          type: MaterialType.circle,
                          child: InkWell(
                            onTap: () {
                              if (selectedPosition == 0) {
                                Flushbar(
                                  messageText: Text(
                                    "Please select course",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Color(0xff205072),
                                )..show(context);
                              } else {}
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff205072)),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/svg/ic_bg_next.svg',
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )*/
                        ,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
}
