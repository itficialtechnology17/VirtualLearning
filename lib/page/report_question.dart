import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ReportQuestion extends StatefulWidget {
  final ModelSubject modelSubject;
  final ModelQuestion modelQuestion;
  final String issueType;

  ReportQuestion(this.modelSubject, this.modelQuestion, this.issueType);

  @override
  State<StatefulWidget> createState() {
    return _StateReportQuestion();
  }
}

class _StateReportQuestion extends State<ReportQuestion> {
  TestController _testController = Get.find();
  ThemeController _themeController = Get.find();
  var description = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: _themeController.isDarkTheme.value
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: _themeController.isDarkTheme.value
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: _themeController.background.value,
        statusBarColor: _themeController.background.value));

    return Obx(() => Scaffold(
        backgroundColor: _themeController.background.value,
        body: Stack(children: [
          Scaffold(
              backgroundColor: _themeController.background.value,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.lightGreenAccent,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: margin8),
                                child: Material(
                                  color: Colors.transparent,
                                  type: MaterialType.circle,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Image.asset(
                                        ASSETS_ICONS_PATH + 'ic_back.png',
                                        height: iconHeightWidth,
                                        width: iconHeightWidth,
                                        fit: BoxFit.fitWidth,
                                        color: _themeController.iconColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Report Issue".toUpperCase(),
                                style: textStyle10Bold.copyWith(
                                    color: _themeController.textColor.value),
                                textScaleFactor: 1.0,
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(right: margin8),
                            //     child: Switch(
                            //       value: _themeController.isDarkTheme.value,
                            //       onChanged: (value) {
                            //         setState(() {
                            //           _themeController.isDarkTheme.value =
                            //               value;
                            //
                            //           _themeController.setTheme();
                            //         });
                            //       },
                            //       activeTrackColor: Colors.green,
                            //       activeColor: Colors.white,
                            //       inactiveThumbColor: Colors.white,
                            //       inactiveTrackColor: Colors.grey,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              body: Container(
                decoration:
                    BoxDecoration(color: _themeController.background.value),
                padding: EdgeInsets.all(16),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: _themeController.isDarkTheme.value
                              ? Border.all(
                                  color: Colors.white38,
                                  width: 0.5,
                                )
                              : Border(),
                          color: _themeController.isDarkTheme.value
                              ? Colors.black12
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(4)),
                      child: Html(data: widget.modelQuestion.question, style: {
                        "body": Style(
                            color: _themeController.textColor.value,
                            fontFamily: "Nunito"),
                      }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 250, minHeight: 250),
                      decoration: BoxDecoration(
                          color: _themeController.isDarkTheme.value
                              ? Colors.black12
                              : Colors.white38,
                          border: _themeController.isDarkTheme.value
                              ? Border.all(
                                  color: Colors.white38,
                                  width: 0.5,
                                )
                              : Border.all(
                                  color: Colors.grey[300],
                                ),
                          borderRadius: BorderRadius.circular(4)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: margin4, horizontal: margin16),
                            child: TextFormField(
                              onChanged: (value) {
                                description = value;
                              },
                              maxLines: 10,
                              style: textStyle11.copyWith(
                                  color: _themeController.textColor.value),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "Report your doubt here.....",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)
                                      .copyWith(
                                          color:
                                              _themeController.isDarkTheme.value
                                                  ? Colors.white
                                                  : Colors.black),
                                  disabledBorder: InputBorder.none),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'Description Is Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text:
                              "Maximum 1000 character only! File uploaded size maximum 2 MB.",
                          style: textStyle9.copyWith(color: Colors.grey)),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 48),
                        padding: EdgeInsets.all(16),
                        child: _testController.isSubmittingReport.value
                            ? loader()
                            : Center(
                                child: Text(
                                  "Report your issue".toUpperCase(),
                                  style: textStyle10Bold.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      onTap: () {
                        _testController.submitReport(
                            widget.modelQuestion.id.toString(),
                            widget.issueType.toLowerCase(),
                            widget.modelQuestion.question.toString(),
                            description);
                      },
                    )
                  ],
                ),
              ))
        ])));
  }
}
