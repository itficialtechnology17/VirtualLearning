import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/practice/question_bank_list.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateChapterTest();
  }
}

class _StateChapterTest extends State<ChapterList> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    _subjectController.getPractiseChapters();
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
                          Expanded(
                            child: Container(
                              // color: Colors.lightGreenAccent,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
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
                                            color: _themeController
                                                .iconColor.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      _subjectController
                                          .selectedSubject.value.name
                                          .toUpperCase(),
                                      style: textStyle10Bold.copyWith(
                                          color:
                                              _themeController.textColor.value),
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    body: _subjectController.isChapterLoading.value
                        ? Padding(
                            padding: EdgeInsets.all(margin16),
                            child: ShimmerDummyPage(),
                          )
                        : _subjectController.arrOfChapter.isEmpty
                            ? Center(
                                child: Text(
                                  "No Chapter found.",
                                  style: textStyle9.copyWith(
                                      color: _themeController.textColor.value),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(margin16),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Chapters of ",
                                            style: textStyle10Bold.copyWith(
                                                color: _themeController
                                                    .textColor.value)),
                                        TextSpan(
                                            text: _subjectController
                                                .selectedSubject.value.name,
                                            style: textStyle10Bold.copyWith(
                                                color: Color(0xff7FCB4F))),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: margin16,
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: _subjectController
                                          .arrOfChapter.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: margin8,
                                                horizontal: margin8),
                                            decoration: BoxDecoration(
                                              color: _themeController
                                                  .cardBackground.value,
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Colors.white,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      margin4),
                                              boxShadow: <BoxShadow>[
                                                !_themeController
                                                        .isDarkTheme.value
                                                    ? BoxShadow(
                                                        color: Colors.grey[300],
                                                        offset: Offset(0, 0),
                                                        blurRadius: 10.0,
                                                      )
                                                    : BoxShadow(),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      margin4),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        margin4),
                                                onTap: () {
                                                  _subjectController
                                                          .selectedChapter
                                                          .value =
                                                      _subjectController
                                                          .arrOfChapter[index];
                                                  _subjectController
                                                          .selectedChapterPosition =
                                                      index;
                                                  Get.to(QuestionBankList());
                                                },
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      // Text(
                                                      //   "" +
                                                      //       (index + 1)
                                                      //           .toString() +
                                                      //       ".",
                                                      //   style: textStyle11Bold
                                                      //       .copyWith(
                                                      //           color: Color(
                                                      //               0xff7FCB4F)),
                                                      // ),
                                                      SizedBox(
                                                        width: margin10,
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                        _subjectController
                                                            .arrOfChapter[index]
                                                            .name,
                                                        style: textStyle10
                                                            .copyWith(
                                                                color: Colors
                                                                    .black),
                                                        textScaleFactor: 1.0,
                                                      )),
                                                      SizedBox(
                                                        width: margin10,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .navigate_next_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        width: margin2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: margin16);
                                      },
                                    )
                                  ],
                                ),
                              ),
                  )
                ],
              )),
        ));
  }
}
