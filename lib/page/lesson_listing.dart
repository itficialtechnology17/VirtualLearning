import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/page/play_video.dart';
import 'package:virtual_learning/q-bank/type_of_question_bank.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/widgets/shimmer_chapter.dart';

class LessonListing extends StatefulWidget {
  ModelSubject modelSubject;

  LessonListing.modelSubject(_) {
    this.modelSubject = _;
  }

  @override
  State<StatefulWidget> createState() {
    return _StateLessonListing();
  }
}

class _StateLessonListing extends State<LessonListing> {
  //0xffF6F2FF

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xff667db6), Color(0xff0082c8)])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  var selectedPosition = -1;

  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    _subjectController.getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ic_bg.png"),
                    fit: BoxFit.fill))),
        Scaffold(
          backgroundColor: Colors.white.withOpacity(0.75),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
            centerTitle: true,
            title: Text(
              widget.modelSubject.name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            leading: Container(
              child: Center(
                child: Material(
                  color: Color(0xffD0E6EE),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Obx(() => _subjectController.isChapterLoading.value
              ? ShimmerChapter()
              : Container(
                  color: Colors.transparent,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _subjectController.arrOfChapter.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        decoration: index == selectedPosition
                            ? BoxDecoration(
                                color: Colors.green[200],
                                borderRadius: BorderRadius.circular(24))
                            : null,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              setState(() {
                                if (index == selectedPosition) {
                                  selectedPosition = -1;
                                } else {
                                  selectedPosition = index;
                                }
                              });
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 8),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.network(
                                          defaultChapterIcon,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lesson " +
                                                  _subjectController
                                                      .arrOfChapter[index].name
                                                      .substring(0, 1),
                                              style: TextStyle(
                                                  color: Colors.lightBlue,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: _subjectController
                                                      .arrOfChapter[index].name,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Poppins",
                                                      fontSize: 15)),
                                              maxLines: 1,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Minutes: " +
                                                  _subjectController
                                                      .arrOfChapter[index]
                                                      .minutes,
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          splashColor: Colors.green,
                                          onTap: () {
                                            setState(() {
                                              if (index == selectedPosition) {
                                                selectedPosition = -1;
                                              } else {
                                                selectedPosition = index;
                                              }
                                            });
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            child: Center(
                                              child: Icon(
                                                index == selectedPosition
                                                    ? Icons.remove
                                                    : Icons.add,
                                                size: 15,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: index == selectedPosition ? 1 : 0,
                                  curve: Curves.easeIn,
                                  duration: Duration(seconds: 1),
                                  child: Visibility(
                                    visible: index == selectedPosition
                                        ? true
                                        : false,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(16),
                                          child: ListView.separated(
                                            itemCount: 3,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, nIndex) {
                                              return Container(
                                                padding: EdgeInsets.only(
                                                    top: 8, bottom: 8),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        nIndex == 0
                                                            ? Container(
                                                                height: 15,
                                                                width: 15,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    shape: BoxShape
                                                                        .circle),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 3),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "assets/images/ic_done.png"),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 15,
                                                                width: 15,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 3),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .green,
                                                                        width:
                                                                            1),
                                                                    shape: BoxShape
                                                                        .circle),
                                                              ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 16,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                                text:
                                                                    "Basic What is VirtualE ?",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        13)),
                                                            maxLines: 2,
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          Row(
                                                            children: [
                                                              /*Material(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          TypeOfQuestionBank()));
                                                        },
                                                        child: Container(
                                                          child: Text("Q-Bank",
                                                              style: TextStyle(
                                                                  foreground: Paint()
                                                                    ..shader =
                                                                        linearGradient)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16,
                                                                  right: 16,
                                                                  top: 4,
                                                                  bottom: 4),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                            .grey[
                                                                        200],
                                                                    blurRadius:
                                                                        2,
                                                                    spreadRadius:
                                                                        1)
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                        ),
                                                      ),
                                                    ),*/
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            16),
                                                                child: Text(
                                                                    "Test",
                                                                    style: TextStyle(
                                                                        foreground: Paint()
                                                                          ..shader =
                                                                              linearGradient)),
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16,
                                                                        top: 4,
                                                                        bottom:
                                                                            4),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors.grey[
                                                                              200],
                                                                          blurRadius:
                                                                              2,
                                                                          spreadRadius:
                                                                              1)
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16)),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.white,
                                                      type: MaterialType.circle,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.grey,
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PlayVideo()));
                                                        },
                                                        child:
                                                            CircularPercentIndicator(
                                                          radius: 30.0,
                                                          lineWidth: 2.0,
                                                          percent: 0.2,
                                                          backgroundColor:
                                                              Colors.green[50],
                                                          center: Icon(
                                                            Icons.play_arrow,
                                                            color: Colors
                                                                .green[300],
                                                            size: 20,
                                                          ),
                                                          progressColor:
                                                              Colors.green[300],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, nIndex) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                color: Colors.grey[200],
                                                height: 0.5,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Color(0xffff5e62),
                                                Color(0xffff9966)
                                              ]),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(24),
                                                  bottomLeft:
                                                      Radius.circular(24))),
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Material(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  24)),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24)),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TypeOfQuestionBank()));
                                                    },
                                                    child: Expanded(
                                                      child: Center(
                                                        child: Container(
                                                          child: Text(
                                                              "Q-Bank"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16,
                                                                  right: 16,
                                                                  top: 4,
                                                                  bottom: 4),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                              Expanded(
                                                child: Material(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  24)),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    24)),
                                                    onTap: () {},
                                                    child: Expanded(
                                                      child: Center(
                                                        child: Container(
                                                          child: Text(
                                                              "Test"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16,
                                                                  right: 16,
                                                                  top: 4,
                                                                  bottom: 4),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
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
                        height: 10,
                      );
                    },
                  ),
                )),
        )
      ],
    );
  }
}
