import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateNotificationPage();
  }
}

class StateNotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
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
                        "Notification",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Here you will get all updates",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 12),
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
          color: Colors.white,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(index == 0 ? "Todays" : "1 Jan 2021"),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, nestedIndex) {
                        return Text("Test");
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
