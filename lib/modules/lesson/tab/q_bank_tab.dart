import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/q-bank/question_bank_test.dart';
import 'package:virtual_learning/page/pdf_view.dart';
import 'package:virtual_learning/utils/methods.dart';

class QuestionBankTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBank();
  }
}

class _StateQuestionBank extends State<QuestionBankTab> {
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Container(
            margin: EdgeInsets.only(top: 16),
            child: _subjectController.arrOfPdf.isEmpty &&
                    _subjectController.arrOfQuestionBank.isEmpty
                ? Container(
                    child: Center(
                      child: Text("Q-Bank Or Pdf not available."),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  )
                : _subjectController.arrOfPdf.isNotEmpty
                    ? ListView.builder(
                        itemCount: _subjectController.arrOfPdf.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            decoration: BoxDecoration(
                              boxShadow: [boxShadow],
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            height: AppBar().preferredSize.height,
                            child: Material(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  Get.to(PdfView(
                                      _subjectController.arrOfPdf[index].file));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: _subjectController
                                                  .arrOfPdf[index].title,
                                              style:
                                                  bodyMediumTestStyle.copyWith(
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
                                            Get.to(PdfView(_subjectController
                                                .arrOfPdf[index].file));
                                          },
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "View".toUpperCase(),
                                                style: bodyMediumTestStyle
                                                    .copyWith(
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
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _subjectController.arrOfQuestionBank.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
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
                                  Get.to(QuestionBankTest(_subjectController
                                      .arrOfQuestionBank[index]));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: _subjectController
                                                      .arrOfQuestionBank[index]
                                                      .title
                                                      .toString() +
                                                  " Marks Question",
                                              style:
                                                  bodyMediumTestStyle.copyWith(
                                                      color: Colors.black)),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          )),
    );
  }
}
