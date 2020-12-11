import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';

class AskDoubt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateAskDoubt();
  }
}

class _StateAskDoubt extends State<AskDoubt> {
  /* List<ModelSubject> arrOfSubject = [
    ModelSubject(
        Color(0xffF3FFD7), "assets/subject/chemistry.svg", "Chemistry"),
    ModelSubject(
        Color(0xffFED4D5), "assets/subject/economics.svg", "Economics"),
    ModelSubject(Color(0xffFFF2D0), "assets/subject/geometry.svg", "Geometry"),
    ModelSubject(Color(0xffF6E9D3), "assets/subject/science.svg", "Science"),
    ModelSubject(Color(0xffDCFFF9), "assets/subject/mathematics.svg", "Maths"),
    ModelSubject(Color(0xffD4E6FE), "assets/subject/physics.svg", "Physics"),
  ];*/

  DashboardController _dashboardController = Get.find();

  var isSubjectVisible = false;
  var selectedSubject = "Select Subject";
  var description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                            "Ask a Doubt",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Raised your doubt in the go...",
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
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: isSubjectVisible ? 16 : 0),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isSubjectVisible = !isSubjectVisible;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      selectedSubject,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Icon(isSubjectVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isSubjectVisible,
                          child: Container(
                            padding: EdgeInsets.only(left: 1, right: 1),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  _dashboardController.arrOfSubject.length,
                              itemBuilder: (context, index) {
                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedSubject = _dashboardController
                                            .arrOfSubject[index].name
                                            .toString();
                                        isSubjectVisible = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: index ==
                                                  _dashboardController
                                                          .arrOfSubject.length -
                                                      1
                                              ? BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(0))
                                              : BorderRadius.circular(0)),
                                      padding: EdgeInsets.only(
                                          left: 8, top: 16, bottom: 16),
                                      child: Text(
                                          _dashboardController
                                              .arrOfSubject[index].name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 1,
                                  color: Colors.grey[100],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 250, minHeight: 250),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: TextFormField(
                            onChanged: (value) {
                              description = value;
                            },
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                hintText: "Ask your doubt here.....",
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                                disabledBorder: InputBorder.none),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Description Is Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Material(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(4),
                              clipBehavior: Clip.hardEdge,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              "Maximum 1000 character only!\nFile uploaded size maximum 2 MB.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 48),
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        "Raised your doubt",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(24)),
                  )
                ],
              ),
            )));
  }
}
