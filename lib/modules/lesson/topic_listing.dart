import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/q-bank/type_of_question_bank.dart';
import 'package:virtual_learning/modules/test/test_page.dart';
import 'package:virtual_learning/page/notes_view.dart';
import 'package:virtual_learning/page/play_video.dart';

class TopicListing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTopicListing();
  }
}

class _StateTopicListing extends State<TopicListing> {
  SubjectController _subjectController = Get.find();

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xff667db6), Color(0xff0082c8)])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    _subjectController.getTopic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff0A0A78),
            Color(0xff14C269),
          ])),
        ),
        title: Text(
          _subjectController.selectedChapter.value.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: Container(
          child: Center(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  )),
                  width: double.infinity,
                  height: AppBar().preferredSize.height -
                      AppBar().preferredSize.height * 0.30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => _subjectController.isTopicLoading.value
          ? Container(
              child: Center(
                child: SizedBox(
                  width: Get.width * 0.05,
                  height: Get.width * 0.05,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
                  SizedBox(
                    height: 16,
                  ),
                  _subjectController.arrOfTopic.length == 0
                      ? Expanded(
                          child: Container(
                            height: Get.height -
                                (AppBar().preferredSize.height +
                                    MediaQuery.of(context).padding.top),
                            child: Center(
                              child: Text("No topics founds."),
                            ),
                          ),
                        )
                      : Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Obx(() => ListView.separated(
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
                                            Get.to(PlayVideo());
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
                                                          /* Text(
                                                      _subjectController
                                                              .arrOfTopic[index]
                                                              .id
                                                              .toString() +
                                                          ". ".toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),*/
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
                                                                /*   SizedBox(
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
                                                                ),*/
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    /*Material(
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
                                                    ),*/
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
                                                          Get.to(PlayVideo());
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
                                )),
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )),
      bottomNavigationBar: Obx(() => _subjectController.arrOfTopic.length > 0
          ? Container(
              height: Get.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(
                  horizontal: 16, vertical: Platform.isAndroid ? 0 : 24),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                            child: Text(
                          "Practice".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.grey[50],
                            onTap: () {
                              Get.to(TypeOfQuestionBank());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: Get.height * 0.06,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                            child: Text(
                          "Test".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.grey[50],
                            onTap: () {
                              Get.to(TestPage(_subjectController
                                  .selectedChapter.value.name));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: Get.height * 0.06,
                    color: Colors.white,
                  ),
                  _subjectController.selectedChapter.value.note != null
                      ? Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Center(
                                  child: Text(
                                "Notes".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.grey[50],
                                  onTap: () {
                                    Get.to(NotesView(_subjectController
                                        .selectedChapter.value.note.file
                                        .toString()));
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            )
          : Container(
              height: 1,
            )),
    );
  }
}
