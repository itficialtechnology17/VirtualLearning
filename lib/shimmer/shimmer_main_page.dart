import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/utils/methods.dart';

class ShimmerMainPage extends StatelessWidget {
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
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          )
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
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          )
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
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
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
                      SizedBox(
                        height: margin10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: margin10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: margin10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: margin16,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: margin10,
                      ),
                      Container(
                        width: Get.width,
                        height: 2,
                        color: Color(0xffE9E9E9),
                      ),
                      SizedBox(height: margin10),
                      Container(
                        height: Get.height * 0.10,
                        width: Get.width,
                        color: Colors.white,
                      ),
                      SizedBox(height: margin10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
