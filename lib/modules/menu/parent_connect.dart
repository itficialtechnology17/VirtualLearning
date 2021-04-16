import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';

class ParentConnect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateParentConnect();
  }
}

class StateParentConnect extends State<ParentConnect> {
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
                    type: MaterialType.circle,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(margin8),
                        child: Image.asset(
                          ASSETS_ICONS_PATH + 'ic_back.png',
                          height: iconHeightWidth,
                          width: iconHeightWidth,
                          fit: BoxFit.fitWidth,
                        ),
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
                        "Parent Connect",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Track your child's progress",
                        style:
                            TextStyle(color: Colors.grey, fontFamily: "Nunito"),
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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: Get.width * 0.03,
                    height: Get.width * 0.03,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text("Step to access student report".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("1. "),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Enter the child's register number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 8,
                        ),
                        Text("+91 7600978848",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("2. "),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Enter parent code",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 8,
                        ),
                        Text("abcdef",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text("Share Parent App".toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: Get.height * 0.06,
        margin:
            EdgeInsets.symmetric(vertical: margin24 + margin24, horizontal: 16),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "Download Parent App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
