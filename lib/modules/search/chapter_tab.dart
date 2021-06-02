import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ChapterTab extends StatelessWidget {
  ThemeController _themeController = Get.find();
  SearchController _searchController = Get.find();
  SubjectController _subjectController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Obx(() => Container(
                margin: EdgeInsets.all(16),
                child: _searchController.arrOfChapter.isEmpty
                    ? Center(
                        child: Text(
                          "No Chapter Founds.",
                          style: textStyle10.copyWith(
                              color: _themeController.textColor.value),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: _searchController.arrOfChapter.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: margin8, horizontal: margin8),
                              decoration: BoxDecoration(
                                color: _themeController.cardBackground.value,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(margin4),
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
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(margin4),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(margin4),
                                  onTap: () {
                                    _subjectController.selectedChapterPosition =
                                        -1;
                                    _subjectController.selectedTab.value = 0;

                                    _subjectController
                                        .setSelectedChapter(index);
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        // Text(
                                        //   "" +
                                        //       (index + 1)
                                        //           .toString() +
                                        //       ".",
                                        //   style: textStyle11Bold
                                        //       .copyWith(
                                        //           color: Color(
                                        //               0xff7FCB4F)),
                                        // ),
                                        SizedBox(
                                          width: margin10,
                                        ),
                                        Expanded(
                                            child: Text(
                                          _searchController
                                              .arrOfChapter[index].name,
                                          style: textStyle10.copyWith(
                                              color: Colors.black),
                                          textScaleFactor: 1.0,
                                        )),
                                        SizedBox(
                                          width: margin10,
                                        ),
                                        Icon(
                                          Icons.navigate_next_outlined,
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
                      ),
              )),
        ));
  }
}
