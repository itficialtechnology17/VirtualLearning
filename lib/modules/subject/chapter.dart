import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/search/search_page.dart';
import 'package:virtual_learning/shimmer/shimmer_chapter_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

import 'custom_recent_video_player.dart';
import 'custom_video_player.dart';

class Chapter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateChapter();
  }
}

class _StateChapter extends State<Chapter> {
  ThemeController _themeController = Get.find();

  SubjectController _subjectController = Get.find();
  DashboardController _dashboardController = Get.find();

  var arrOfChapterBG = [
    'https://itficial.app/virtuale/storage/pencils-5096372_960_720.jpeg',
  ];

  List<Color> colors = [
    Color(0xff0A0A78),
    Color(0xffF9CC12),
    Color(0xff22813D),
    // Color(0xff00B4FF),
    // Color(0xff17212A),
    Color(0xff4E2A99),
    // Color(0xff7FCB4F),
    Color(0xffFD5CA0),
  ];

  @override
  void initState() {
    super.initState();

    _subjectController.getChapters();
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
                                          color:
                                              _themeController.iconColor.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    _subjectController
                                        .selectedSubject.value.name
                                        .toUpperCase(),
                                    style: textStyle10Bold.copyWith(
                                        color:
                                            _themeController.textColor.value),
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
                                          color:
                                              _themeController.iconColor.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin4,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    body: _subjectController.isChapterLoading.value
                        ? ShimmerChapterPage()
                        : Container(
                            // padding: EdgeInsets.only(
                            //     left: margin16, top: margin2, bottom: margin2),
                            child: ListView(
                              children: [
                                _subjectController.arrOfWatchHistory.isNotEmpty
                                    ? ListView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: margin12),
                                            child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "Resume Where",
                                                    style: textStyle10Bold
                                                        .copyWith(
                                                            color:
                                                                _themeController
                                                                    .textColor
                                                                    .value)),
                                                TextSpan(
                                                    text: " you Left",
                                                    style: textStyle10Bold
                                                        .copyWith(
                                                            color: Color(
                                                                0xff7FCB4F))),
                                              ]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: margin24,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      CustomRecentVideoPlayer(
                                                          _subjectController
                                                                  .arrOfWatchHistory[
                                                              0]));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: margin12),
                                                  width: Get.width * 0.45,
                                                  height: Get.width * 0.30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          getRandomBG()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: Get.width * 0.45,
                                                        height:
                                                            Get.width * 0.30,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color:
                                                              getRandomColor()
                                                                  .withOpacity(
                                                                      0.80),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: margin4,
                                                            bottom: margin24,
                                                            right: margin20,
                                                          ),
                                                          child: RichText(
                                                            maxLines: 3,
                                                            textAlign:
                                                                TextAlign.left,
                                                            text: TextSpan(
                                                                style: textStyle9
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                                text: _subjectController
                                                                    .arrOfWatchHistory[
                                                                        0]
                                                                    .name),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom:
                                                                      margin4,
                                                                  right:
                                                                      margin4),
                                                          child: Material(
                                                            color: _themeController
                                                                .playIconBGColor
                                                                .value,
                                                            type: MaterialType
                                                                .circle,
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Get.to(() =>
                                                                    CustomRecentVideoPlayer(
                                                                        _subjectController
                                                                            .arrOfWatchHistory[0]));
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        margin2),
                                                                child: Icon(
                                                                  Icons
                                                                      .play_arrow,
                                                                  color: _themeController
                                                                      .playIconColor
                                                                      .value,
                                                                  size:
                                                                      iconHeightWidth,
                                                                ),
                                                                /*child: Image.asset(
                                            ASSETS_ICONS_PATH + 'ic_play.png',
                                            height: iconHeightWidth - 8,
                                            width: iconHeightWidth - 8,
                                            fit: BoxFit.fill,
                                          ),*/
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                          SizedBox(
                                            height: margin24,
                                          ),
                                          Container(
                                            width: Get.width,
                                            height: 2,
                                            margin: EdgeInsets.only(
                                                right: margin16),
                                            color: Color(0xffE9E9E9),
                                          ),
                                          SizedBox(
                                            height: margin4,
                                          )
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                _subjectController.arrOfChapter.isEmpty
                                    ? Container(
                                        height: Get.height -
                                            AppBar().preferredSize.height,
                                        child: Center(
                                          child: Text(
                                            "No Chpater Found",
                                            style: textStyle9.copyWith(
                                                color: _themeController
                                                    .textColor.value),
                                          ),
                                        ),
                                      )
                                    : MediaQuery.removePadding(
                                        removeTop: true,
                                        context: context,
                                        child: ListView.builder(
                                          itemCount: _subjectController
                                              .arrOfChapter.length,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: margin8,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: margin12,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        _subjectController
                                                            .arrOfChapter[index]
                                                            .name,
                                                        style: textStyle10Bold
                                                            .copyWith(
                                                                color:
                                                                    _themeController
                                                                        .textColor
                                                                        .value),
                                                        textScaleFactor: 1.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: margin10,
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {
                                                          // Get.to(ChapterDetails());

                                                          _subjectController
                                                                  .selectedChapterPosition =
                                                              index;
                                                          _subjectController
                                                              .selectedTab
                                                              .value = 0;

                                                          _subjectController
                                                              .setSelectedChapter(
                                                                  index);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  margin8),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 0),
                                                            child: Text(
                                                              "View All(" +
                                                                  _subjectController
                                                                      .arrOfChapter[
                                                                          index]
                                                                      .topicCount
                                                                      .toString() +
                                                                  ")".toUpperCase(),
                                                              style: textStyle9Bold
                                                                  .copyWith(
                                                                      color: Color(
                                                                          0xff7FCB4F)),
                                                              textScaleFactor:
                                                                  1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: margin4,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: _subjectController
                                                              .arrOfChapter[
                                                                  index]
                                                              .topic
                                                              .length ==
                                                          0
                                                      ? 0
                                                      : Get.width * 0.30,
                                                  margin: EdgeInsets.only(
                                                      top: margin4),
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        _subjectController
                                                            .arrOfChapter[index]
                                                            .topic
                                                            .length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, topicIndex) {
                                                      return Container(
                                                        width: Get.width * 0.45,
                                                        height:
                                                            Get.width * 0.25,
                                                        margin: EdgeInsets.only(
                                                            left: margin12,
                                                            right: topicIndex ==
                                                                    _subjectController
                                                                            .arrOfChapter[index]
                                                                            .topic
                                                                            .length -
                                                                        1
                                                                ? margin12
                                                                : 0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    _subjectController
                                                                        .arrOfChapter[
                                                                            index]
                                                                        .topic[
                                                                            topicIndex]
                                                                        .image),
                                                                fit: BoxFit
                                                                    .cover)),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: InkWell(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            onTap: () {
                                                              if (_subjectController
                                                                      .arrOfChapter[
                                                                          index]
                                                                      .topic[
                                                                          topicIndex]
                                                                      .content
                                                                      .video ==
                                                                  null) {
                                                                showToast(
                                                                    "Video Not Found");
                                                              } else {
                                                                _subjectController
                                                                        .selectedChapterPosition =
                                                                    index;
                                                                _subjectController
                                                                        .selectedTopicPosition =
                                                                    topicIndex;
                                                                _subjectController
                                                                    .getNextFourVideo();
                                                                Get.to(CustomVideoPlayer(_subjectController
                                                                        .arrOfChapter[_subjectController
                                                                            .selectedChapterPosition]
                                                                        .topic[
                                                                    _subjectController
                                                                        .selectedTopicPosition]));
                                                              }
                                                            },
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.45,
                                                                  height:
                                                                      Get.width *
                                                                          0.30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    color: HexColor.fromHex(_subjectController
                                                                            .arrOfChapter[
                                                                                index]
                                                                            .topic[
                                                                                topicIndex]
                                                                            .color)
                                                                        .withOpacity(
                                                                            0.80),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left:
                                                                          margin4,
                                                                      bottom:
                                                                          margin24,
                                                                      right:
                                                                          margin20,
                                                                    ),
                                                                    child:
                                                                        RichText(
                                                                      maxLines:
                                                                          3,
                                                                      textScaleFactor:
                                                                          1.0,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      text: TextSpan(
                                                                          style: textStyle9.copyWith(
                                                                              color: Colors
                                                                                  .white),
                                                                          text: _subjectController
                                                                              .arrOfChapter[index]
                                                                              .topic[topicIndex]
                                                                              .name),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            margin4,
                                                                        right:
                                                                            margin4),
                                                                    child:
                                                                        Material(
                                                                      color: _themeController
                                                                          .playIconBGColor
                                                                          .value,
                                                                      type: MaterialType
                                                                          .circle,
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          if (_subjectController.arrOfChapter[index].topic[topicIndex].content.video ==
                                                                              null) {
                                                                            showToast("Video Not Found");
                                                                          } else {
                                                                            _subjectController.selectedChapterPosition =
                                                                                index;
                                                                            _subjectController.selectedTopicPosition =
                                                                                topicIndex;
                                                                            _subjectController.getNextFourVideo();
                                                                            Get.to(CustomVideoPlayer(_subjectController.arrOfChapter[_subjectController.selectedChapterPosition].topic[_subjectController.selectedTopicPosition]));
                                                                          }
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(margin2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.play_arrow,
                                                                            color:
                                                                                _themeController.playIconColor.value,
                                                                            size:
                                                                                iconHeightWidth,
                                                                          ),
                                                                          /*child: Image.asset(
                                                      ASSETS_ICONS_PATH +
                                                          'ic_play.png',
                                                      height:
                                                          iconHeightWidth - 8,
                                                      width:
                                                          iconHeightWidth - 8,
                                                      fit: BoxFit.fill,
                                                    ),*/
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: margin24,
                                                ),
                                                index == 5
                                                    ? SizedBox.shrink()
                                                    : Container(
                                                        width: Get.width,
                                                        height: 2,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    margin16),
                                                        color:
                                                            Color(0xffE9E9E9),
                                                      ),
                                              ],
                                            );
                                          },
                                        ),
                                      )
                              ],
                            ),
                          ),
                  )
                ],
              )),
        ));
  }

  getRandomBG() {
    return (arrOfChapterBG.toList()..shuffle()).first;
  }

  getRandomColor() {
    return (colors.toList()..shuffle()).first;
  }
}
