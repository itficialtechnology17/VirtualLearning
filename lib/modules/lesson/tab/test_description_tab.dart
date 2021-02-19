import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/test/test_guide.dart';

class TestDescriptionTab extends StatelessWidget {
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(
            margin: EdgeInsets.only(top: 16),
            child: _subjectController.arrOfTestDescription != null &&
                    _subjectController.arrOfTestDescription.isNotEmpty
                ? ListView.separated(
                    itemCount: _subjectController.arrOfTestDescription.length,
                    itemBuilder: (context, index) {
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            /*Get.to(ChapterTest(_subjectController
                                .arrOfTestDescription[index]));*/
                            Get.to(TestGuide(
                                _subjectController.arrOfTestDescription[index],
                                _subjectController
                                    .arrOfTestDescription[index].title));
                          },
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: AppBar().preferredSize.height,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                        text: _subjectController
                                            .arrOfTestDescription[index].title,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: "Poppins")),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                _subjectController.arrOfTestDescription[index]
                                            .isGiven ==
                                        0
                                    ? Text(
                                        "Start".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff0A0A78)),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.all(4),
                                        child: RotatedBox(
                                          quarterTurns: -45,
                                          child: Icon(
                                            Icons.refresh_sharp,
                                            color: Colors.orange,
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
                      return Container(
                        width: double.infinity,
                        height: 0.5,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.black.withOpacity(0.20),
                      );
                    },
                  )
                : Container(
                    child: Center(
                      child: Text("Test not available."),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  ),
          )),
    );
  }
}
