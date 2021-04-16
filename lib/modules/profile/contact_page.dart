import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Stack(
        children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.lightGreenAccent,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
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
                          Center(
                            child: Text(
                              "Contact Us".toUpperCase(),
                              style: textStyle10Bold,
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Email",
                      style: textStyle10Bold,
                    ),
                    Text(
                      contactEmail,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Contact Number 1",
                      style: textStyle10Bold,
                    ),
                    Text(
                      contactNumber1,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Contact Number 2",
                      style: textStyle10Bold,
                    ),
                    Text(
                      contactNumber2,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
                )),
          )
        ],
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     elevation: 2,
    //     centerTitle: true,
    //     brightness: Brightness.dark,
    //     flexibleSpace: Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.bottomLeft,
    //               end: Alignment.topRight,
    //               colors: [
    //             Color(0xff14C269),
    //             Color(0xff0A0A78),
    //           ])),
    //     ),
    //     title: Text(
    //       "Contact Us".toUpperCase(),
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     leading: Material(
    //       color: Colors.transparent,
    //       type: MaterialType.circle,
    //       clipBehavior: Clip.hardEdge,
    //       child: InkWell(
    //         onTap: () {
    //           Navigator.pop(context);
    //         },
    //         child: Icon(
    //           Platform.isAndroid
    //               ? Icons.keyboard_backspace
    //               : Icons.arrow_back_ios,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    //   body:
    //
    //   Container(
    //       padding: EdgeInsets.all(16),
    //       height: MediaQuery.of(context).size.height,
    //       width: MediaQuery.of(context).size.width,
    //       color: Colors.white,
    //       child: ListView(
    //         shrinkWrap: true,
    //         children: [
    //           Text(
    //             "Email",
    //             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    //           ),
    //           Text(
    //             contactEmail,
    //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             "Contact Number 1",
    //             style: textStyle16,
    //           ),
    //           Text(
    //             contactNumber1,
    //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             "Contact Number 2",
    //             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    //           ),
    //           Text(
    //             contactNumber2,
    //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    //           ),
    //         ],
    //       )),
    // );
  }
}
