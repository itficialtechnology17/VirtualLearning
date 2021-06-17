import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ContactPage extends StatelessWidget {
  ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
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
                                        color: _themeController.iconColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Contact Us".toUpperCase(),
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
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
                    color: _themeController.background.value,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "Email",
                          style: textStyle10Bold.copyWith(color: Colors.grey),
                        ),
                        Text(
                          contactEmail,
                          style: textStyle10Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   "Contact Number 1",
                        //   style: textStyle10Bold.copyWith(color: Colors.grey),
                        // ),
                        // Text(
                        //   contactNumber1,
                        //   style: textStyle10Bold.copyWith(
                        //       color: _themeController.textColor.value),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Text(
                        //   "Contact Number 2",
                        //   style: textStyle10Bold.copyWith(color: Colors.grey),
                        // ),
                        // Text(
                        //   contactNumber2,
                        //   style: textStyle10Bold.copyWith(
                        //       color: _themeController.textColor.value),
                        // ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
