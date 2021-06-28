import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/lesson/tab/notes_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/q_bank_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/test_description_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/video_tab.dart';
import 'package:virtual_learning/modules/search/search_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateChapterDetails();
  }
}

class _StateChapterDetails extends State<ChapterDetails> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  final List<Widget> listOfTab = [
    VideoTab(),
    TestDescriptionTab(),
    QuestionBankTab(),
    NotesTab(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

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
        body: Obx(() => Stack(children: [
              /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
              Scaffold(
                  backgroundColor: _themeController.background.value,
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
                            child: Row(
                              children: [
                                SizedBox(
                                  width: margin4,
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
                                Spacer(),
                                Text(
                                  _subjectController.selectedSubject.value.name
                                      .toUpperCase(),
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
                                  textScaleFactor: 1.0,
                                ),
                                Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  type: MaterialType.circle,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(SearchPage());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Image.asset(
                                        ASSETS_ICONS_PATH + 'ic_search.png',
                                        height: iconHeightWidth,
                                        width: iconHeightWidth,
                                        fit: BoxFit.fitWidth,
                                        color: _themeController.iconColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  body: Container(
                      padding: EdgeInsets.only(
                          left: margin16, top: margin2, bottom: margin2),
                      child: Column(children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: _subjectController
                                    .selectedChapter.value.name,
                                style: textStyle10Bold.copyWith(
                                    color: _themeController.textColor.value)),
                          ]),
                        ),
                        SizedBox(
                          height: margin24,
                        ),
                        Row(
                          children: [
                            // SizedBox(width: margin16),
                            Expanded(
                              child: Material(
                                color: _subjectController.selectedTab.value == 0
                                    ? Color(0xff7FCB4F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    setState(() {
                                      _subjectController.selectedTab.value = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: margin10,
                                        horizontal: margin8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + 'ic_play.png',
                                          height: iconHeightWidth,
                                          width: iconHeightWidth,
                                          fit: BoxFit.contain,
                                          color: _subjectController
                                                      .selectedTab.value ==
                                                  0
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin4,
                                        ),
                                        Text(
                                          "Video".toUpperCase(),
                                          textScaleFactor: 1.0,
                                          style: textStyle9Bold.copyWith(
                                              color: _subjectController
                                                          .selectedTab.value ==
                                                      0
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: margin10),
                            Expanded(
                              child: Material(
                                color: _subjectController.selectedTab.value == 1
                                    ? Color(0xff7FCB4F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    setState(() {
                                      _subjectController.selectedTab.value = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: margin10,
                                        horizontal: margin8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + 'ic_test.png',
                                          height: iconHeightWidth,
                                          width: iconHeightWidth,
                                          fit: BoxFit.contain,
                                          color: _subjectController
                                                      .selectedTab.value ==
                                                  1
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin4,
                                        ),
                                        Text(
                                          "Test".toUpperCase(),
                                          textScaleFactor: 1.0,
                                          style: textStyle9Bold.copyWith(
                                              color: _subjectController
                                                          .selectedTab.value ==
                                                      1
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: margin10),
                            Expanded(
                              child: Material(
                                color: _subjectController.selectedTab.value == 2
                                    ? Color(0xff7FCB4F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    setState(() {
                                      _subjectController.selectedTab.value = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: margin10,
                                        horizontal: margin8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + 'ic_puzzle.png',
                                          height: iconHeightWidth,
                                          width: iconHeightWidth,
                                          fit: BoxFit.contain,
                                          color: _subjectController
                                                      .selectedTab.value ==
                                                  2
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin4,
                                        ),
                                        Text(
                                          "Q-Bank".toUpperCase(),
                                          textScaleFactor: 1.0,
                                          style: textStyle9Bold.copyWith(
                                              color: _subjectController
                                                          .selectedTab.value ==
                                                      2
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: margin10),
                            Expanded(
                              child: Material(
                                color: _subjectController.selectedTab.value == 3
                                    ? Color(0xff7FCB4F)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    setState(() {
                                      _subjectController.selectedTab.value = 3;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: margin10,
                                        horizontal: margin8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ASSETS_ICONS_PATH + 'ic_notes.png',
                                          height: iconHeightWidth,
                                          width: iconHeightWidth,
                                          fit: BoxFit.contain,
                                          color: _subjectController
                                                      .selectedTab.value ==
                                                  3
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        SizedBox(
                                          height: margin4,
                                        ),
                                        Text(
                                          "Notes".toUpperCase(),
                                          textScaleFactor: 1.0,
                                          style: textStyle9Bold.copyWith(
                                              color: _subjectController
                                                          .selectedTab.value ==
                                                      3
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: margin10),
                          ],
                        ),
                        SizedBox(
                          height: margin24,
                        ),
                        Expanded(
                          child: PageStorage(
                            bucket: bucket,
                            child:
                                listOfTab[_subjectController.selectedTab.value],
                          ),
                        )
                      ])))
            ]))));
  }
}
