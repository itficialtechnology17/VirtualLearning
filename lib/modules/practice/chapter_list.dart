import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/practice/question_bank_list.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateChapterTest();
  }
}

class _StateChapterTest extends State<ChapterList> {
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    if (_subjectController.arrOfChapter.isEmpty) {
      _subjectController.getChapters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
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
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  _subjectController.selectedSubject.value.name
                                      .toUpperCase(),
                                  style: textStyle10Bold,
                                  textScaleFactor: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                body: _subjectController.isChapterLoading.value
                    ? Center(
                        child: SizedBox(
                          width: iconHeightWidth + 10,
                          height: iconHeightWidth + 10,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : _subjectController.arrOfChapter.isEmpty
                        ? Center(
                            child: Text("No Chapter found."),
                          )
                        : Container(
                            padding: EdgeInsets.all(margin16),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Chapters of ",
                                        style: textStyle10Bold.copyWith(
                                            color: Colors.black)),
                                    TextSpan(
                                        text: _subjectController
                                            .selectedSubject.value.name,
                                        style: textStyle10Bold.copyWith(
                                            color: Color(0xff7FCB4F))),
                                  ]),
                                ),
                                SizedBox(
                                  height: margin16,
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount:
                                      _subjectController.arrOfChapter.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: margin8,
                                            horizontal: margin8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(margin4),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.grey[300],
                                              offset: Offset(0, 0),
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(margin4),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(margin4),
                                            onTap: () {
                                              _subjectController
                                                      .selectedChapter.value =
                                                  _subjectController
                                                      .arrOfChapter[index];
                                              _subjectController
                                                      .selectedChapterPosition =
                                                  index;
                                              Get.to(QuestionBankList());
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "" +
                                                        (index + 1).toString() +
                                                        ".",
                                                    style: textStyle11Bold
                                                        .copyWith(
                                                            color: Color(
                                                                0xff7FCB4F)),
                                                  ),
                                                  SizedBox(
                                                    width: margin10,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    _subjectController
                                                        .arrOfChapter[index]
                                                        .name,
                                                    style: textStyle10,
                                                    textScaleFactor: 1.0,
                                                  )),
                                                  SizedBox(
                                                    width: margin10,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .navigate_next_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    width: margin2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: margin16);
                                  },
                                )
                              ],
                            ),
                          ),
              )
            ],
          )),
    );
  }
}
