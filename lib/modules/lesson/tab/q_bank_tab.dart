import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/q-bank/question_bank_test.dart';
import 'package:virtual_learning/page/pdf_view.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class QuestionBankTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBank();
  }
}

class _StateQuestionBank extends State<QuestionBankTab> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

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
          body: Obx(() => _subjectController.isTopicLoading.value
              ? ShimmerDummyPage()
              : Container(
                  margin: EdgeInsets.only(right: margin16),
                  child: _subjectController.arrOfPdf.isEmpty &&
                          _subjectController.arrOfQuestionBank.isEmpty
                      ? Container(
                          child: Center(
                            child: Text(
                              "Q-Bank Or Pdf not available.",
                              style: textStyle9.copyWith(
                                  color: _themeController.textColor.value),
                            ),
                          ),
                          height: Get.height - (AppBar().preferredSize.height),
                        )
                      : _subjectController.arrOfPdf.isNotEmpty
                          ? ListView.builder(
                              itemCount: _subjectController.arrOfPdf.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  decoration: BoxDecoration(
                                    boxShadow: [boxShadow],
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  height: AppBar().preferredSize.height,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        Get.to(PdfView(_subjectController
                                            .arrOfPdf[index].file));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: RichText(
                                                overflow: TextOverflow.fade,
                                                text: TextSpan(
                                                    text: _subjectController
                                                        .arrOfPdf[index].title,
                                                    style: bodyMediumTestStyle
                                                        .copyWith(
                                                            color:
                                                                Colors.black)),
                                                maxLines: 2,
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: InkWell(
                                                splashColor: Colors.white,
                                                onTap: () {
                                                  Get.to(PdfView(
                                                      _subjectController
                                                          .arrOfPdf[index]
                                                          .file));
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Container(
                                                  child: Center(
                                                    child: Text(
                                                      "View".toUpperCase(),
                                                      style: bodyMediumTestStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.green),
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.all(4),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : ListView(
                              shrinkWrap: true,
                              children: [
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2 / 0.7,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16),

                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _subjectController
                                        .arrOfQuestionBank.length,
                                    // itemCount: _subjectController.arrOfTopic.length,
                                    itemBuilder: (context, index) {
                                      return Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(QuestionBankTest(
                                                _subjectController
                                                    .arrOfQuestionBank[index]));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Center(
                                              child: RichText(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                    text: _subjectController
                                                            .arrOfQuestionBank[
                                                                index]
                                                            .title
                                                            .toString() +
                                                        " Marks",
                                                    style: textStyle10.copyWith(
                                                        color:
                                                            Color(0xff7FCB4F))),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                /*_subjectController.arrOfTopic.length == 0
                ? Container(
                    height: Get.height -
                        (AppBar().preferredSize.height +
                            MediaQuery.of(context).padding.top),
                    child: Center(
                      child: Text("No topics founds."),
                    ),
                  )
                : MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(() => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          padding: EdgeInsets.all(16),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          // itemCount: _subjectController.arrOfTopic.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      */ /* left: 16,
                                                    right: 16,*/ /*
                                      top: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          spreadRadius: 1,
                                          offset: Offset(0, 3),
                                          blurRadius: 15)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/ic_play_topic.png",
                                        width: Get.width * 0.12,
                                        height: Get.width * 0.12,
                                      ),
                                      */ /*Image.network(
                                                    'https://img.youtube.com/vi/26A-pptLgXs/0.jpg',
                                                    */ /* */ /*width: Get.width * 0.12,
                                                    height: Get.width * 0.12,*/ /* */ /*
                                                  ),*/ /*
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: RichText(
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: _subjectController
                                                  .arrOfTopic[index].name,
                                              style: textStyle10),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.transparent,
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    child: InkWell(
                                      onTap: () {
                                        _subjectController
                                            .activeTopicPosition.value = index;
                                        Get.to(PlayVideo(_subjectController
                                            .arrOfTopic[index]));
                                      },
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )),
                  ),*/
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                )),
        ));
  }

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(
            margin: EdgeInsets.only(top: 16),
            child: _subjectController.arrOfPdf.isEmpty &&
                    _subjectController.arrOfQuestionBank.isEmpty
                ? Container(
                    child: Center(
                      child: Text("Q-Bank Or Pdf not available."),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  )
                : _subjectController.arrOfPdf.isNotEmpty
                    ? ListView.builder(
                        itemCount: _subjectController.arrOfPdf.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              boxShadow: [boxShadow],
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: AppBar().preferredSize.height,
                            child: Material(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Get.to(PdfView(
                                      _subjectController.arrOfPdf[index].file));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: _subjectController
                                                  .arrOfPdf[index].title,
                                              style:
                                                  bodyMediumTestStyle.copyWith(
                                                      color: Colors.black)),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          onTap: () {
                                            Get.to(PdfView(_subjectController
                                                .arrOfPdf[index].file));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "View".toUpperCase(),
                                                style: bodyMediumTestStyle
                                                    .copyWith(
                                                        color: Colors.green),
                                              ),
                                            ),
                                            padding: EdgeInsets.all(4),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _subjectController.arrOfQuestionBank.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              boxShadow: [boxShadow],
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: AppBar().preferredSize.height + 50,
                            child: Material(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Get.to(QuestionBankTest(_subjectController
                                      .arrOfQuestionBank[index]));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: _subjectController
                                                      .arrOfQuestionBank[index]
                                                      .title
                                                      .toString() +
                                                  " Marks Question",
                                              style:
                                                  bodyMediumTestStyle.copyWith(
                                                      color: Colors.black)),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          )),
    );
  }*/
}
