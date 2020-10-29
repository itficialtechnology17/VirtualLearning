import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_learning/q-bank/question_bank_by_type.dart';

class TypeOfQuestionBank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTypeOfQuestionBank();
  }
}

class _StateTypeOfQuestionBank extends State<TypeOfQuestionBank> {
  List<String> questionType = [
    '1 Marks Question',
    '2 Marks Question',
    '3 Marks Question',
    '4 Marks Question',
    '10 Marks Question'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            brightness: Brightness.light,
            expandedHeight: MediaQuery.of(context).size.height * 0.20 - 16,
            elevation: 0,
            pinned: true,
            titleSpacing: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            leading: Container(
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Color(0xffD0E6EE),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          )),
                      width: double.infinity,
                      height: AppBar().preferredSize.height -
                          AppBar().preferredSize.height * 0.30,
                      child: Icon(
                          Platform.isAndroid
                              ? Icons.keyboard_backspace
                              : Icons.arrow_back_ios,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            flexibleSpace: Container(
              height: MediaQuery.of(context).size.height * 0.20 +
                  MediaQuery.of(context).padding.top +
                  20,
              color: Colors.white,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Type Of Question",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Select Question Type",
                      style:
                          TextStyle(color: Colors.grey, fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questionType.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionBankByType()));
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
                            Expanded(
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                text: TextSpan(
                                    text: questionType[index],
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
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
