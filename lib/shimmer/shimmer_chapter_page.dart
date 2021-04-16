import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/utils/methods.dart';

class ShimmerChapterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        body: Shimmer.fromColors(
          baseColor: Colors.grey[100],
          highlightColor: Colors.grey[200],
          child: Stack(
            children: [
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
                          child: Row(
                            children: [
                              SizedBox(
                                width: margin4,
                              ),
                              Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Container(
                                  width: 35,
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Container(
                                  width: 35,
                                  height: 50,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: margin4,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: margin24,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            height: 20,
                            color: Colors.white,
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: margin24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: Get.height * 0.15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              height: Get.height * 0.15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: margin16,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: margin24,
                              ),
                              Container(
                                width: Get.width,
                                height: 2,
                                color: Color(0xffE9E9E9),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: margin4,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: margin24,
                              ),
                              Container(
                                width: Get.width,
                                height: 2,
                                color: Color(0xffE9E9E9),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: margin16,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: margin24,
                              ),
                              Container(
                                width: Get.width,
                                height: 2,
                                color: Color(0xffE9E9E9),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: margin16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
