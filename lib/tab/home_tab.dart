import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/subject/chapter.dart';
import 'package:virtual_learning/modules/subject/custom_recent_video_player.dart';
import 'package:virtual_learning/shimmer/shimmer_main_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHome();
  }
}

class _StateHome extends State<HomeTab> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();
  DashboardController _dashboardController = Get.find();

  @override
  void initState() {
    super.initState();
    // getThemeMode();
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

    return Obx(() => Stack(
          children: [
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: margin4,
                            ),
                            Padding(
                              padding: EdgeInsets.all(margin8),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  child: Image.asset(
                                    ASSETS_ICONS_PATH + 'ic_small_logo.png',
                                    height: iconHeightWidth,
                                    width: iconHeightWidth,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Virtual E",
                              style: textStyle11Bold.copyWith(
                                  color: _themeController.textColor.value),
                              textScaleFactor: 1.0,
                            ),
                            Spacer(),
                            Switch(
                              value: _themeController.isDarkTheme.value,
                              onChanged: (value) {
                                setState(() {
                                  _themeController.isDarkTheme.value = value;

                                  _themeController.setTheme();
                                });
                              },
                              activeTrackColor: Colors.green,
                              activeColor: Colors.white,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                            ),
                            // Material(
                            //   color: Colors.transparent,
                            //   child: InkWell(
                            //     onTap: () {
                            //       if (!_dashboardController
                            //           .isDashboardLoading.value) {
                            //         Get.to(SearchPage());
                            //       }
                            //     },
                            //     child: Padding(
                            //       padding: EdgeInsets.all(margin8),
                            //       child: Image.asset(
                            //         ASSETS_ICONS_PATH + 'ic_search.png',
                            //         height: iconHeightWidth,
                            //         width: iconHeightWidth,
                            //         fit: BoxFit.fitWidth,
                            //         color: _themeController.iconColor.value,
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
              body: _dashboardController.isDashboardLoading.value
                  ? ShimmerMainPage()
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: margin16),
                      child: ListView(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Choose",
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value)),
                              TextSpan(
                                  text: " Subject",
                                  style: textStyle10Bold.copyWith(
                                      color: Color(0xff7FCB4F))),
                            ]),
                          ),
                          SizedBox(
                            height: margin24,
                          ),
                          GridView.count(
                            crossAxisCount: 3,
                            // mainAxisSpacing: margin16,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 5 / 6,
                            children: List<Widget>.generate(
                                _subjectController.arrOfSubject.length,
                                (index) {
                              return Container(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _subjectController
                                                      .selectedSubjectPosition =
                                                  index;
                                              _subjectController
                                                      .selectedSubject.value =
                                                  _subjectController
                                                      .arrOfSubject[index];
                                              // Get.to(LessonListing());

                                              Get.to(() => Chapter());
                                            });
                                          },
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  storageUrl +
                                                      _subjectController
                                                          .arrOfSubject[index]
                                                          .icon,
                                                  height: Get.height * 0.09,
                                                  width: Get.height * 0.09,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                RichText(
                                                  textScaleFactor: 1.0,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                      style: textStyle10.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              _themeController
                                                                  .textColor
                                                                  .value),
                                                      text: getTwoWordsName(
                                                          _subjectController
                                                              .arrOfSubject[
                                                                  index]
                                                              .name)),
                                                )
                                              ],
                                            ),
                                          ))));
                              ;
                            }),
                          ),
                          SizedBox(
                            height: margin10,
                          ),
                          Container(
                            width: Get.width,
                            height: 2,
                            color: Color(0xffE9E9E9),
                          ),
                          SizedBox(
                            height: margin10,
                          ),
                          _dashboardController.arrOfWatchHistory.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textScaleFactor: 1.0,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Where you",
                                            style: textStyle10Bold.copyWith(
                                                color: _themeController
                                                    .textColor.value)),
                                        TextSpan(
                                            text: " Left",
                                            style: textStyle10Bold.copyWith(
                                                color: Color(0xff7FCB4F))),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _dashboardController
                                                  .arrOfWatchHistory.length >
                                              3
                                          ? 3
                                          : _dashboardController
                                              .arrOfWatchHistory.length,
                                      itemBuilder: (context, index) {
                                        return Material(
                                          color: _themeController
                                              .cardBackground.value,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              Get.to(() =>
                                                  CustomRecentVideoPlayer(
                                                      _dashboardController
                                                              .arrOfWatchHistory[
                                                          index]));
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: margin16,
                                                  ),
                                                  Image.network(
                                                    storageUrl +
                                                        _dashboardController
                                                            .arrOfWatchHistory[
                                                                index]
                                                            .standardIcon,
                                                    height:
                                                        iconMediumHeightWidth,
                                                    width:
                                                        iconMediumHeightWidth,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                  SizedBox(
                                                    width: margin16,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor: 1.0,
                                                          text: TextSpan(
                                                              text: _dashboardController
                                                                  .arrOfWatchHistory[
                                                                      index]
                                                                  .name,
                                                              style: textStyle10.copyWith(
                                                                  color: _themeController
                                                                      .textColor
                                                                      .value)),
                                                          maxLines: 1,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Continue Learning",
                                                              textScaleFactor:
                                                                  1.0,
                                                              style: textStyle9.copyWith(
                                                                  color: _themeController
                                                                      .textColor
                                                                      .value),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 2),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward_outlined,
                                                                color:
                                                                    Colors.grey,
                                                                size: 10,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: margin16,
                                                  ),
                                                  Image.asset(
                                                    ASSETS_ICONS_PATH +
                                                        'ic_play.png',
                                                    height: iconHeightWidth,
                                                    width: iconHeightWidth,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                    width: margin16,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 16,
                                        );
                                      },
                                    )
                                  ],
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: margin10,
                          ),
                          _dashboardController.arrOfWatchHistory.isNotEmpty
                              ? Container(
                                  width: Get.width,
                                  height: 2,
                                  color: Color(0xffE9E9E9),
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: _dashboardController
                                    .arrOfWatchHistory.isNotEmpty
                                ? margin10
                                : 0,
                          ),
                          Material(
                            color: Color(0xff17212A),
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                shareApp();
                              },
                              child: Container(
                                height: Get.height * 0.10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: margin16,
                                    ),
                                    Image.asset(
                                      ASSETS_IMAGE_PATH + 'ic_share.png',
                                      height: iconLargeHeightWidth,
                                      width: iconLargeHeightWidth,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: margin16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            textScaleFactor: 1.0,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "App",
                                                  style:
                                                      textStyle10Bold.copyWith(
                                                          color: Colors.white)),
                                              TextSpan(
                                                  text: " Share",
                                                  style:
                                                      textStyle10Bold.copyWith(
                                                          color: Color(
                                                              0xff7FCB4F))),
                                            ]),
                                          ),
                                          SizedBox(
                                            height: margin4,
                                          ),
                                          Text(
                                            "Share app with your Friends & Family",
                                            textScaleFactor: 1.0,
                                            style: textStyle9.copyWith(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: margin16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: margin10,
                          ),
                        ],
                      ),
                    ),
            )
          ],
        ));
  }

  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'VirtuaE',
        text: '*VirtuaE* Share app & start learning',
        linkUrl:
            'https://play.google.com/store/apps/details?id=com.virtual.virtual_learning');
  }
}
