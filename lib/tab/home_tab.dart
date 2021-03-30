import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/lesson/lesson_listing.dart';
import 'package:virtual_learning/modules/player/play_recent_video.dart';
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
  SubjectController _subjectController = Get.find();
  DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
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
                                "VirtualE",
                                style: textStyle11Bold,
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    child: Image.asset(
                                      ASSETS_ICONS_PATH + 'ic_search.png',
                                      height: iconHeightWidth,
                                      width: iconHeightWidth,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.all(margin16),
                  child: ListView(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Learn With",
                              style: textStyle12Bold.copyWith(
                                  color: Colors.black)),
                          TextSpan(
                              text: " Video Classes",
                              style: textStyle12Bold.copyWith(
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
                        childAspectRatio: 5 / 6,
                        children: List<Widget>.generate(
                            _subjectController.arrOfSubject.length, (index) {
                          return Container(
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _subjectController
                                                  .selectedSubject.value =
                                              _subjectController
                                                  .arrOfSubject[index];
                                          Get.to(LessonListing());
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
                                                      .arrOfSubject[index].icon,
                                              height: Get.height * 0.09,
                                              width: Get.height * 0.09,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              _subjectController
                                                  .arrOfSubject[index].name,
                                              textAlign: TextAlign.center,
                                              style: textStyle10,
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
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Where you",
                                        style: textStyle10Bold.copyWith(
                                            color: Colors.black)),
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        splashColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          Get.to(PlayRecentVideo(
                                              _dashboardController
                                                  .arrOfWatchHistory[index]));
                                          /* Get.to(YoutubeIframe(
                                                          _dashboardController
                                                                  .arrOfWatchHistory[
                                                              index]));*/
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
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
                                                height: iconMediumHeightWidth,
                                                width: iconMediumHeightWidth,
                                                fit: BoxFit.fitWidth,
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
                                                      text: TextSpan(
                                                          text: _dashboardController
                                                              .arrOfWatchHistory[
                                                                  index]
                                                              .name,
                                                          style: textStyle10),
                                                      maxLines: 1,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Continue Learning",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_outlined,
                                                            color: Colors.grey,
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
                                                fit: BoxFit.fitWidth,
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
                      Container(
                        width: Get.width,
                        height: 2,
                        color: Color(0xffE9E9E9),
                      ),
                      SizedBox(
                        height: margin10,
                      ),
                      Container(
                        height: Get.height * 0.10,
                        decoration: BoxDecoration(
                            color: Color(0xff17212A),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Share With",
                                          style: textStyle10Bold.copyWith(
                                              color: Colors.white)),
                                      TextSpan(
                                          text: " Friends",
                                          style: textStyle10Bold.copyWith(
                                              color: Color(0xff7FCB4F))),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: margin4,
                                  ),
                                  Text(
                                    "Lorem Ipsum Dolor sit Amet sed do consectetur adipiscing elit",
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
                      )
                      /*GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 8 / 10,
                      children: List.generate(
                          _subjectController.arrOfSubject.length, (index) {
                        return Container(
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _subjectController
                                                .selectedSubject.value =
                                            _subjectController
                                                .arrOfSubject[index];
                                        Get.to(LessonListing());
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
                                                    .arrOfSubject[index].icon,
                                            height: Get.height * 0.09,
                                            width: Get.height * 0.09,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            _subjectController
                                                .arrOfSubject[index].name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ))));
                      })),*/
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
