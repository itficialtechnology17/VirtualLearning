import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/q-bank/type_of_question_bank.dart';
import 'package:virtual_learning/modules/test/test_page.dart';
import 'package:virtual_learning/page/play_video.dart';
import 'package:virtual_learning/utils/SABT.dart';
import 'package:virtual_learning/utils/url.dart';

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
        backgroundColor: Colors.transparent,
        body: Obx(() => _subjectController.isTopicLoading.value
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.lightGreenAccent,
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
                body: Container(
                  height: Get.height -
                      (AppBar().preferredSize.height +
                          Get.mediaQuery.padding.top),
                  child: Center(
                    child: SizedBox(
                      height: Get.width * 0.08,
                      width: Get.width * 0.08,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        backgroundColor: Colors.white10,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            : NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      expandedHeight: MediaQuery.of(context).size.height * 0.30,
                      floating: false,
                      brightness: Brightness.dark,
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
                      title: SABT(
                        child: Text(
                          _subjectController.selectedChapter.value.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      pinned: true,
                      flexibleSpace: Stack(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.green, Colors.green],
                              ),
                            ),
                            child: FlexibleSpaceBar(
                              collapseMode: CollapseMode.parallax,
                              background: Image.network(
                                storageUrl +
                                    _subjectController.arrOfTopic[0].icon,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ];
                },
                body: Scaffold(
                  body: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      /*borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )*/
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Chapter Topic".toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Obx(() => ListView.separated(
                                shrinkWrap: true,
                                itemCount: _subjectController.arrOfTopic.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
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
                                          _subjectController.activeTopicPosition
                                              .value = index;
                                          Get.to(PlayVideo());
                                        },
                                        borderRadius: BorderRadius.circular(24),
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
                                                  Row(
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
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                                text: _subjectController
                                                                    .arrOfTopic[
                                                                        index]
                                                                    .name,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        16)),
                                                            maxLines: 1,
                                                          ),
                                                          SizedBox(
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
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Material(
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
                                                            EdgeInsets.all(10),
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
                                                  ),
                                                  Material(
                                                    color: Colors.white,
                                                    type: MaterialType.circle,
                                                    child: InkWell(
                                                      splashColor: Colors.grey,
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
                                                        percent: 0.4,
                                                        backgroundColor:
                                                            Colors.white,
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
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                    fontSize: 16,
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
                                    fontSize: 16,
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
                        )
                      ],
                    ),
                  ),
                  /*Row(
                    children: [


                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          height: Get.height*0.06,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                  color: Colors.green,
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(24)),
                                    onTap: () {
                                      Get.to(TypeOfQuestionBank());
                                    },
                                    child: Expanded(
                                      child: Center(
                                        child: Container(
                                          child: Text("Practice".toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          padding: EdgeInsets.only(
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
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(24)),
                                    onTap: () {
                                      Get.to(TestPage(_subjectController
                                          .selectedChapter.value.name));
                                    },
                                    child: Expanded(
                                      child: Center(
                                        child: Container(
                                          child: Text("Test".toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          padding: EdgeInsets.only(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),*/
                ))));
  }
}
