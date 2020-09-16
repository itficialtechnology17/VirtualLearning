import 'package:adobe_xd/pinned.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_learning/page/signup_page.dart';

class CoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateCoursePage();
  }
}

class _StateCoursePage extends State<CoursePage> {
  var selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  SvgPicture.asset(
                    'assets/svg/ic_back.svg',
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width * 0.05,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32, left: 14),
                    child: Text(
                      'Choose Course',
                      style: TextStyle(
                        fontSize: 36,
                        color: const Color(0xff205072),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Select course you are interested in',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w500,
                        height: 1.6666666666666667,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Material(
                              type: MaterialType.transparency,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPosition = 1;
                                  });
                                },
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadow(1),
                                      border: Border.all(
                                          color: Color(selectedPosition == 1
                                              ? 0xff205072
                                              : 0xff3AA59B),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(16)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                '9',
                                                style: TextStyle(
                                                  fontSize: 50,
                                                  color: Color(
                                                      selectedPosition == 1
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '\u1d57\u02b0',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(
                                                      selectedPosition == 1
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Material(
                              type: MaterialType.transparency,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPosition = 2;
                                  });
                                },
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadow(2),
                                      border: Border.all(
                                          color: Color(selectedPosition == 2
                                              ? 0xff205072
                                              : 0xff3AA59B),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(16)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                  fontSize: 50,
                                                  color: Color(
                                                      selectedPosition == 2
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '\u1d57\u02b0',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(
                                                      selectedPosition == 2
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Material(
                              type: MaterialType.transparency,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPosition = 3;
                                  });
                                },
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadow(3),
                                      border: Border.all(
                                          color: Color(selectedPosition == 3
                                              ? 0xff205072
                                              : 0xff3AA59B),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(16)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                '11',
                                                style: TextStyle(
                                                  fontSize: 50,
                                                  color: Color(
                                                      selectedPosition == 3
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '\u1d57\u02b0',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(
                                                      selectedPosition == 2
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Material(
                              type: MaterialType.transparency,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPosition = 4;
                                  });
                                },
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadow(4),
                                      border: Border.all(
                                          color: Color(selectedPosition == 4
                                              ? 0xff205072
                                              : 0xff3AA59B),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(16)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                '12',
                                                style: TextStyle(
                                                  fontSize: 50,
                                                  color: Color(
                                                      selectedPosition == 4
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                '\u1d57\u02b0',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color(
                                                      selectedPosition == 4
                                                          ? 0xff205072
                                                          : 0xff3AA59B),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Material(
                          color: Colors.transparent,
                          type: MaterialType.circle,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                              if (selectedPosition == 0) {
                                Flushbar(
                                  messageText: Text(
                                    "Please select course",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Color(0xff205072),
                                )..show(context);
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff205072)),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                'assets/svg/ic_bg_next.svg',
                                height:
                                    MediaQuery.of(context).size.width * 0.01,
                                width: MediaQuery.of(context).size.width * 0.01,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ) /*Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          type: MaterialType.circle,
                          child: InkWell(
                            onTap: () {
                              if (selectedPosition == 0) {
                                Flushbar(
                                  messageText: Text(
                                    "Please select course",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Color(0xff205072),
                                )..show(context);
                              } else {}
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff205072)),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/svg/ic_bg_next.svg',
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )*/
                        ,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getBoxShadow(int i) {
    if (selectedPosition == i) {
      return [
        BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(4.0, 3.0))
      ];
    } else
      return null;
  }
}
