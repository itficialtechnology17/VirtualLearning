import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/page/search_notes_view.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class SearchNotesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSearchNotesTab();
  }
}

class _StateSearchNotesTab extends State<SearchNotesTab> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();
  SearchController _searchController = Get.find();

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
                padding: EdgeInsets.all(margin16),
                child: _searchController.arrOfNotes.isNotEmpty
                    ? ListView.separated(
                        itemCount: _searchController.arrOfNotes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Get.to(SearchNotesView(
                                    _searchController.arrOfNotes[index]));
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
                                            text: _searchController
                                                .arrOfNotes[index].title,
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
                          child: Text(
                            "Notes not found.",
                            style: textStyle9.copyWith(
                                color: _themeController.textColor.value),
                          ),
                        ),
                        height: Get.height - (AppBar().preferredSize.height),
                      ),
              )),
        ));
  }
}
