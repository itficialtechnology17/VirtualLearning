import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
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
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            text: _subjectController
                                                .selectedChapter
                                                .value
                                                .note
                                                .title,
                                            style: textStyle10.copyWith(
                                                color: Color(0xff7FCB4F))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "View".toUpperCase(),
                                      style: textStyle9Bold.copyWith(
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
        ));
  }
}
