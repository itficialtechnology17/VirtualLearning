import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/subject/chapter.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class SubjectTab extends StatefulWidget {
  @override
  _SubjectTabState createState() => _SubjectTabState();
}

class _SubjectTabState extends State<SubjectTab> {
  ThemeController _themeController = Get.find();
  SearchController _searchController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Obx(() => Container(
              margin: EdgeInsets.all(16),
              child: _searchController.arrOfSubject.isEmpty
                  ? Center(
                      child: Text(
                        "No Subject Founds",
                        style: textStyle10.copyWith(
                            color: _themeController.textColor.value),
                      ),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      // mainAxisSpacing: margin16,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 5 / 6,
                      children: List<Widget>.generate(
                          _searchController.arrOfSubject.length, (index) {
                        return Container(
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _subjectController
                                            .selectedSubjectPosition = -1;
                                        _subjectController
                                                .selectedSubject.value =
                                            _subjectController
                                                .arrOfSubject[index];
                                        // Get.to(LessonListing());

                                        Get.to(() => Chapter());
                                      });
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            storageUrl +
                                                _searchController
                                                    .arrOfSubject[index].icon,
                                            height: Get.height * 0.09,
                                            width: Get.height * 0.09,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          RichText(
                                            textScaleFactor: 1.0,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                style: textStyle10.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: _themeController
                                                        .textColor.value),
                                                text: getTwoWordsName(
                                                    _searchController
                                                        .arrOfSubject[index]
                                                        .name)),
                                          )
                                        ],
                                      ),
                                    ))));
                        ;
                      }),
                    )

              // ListView.separated(
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             itemCount: _searchController.arrOfSubject.length,
              //             itemBuilder: (context, index) {
              //               return Container(
              //                 decoration: BoxDecoration(
              //                   color: cardBackground,
              //                   borderRadius: BorderRadius.circular(24),
              //                   /*boxShadow: [
              //                   BoxShadow(
              //                       color: Colors.white,
              //                       spreadRadius: 1,
              //                       blurRadius: 4)
              //                 ],*/
              //                   /*image: DecorationImage(
              //           image: AssetImage("assets/images/ic_bg.png"),
              //           fit: BoxFit.fill)*/
              //                 ),
              //                 child: Material(
              //                   color: Colors.transparent,
              //                   borderRadius: BorderRadius.circular(24),
              //                   child: InkWell(
              //                     splashColor: Colors.white,
              //                     onTap: () {
              //                       // _subjectController.setSelectedChapter(index);
              //                     },
              //                     borderRadius: BorderRadius.circular(24),
              //                     child: Column(
              //                       children: [
              //                         Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 16,
              //                               right: 16,
              //                               top: 16,
              //                               bottom: 16),
              //                           child: Row(
              //                             children: [
              //                               ClipRRect(
              //                                 borderRadius:
              //                                     BorderRadius.circular(16.0),
              //                                 child: Image.network(
              //                                   _searchController
              //                                       .arrOfSubject[index].icon,
              //                                   height: MediaQuery.of(context)
              //                                           .size
              //                                           .height *
              //                                       0.05,
              //                                   width: MediaQuery.of(context)
              //                                           .size
              //                                           .height *
              //                                       0.05,
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                               SizedBox(
              //                                 width: 16,
              //                               ),
              //                               Expanded(
              //                                 child: Column(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.center,
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.start,
              //                                   children: [
              //                                     RichText(
              //                                       text: TextSpan(
              //                                           text: _searchController
              //                                               .arrOfSubject[index]
              //                                               .name,
              //                                           style: textStyle10),
              //                                       maxLines: 1,
              //                                     ),
              //                                     SizedBox(
              //                                       height: 4,
              //                                     ),
              //                                     Text(
              //                                       "Topics: " +
              //                                           _searchController
              //                                               .arrOfSubject[index]
              //                                               .status
              //                                               .toString(),
              //                                       style: textStyle10,
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Material(
              //                                 borderRadius:
              //                                     BorderRadius.circular(8),
              //                                 child: InkWell(
              //                                   splashColor: Colors.white,
              //                                   onTap: () {
              //                                     // _searchController.setSelectedChapter(index);
              //                                   },
              //                                   borderRadius:
              //                                       BorderRadius.circular(8),
              //                                   child: Container(
              //                                     child: Center(
              //                                       child: Icon(
              //                                         Icons.navigate_next,
              //                                         size: 15,
              //                                       ),
              //                                     ),
              //                                     padding: EdgeInsets.all(4),
              //                                     decoration: BoxDecoration(
              //                                         border: Border.all(
              //                                             color: Colors.grey,
              //                                             width: 1),
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 8)),
              //                                   ),
              //                                 ),
              //                               ),
              //                               SizedBox(
              //                                 width: 8,
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               );
              //             },
              //             separatorBuilder: (context, index) {
              //               return SizedBox(
              //                 height: 16,
              //               );
              //             },
              //           ),
              )),
        ));
  }
}
