import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/q-bank/question_bank_test.dart';
import 'package:virtual_learning/page/pdf_view.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class QuestionBankList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBankList();
  }
}

class _StateQuestionBankList extends State<QuestionBankList> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    _subjectController.getTopic();
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
          body: Obx(() => Stack(
                children: [
                  /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
                  Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: PreferredSize(
                        preferredSize:
                            Size.fromHeight(AppBar().preferredSize.height),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: margin8,
                                ),
                                Material(
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
                                SizedBox(
                                  width: margin8,
                                ),
                                Expanded(
                                  child: Text(
                                    _subjectController
                                        .selectedChapter.value.name,
                                    style: textStyle10Bold.copyWith(
                                        color:
                                            _themeController.textColor.value),
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                                SizedBox(
                                  width: margin8,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      body: Obx(
                        () => Container(
                          margin: EdgeInsets.all(margin16),
                          child: _subjectController.isTopicLoading.value
                              ? Padding(
                                  padding: EdgeInsets.all(margin16),
                                  child: ShimmerDummyPage(),
                                )
                              : _subjectController.arrOfPdf.isEmpty &&
                                      _subjectController
                                          .arrOfQuestionBank.isEmpty
                                  ? Container(
                                      child: Center(
                                        child: Text(
                                          "Q-Bank Or Pdf not available.",
                                          style: textStyle9.copyWith(
                                              color: _themeController
                                                  .textColor.value),
                                        ),
                                      ),
                                      height: Get.height -
                                          (AppBar().preferredSize.height),
                                    )
                                  : _subjectController.arrOfPdf.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: _subjectController
                                              .arrOfPdf.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 16),
                                              decoration: BoxDecoration(
                                                boxShadow: [boxShadow],
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.white,
                                              ),
                                              height:
                                                  AppBar().preferredSize.height,
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  onTap: () {
                                                    Get.to(PdfView(
                                                        _subjectController
                                                            .arrOfPdf[index]
                                                            .file));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 8),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: RichText(
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            text: TextSpan(
                                                                text: _subjectController
                                                                    .arrOfPdf[
                                                                        index]
                                                                    .title,
                                                                style: bodyMediumTestStyle
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black)),
                                                            maxLines: 2,
                                                          ),
                                                        ),
                                                        Material(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: InkWell(
                                                            splashColor:
                                                                Colors.white,
                                                            onTap: () {
                                                              Get.to(PdfView(
                                                                  _subjectController
                                                                      .arrOfPdf[
                                                                          index]
                                                                      .file));
                                                            },
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Container(
                                                              child: Center(
                                                                child: Text(
                                                                  "View"
                                                                      .toUpperCase(),
                                                                  style: bodyMediumTestStyle
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.green),
                                                                ),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
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
                                                        childAspectRatio:
                                                            2 / 0.7,
                                                        crossAxisSpacing: 16,
                                                        mainAxisSpacing: 16),

                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: _subjectController
                                                    .arrOfQuestionBank.length,
                                                // itemCount: _subjectController.arrOfTopic.length,
                                                itemBuilder: (context, index) {
                                                  return Material(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(QuestionBankTest(
                                                            _subjectController
                                                                    .arrOfQuestionBank[
                                                                index]));
                                                      },
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: Center(
                                                          child: RichText(
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            text: TextSpan(
                                                                text: _subjectController
                                                                        .arrOfQuestionBank[
                                                                            index]
                                                                        .title
                                                                        .toString() +
                                                                    " Marks",
                                                                style: textStyle10
                                                                    .copyWith(
                                                                        color: Color(
                                                                            0xff7FCB4F))),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                        ),
                      ))
                ],
              )),
        ));
  }
}
