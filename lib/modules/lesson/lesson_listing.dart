import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/widgets/shimmer_chapter.dart';

class LessonListing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLessonListing();
  }
}

class _StateLessonListing extends State<LessonListing> {
  SubjectController _subjectController = Get.find();

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xff667db6), Color(0xff0082c8)])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

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
              _subjectController.selectedSubject.value.name,
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
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _subjectController.arrOfChapter.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            /*boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ],*/
                            image: DecorationImage(
                                image: AssetImage("assets/images/ic_bg.png"),
                                fit: BoxFit.fill)),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _subjectController.setSelectedChapter(index);
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 16),
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
                                          splashColor: Colors.white,
                                          onTap: () {
                                            _subjectController
                                                .setSelectedChapter(index);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            child: Center(
                                              child: Icon(
                                                Icons.navigate_next,
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
                  ),
                )),
        )
      ],
    );
  }
}
