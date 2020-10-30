import 'dart:io';

import 'package:flutter/material.dart';

class AskDoubt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateAskDoubt();
  }
}

class _StateAskDoubt extends State<AskDoubt> {
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
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView(
                    children: [],
                  ),
                )
              ],
            )));
  }
}
