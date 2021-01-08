import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/practice/pratice.dart';

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
    '10 Marks Question',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  brightness: Brightness.light,
                  expandedHeight:
                      MediaQuery.of(context).size.height * 0.20 - 16,
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
                            child: Icon(Icons.arrow_back, color: Colors.black),
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
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: ListView.builder(
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
                            Container(
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
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
