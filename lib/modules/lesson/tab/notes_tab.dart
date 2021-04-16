import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/page/notes_view.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class NotesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateNotesTab();
  }
}

class _StateNotesTab extends State<NotesTab> {
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Obx(() => Container(
            margin: EdgeInsets.only(right: margin16),
            child: _subjectController.selectedChapter.value.note != null
                ? ListView.separated(
                    // itemCount: _subjectController.arrOfTestDescription.length,
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Material(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Get.to(NotesView());
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: AppBar().preferredSize.height,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                        text: _subjectController
                                            .selectedChapter.value.note.title,
                                        style: textStyle10.copyWith(
                                            color: Color(0xff7FCB4F))),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "View".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0A0A78)),
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
                        child: Container(
                          color: Colors.transparent,
                        ),
                      );
                    },
                  )
                : Container(
                    child: Center(
                      child: Text("Notes not available."),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  ),
          )),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _subjectController.selectedChapter.value.note == null
            ? Container(
                child: Center(
                  child: Text("Notes not available."),
                ),
                height: Get.height - (AppBar().preferredSize.height),
              )
            : !loaded
                ? Container(
                    child: Center(
                      child: SizedBox(
                        height: Get.width * 0.10,
                        width: Get.width * 0.10,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    height: Get.height - (AppBar().preferredSize.height + 10),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      boxShadow: [boxShadow],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    height: AppBar().preferredSize.height + 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Get.to(NotesView(urlPDFPath));
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  overflow: TextOverflow.fade,
                                  text: TextSpan(
                                      text: _subjectController
                                          .selectedChapter.value.name,
                                      style: bodyMediumTestStyle.copyWith(
                                          color: Colors.black)),
                                  maxLines: 2,
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Get.to(NotesView(urlPDFPath));
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "View".toUpperCase(),
                                        style: bodyMediumTestStyle.copyWith(
                                            color: Colors.green),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(4),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
  }*/
}
