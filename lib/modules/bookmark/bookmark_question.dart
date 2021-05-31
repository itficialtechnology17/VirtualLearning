import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/bookmark_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_bookmark.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class BookMarkQuestion extends StatefulWidget {
  final TopicQuestion topicQuestion;
  final int position;
  final int index;
  BookMarkQuestion(this.topicQuestion, this.position, this.index);

  @override
  _BookMarkQuestionState createState() => _BookMarkQuestionState();
}

class _BookMarkQuestionState extends State<BookMarkQuestion> {
  BookmarkController _bookmarkController = Get.find();
  SubjectController _subjectController = Get.find();
  ThemeController _themeController = Get.find();

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
          body: Stack(
            children: [
              Scaffold(
                backgroundColor: _themeController.background.value,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                  child: Container(
                    // color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Container(
                          // color: Colors.lightGreenAccent,
                          child: Stack(
                            alignment: Alignment.center,
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
                                          color:
                                              _themeController.iconColor.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Bookmark",
                                  style: textStyle11Bold.copyWith(
                                      color: _themeController.textColor.value),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 2,
                      margin: EdgeInsets.symmetric(horizontal: margin8),
                      color: Color(0xffE9E9E9),
                    ),
                    Container(
                      // color: Colors.lightGreenAccent,
                      child: Row(
                        children: [
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget.topicQuestion.isFavorite == 0) {
                                    _subjectController.setFavorite(widget
                                        .topicQuestion.topicId
                                        .toString());

                                    _bookmarkController
                                        .arrOfBookmark[widget.position]
                                        .topicQuestion[widget.index]
                                        .isFavorite = 1;
                                  } else {
                                    _subjectController.removeFavorite(
                                        _bookmarkController
                                            .arrOfBookmark[widget.position]
                                            .topicQuestion[widget.index]
                                            .isFavorite
                                            .toString(),
                                        true);

                                    _bookmarkController
                                        .arrOfBookmark[widget.position]
                                        .topicQuestion[widget.index]
                                        .isFavorite = 0;
                                  }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Icon(
                                  widget.topicQuestion.isFavorite != 0
                                      ? Icons.bookmark
                                      : Icons.bookmark_border_outlined,
                                  color: Colors.green,
                                  size: iconHeightWidth,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: margin8,
                          )
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          child: Html(
                              data: widget.topicQuestion.question.toString(),
                              style: {
                                "body": Style(
                                    fontFamily: "Nunito",
                                    color: _themeController.textColor.value),
                              }),
                        ),
                        // Spacer(),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.topicQuestion.answers.length,
                            itemBuilder: (context, answerIndex) {
                              return Container(
                                margin:
                                    EdgeInsets.only(bottom: Get.height * 0.03),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: widget
                                                  .topicQuestion
                                                  .answers[answerIndex]
                                                  .isRight ==
                                              1
                                          ? Colors.green
                                          : Colors.white,

                                      borderRadius:
                                          BorderRadius.circular(margin24), //
                                      boxShadow: <BoxShadow>[
                                        !_themeController.isDarkTheme.value
                                            ? BoxShadow(
                                                color: Colors.grey[300],
                                                offset: Offset(0, 0),
                                                blurRadius: 10.0,
                                              )
                                            : BoxShadow(),
                                      ],
                                    ),
                                    child: Container(
                                      // padding: EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Html(
                                                  data: widget
                                                      .topicQuestion
                                                      .answers[answerIndex]
                                                      .answer,
                                                  style: {
                                                    "body": Style(
                                                        fontFamily: "Nunito",
                                                        color: widget
                                                                    .topicQuestion
                                                                    .answers[
                                                                        answerIndex]
                                                                    .isRight ==
                                                                1
                                                            ? Colors.white
                                                            : Colors.black),
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            width: margin16,
                                          ),
                                          widget
                                                      .topicQuestion
                                                      .answers[answerIndex]
                                                      .isRight ==
                                                  1
                                              ? Image.asset(
                                                  "assets/icons/ic_right.png",
                                                  width: iconHeightWidth - 5,
                                                  height: iconHeightWidth - 5,
                                                )
                                              : SizedBox.shrink(),
                                          SizedBox(
                                            width: margin16,
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ),
                        ),
                        widget.topicQuestion.solution == null
                            ? SizedBox.shrink()
                            : Container(
                                decoration: BoxDecoration(
                                    color:
                                        _themeController.cardBackground.value,
                                    borderRadius:
                                        BorderRadius.circular(margin8),
                                    border:
                                        Border.all(color: Color(0xff38AF48))),
                                padding: EdgeInsets.all(margin16),
                                margin:
                                    EdgeInsets.symmetric(horizontal: margin16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Solution:",
                                      style: textStyle10Bold.copyWith(
                                          color: Color(0xff22813D)),
                                    ),
                                    SizedBox(
                                      height: margin8,
                                    ),
                                    Html(
                                        data: widget.topicQuestion.solution,
                                        style: {
                                          "body": Style(
                                              color: _themeController
                                                  .textColor.value,
                                              fontFamily: "Nunito"),
                                        })
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: margin16,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
