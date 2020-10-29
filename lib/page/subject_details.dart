import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:virtual_learning/tabs/lessons_tab.dart';
import 'package:virtual_learning/tabs/mock_test_tab.dart';
import 'package:virtual_learning/tabs/question_bank_tab.dart';
import 'package:virtual_learning/utils/custom_color.dart';

class SubjectDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSubjectDetails();
  }
}

class _StateSubjectDetails extends State<SubjectDetails>
    with SingleTickerProviderStateMixin {
  List<String> lessions = [
    'Agriculture',
    'Automobile Skill',
    'Bricks Skill',
    'Chemistry',
    'Civil Engineering Skill',
    'Computer Engineering',
    'Electrical Engineering',
    'Agriculture',
    'Automobile Skill',
    'Bricks Skill',
    'Chemistry',
    'Civil Engineering Skill',
    'Computer Engineering',
    'Electrical Engineering'
  ];

  TabController _tabController;
  var currentPosition = 0;

  List<ModelTabTitle> tabTitle;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);

    tabTitle = [
      ModelTabTitle(title: "Lesson", subTitle: "Total 10 Lesson"),
      ModelTabTitle(title: "Mock Test", subTitle: "Assets, Evaluate & Improve"),
      ModelTabTitle(
          title: "Question Bank", subTitle: "Download, Practise & Progress"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

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
                      tabTitle[currentPosition].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tabTitle[currentPosition].subTitle,
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
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              widget: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 4,
                          offset: Offset(1, 1))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentPosition = 0;
                              _tabController.index = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentPosition == 0
                                  ? Color(CustomColor.colorThemeDark)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  bottomLeft: Radius.circular(24)),
                            ),
                            child: Center(
                              child: Text(
                                "Lessons".toUpperCase(),
                                style: TextStyle(
                                    color: currentPosition == 0
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 1,
                      margin: EdgeInsets.only(top: 4, bottom: 4),
                      color: Colors.grey[100],
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentPosition = 1;
                              _tabController.index = 1;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: currentPosition == 1
                                    ? Color(CustomColor.colorThemeDark)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "Mock Test".toUpperCase(),
                                  style: TextStyle(
                                      color: currentPosition == 1
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 1,
                      margin: EdgeInsets.only(top: 4, bottom: 4),
                      color: Colors.grey[100],
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentPosition = 2;
                              _tabController.index = 2;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: currentPosition == 2
                                    ? Color(CustomColor.colorThemeDark)
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(24)),
                              ),
                              child: Center(
                                child: Text(
                                  "Q-Bank".toUpperCase(),
                                  style: TextStyle(
                                      color: currentPosition == 2
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                LessonsTab(),
                MockTestTab(),
                QuestionBankTab(),
              ],
            ),
          )
          /*SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lessions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 16, bottom: 16),
                            decoration: BoxDecoration(
                                color: Color(0xffD7EDF5),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                          color: Colors.black,
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
                                        text: lessions[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Image.asset(
                                  "assets/icons/download.png",
                                  height:
                                      MediaQuery.of(context).size.width * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.black54,
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
                );
              },
              childCount: 1,
            ),
          ),*/
        ],
      ),
    );
  }
}

class ModelTabTitle {
  String title;
  String subTitle;

  ModelTabTitle({this.title, this.subTitle});
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.white,
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
