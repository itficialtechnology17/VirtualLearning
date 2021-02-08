import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/search_controller.dart';

class SubjectTab extends StatelessWidget {
  SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(
            margin: EdgeInsets.all(16),
            child: _searchController.arrOfSubject.isEmpty
                ? Center(
                    child: Text("No Subject Founds"),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _searchController.arrOfSubject.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          /*boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ],*/
                          /*image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill)*/
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              // _subjectController.setSelectedChapter(index);
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
                                          _searchController
                                              .arrOfSubject[index].icon,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
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
                                            RichText(
                                              text: TextSpan(
                                                  text: _searchController
                                                      .arrOfSubject[index].name,
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
                                              "Topics: " +
                                                  _searchController
                                                      .arrOfSubject[index]
                                                      .status
                                                      .toString(),
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
                                            // _searchController.setSelectedChapter(index);
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
    );
  }
}
