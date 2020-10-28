import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMainPage();
  }
}

class _StateMainPage extends State<MainPage> {
/*  List<Color> subjectColor = [
    Color(0xffF3FFD7),
    Color(0xffFED4D5),
    Color(0xffFFF2D0),
    Color(0xffDCFFF9),
    Color(0xffD4E6FE),
    Color(0xffDBE9E9),
    Color(0xffF6E9D3)
  ];*/

  List<ModelSubject> arrOfSubject = [
    ModelSubject(
        Color(0xffF3FFD7), "assets/subject/chemistry.svg", "Chemistry"),
    ModelSubject(
        Color(0xffFED4D5), "assets/subject/economics.svg", "Economics"),
    ModelSubject(Color(0xffFFF2D0), "assets/subject/geometry.svg", "Geometry"),
    ModelSubject(Color(0xffF6E9D3), "assets/subject/science.svg", "Science"),
    ModelSubject(Color(0xffDCFFF9), "assets/subject/mathematics.svg", "Maths"),
    ModelSubject(Color(0xffD4E6FE), "assets/subject/physics.svg", "Physics"),
  ];
  var userProfile = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            brightness: Brightness.light,
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
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Image.asset(
                          "assets/icons/ic_menu.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              userProfile == ""
                  ? CircleAvatar(
                      radius: 20,
                      child: SvgPicture.network(
                        "https://www.flaticon.com/svg/static/icons/svg/599/599305.svg",
                      ),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(userProfile),
                    ),
              SizedBox(
                width: 8,
              )
            ],
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  Text(
                    "Hi Nens",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  Text("You have completed 6 lesson in this week.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Search for Course, Test, Subject",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Subjects",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    shrinkWrap: true,
                    children: List.generate(
                      arrOfSubject.length,
                      (index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: arrOfSubject[index].bgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  arrOfSubject[index].icon,
                                  height:
                                      MediaQuery.of(context).size.width * 0.10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  arrOfSubject[index].name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Test",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: arrOfSubject.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.only(right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(colors: [
                                        Color(0xffFFFFFF),
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                        arrOfSubject[index].bgColor,
                                      ])),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                          "assets/images/ic_test_start.png")
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
          /*    SliverPersistentHeader(
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
          )*/
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

class ModelSubject {
  Color bgColor;
  String icon;
  String name;

  ModelSubject(_, __, ___) {
    this.bgColor = _;
    this.icon = __;
    this.name = ___;
  }
}
