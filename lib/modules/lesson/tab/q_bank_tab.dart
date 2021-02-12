import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/practice/pratice.dart';

class QuestionBankTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBank();
  }
}

class _StateQuestionBank extends State<QuestionBankTab> {
  List<String> questionType = [
    '1 Marks Question',
    '2 Marks Question',
    '3 Marks Question',
    '4 Marks Question',
    '10 Marks Question',
  ];

  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(
            margin: EdgeInsets.only(top: 16),
            child: _subjectController.arrOfQuestionBankMarks != null &&
                    _subjectController.arrOfQuestionBankMarks.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _subjectController.arrOfQuestionBankMarks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(Practice());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 16, bottom: 16),
                              decoration: BoxDecoration(
                                  color: Color(0xffD7EDF5),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 16,
                                  ),
                                  /*Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              (index + 1).toString() + "M",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),*/
                                  Expanded(
                                    child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      text: TextSpan(
                                          text: _subjectController
                                              .arrOfQuestionBankMarks[index]
                                              .title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    child: Center(
                      child: Text("Q-Bank not available."),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  ),
          )),
    );
  }
}
