import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/page/play_video.dart';

class VideoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateVideoTab();
  }
}

class _StateVideoTab extends State<VideoTab> {
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          /*borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )*/
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            _subjectController.arrOfTopic.length == 0
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
                              itemCount: _subjectController.arrOfTopic.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          /* left: 16,
                                                    right: 16,*/
                                          top: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.05),
                                              spreadRadius: 1,
                                              offset: Offset(0, 3),
                                              blurRadius: 15)
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/ic_play_topic.png",
                                            width: Get.width * 0.12,
                                            height: Get.width * 0.12,
                                          ),
                                          /*Image.network(
                                                    'https://img.youtube.com/vi/26A-pptLgXs/0.jpg',
                                                    */ /*width: Get.width * 0.12,
                                                    height: Get.width * 0.12,*/ /*
                                                  ),*/
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
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Poppins",
                                                      fontSize: 12)),
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
                                                .activeTopicPosition
                                                .value = index;
                                            Get.to(PlayVideo(_subjectController
                                                .arrOfTopic[index]));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ) /*ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      _subjectController.arrOfTopic.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 1,
                                                blurRadius: 4)
                                          ],
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/ic_bg.png"),
                                              fit: BoxFit.fill)),
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(24),
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          onTap: () {
                                            _subjectController
                                                .activeTopicPosition
                                                .value = index;
                                            Get.to(PlayVideo(_subjectController
                                                .arrOfTopic[index]));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 16,
                                                    bottom: 16),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          */ /* Text(
                                                      _subjectController
                                                              .arrOfTopic[index]
                                                              .id
                                                              .toString() +
                                                          ". ".toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),*/ /*
                                                          SizedBox(
                                                            width: 16,
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
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  text: TextSpan(
                                                                      text: (index + 1)
                                                                              .toString() +
                                                                          ". " +
                                                                          _subjectController
                                                                              .arrOfTopic[
                                                                                  index]
                                                                              .name,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily:
                                                                              "Poppins",
                                                                          fontSize:
                                                                              16)),
                                                                ),
                                                                */ /*   SizedBox(
                                                                  height: 4,
                                                                ),
                                                                Text(
                                                                  _subjectController
                                                                          .arrOfTopic[
                                                                              index]
                                                                          .minutes +
                                                                      " Mins",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12),
                                                                ),*/ /*
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    */ /*Material(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (_subjectController
                                                                    .arrOfTopic[
                                                                        index]
                                                                    .isFavorite ==
                                                                0) {
                                                              _subjectController.setFavorite(
                                                                  _subjectController
                                                                      .arrOfTopic[
                                                                          index]
                                                                      .id
                                                                      .toString());

                                                              _subjectController
                                                                  .arrOfTopic[
                                                                      index]
                                                                  .isFavorite = 1;
                                                            } else {
                                                              _subjectController.removeFavorite(
                                                                  _subjectController
                                                                      .arrOfTopic[
                                                                          index]
                                                                      .isFavorite
                                                                      .toString());
                                                              _subjectController
                                                                  .arrOfTopic[
                                                                      index]
                                                                  .isFavorite = 0;
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Icon(
                                                            _subjectController
                                                                        .arrOfTopic[
                                                                            index]
                                                                        .isFavorite ==
                                                                    0
                                                                ? Icons
                                                                    .bookmark_border
                                                                : Icons
                                                                    .bookmark_outlined,
                                                            color: Colors.green,
                                                            size: 32,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),*/ /*
                                                    Material(
                                                      color: Colors.white,
                                                      type: MaterialType.circle,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.grey,
                                                        onTap: () {
                                                          _subjectController
                                                              .activeTopicPosition
                                                              .value = index;
                                                          Get.to(PlayVideo(
                                                              _subjectController
                                                                      .arrOfTopic[
                                                                  index]));
                                                        },
                                                        child:
                                                            CircularPercentIndicator(
                                                          radius: 30.0,
                                                          lineWidth: 2.0,
                                                          percent: 1.0,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          center: Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.green,
                                                            size: 20,
                                                          ),
                                                          progressColor:
                                                              Colors.green,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
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
                                )*/
                        ),
                  ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
