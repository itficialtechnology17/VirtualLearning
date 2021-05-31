import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/utils/methods.dart';

class ShimmerMainPage extends StatelessWidget {
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: _themeController.background.value,
        body: Shimmer.fromColors(
          baseColor: _themeController.shimmerColor1.value,
          highlightColor: _themeController.shimmerColor1.value,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(
                            width: margin24,
                          ),
                          Expanded(
                            child: Container(
                              width: Get.height * 0.09,
                              height: Get.height * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      SizedBox(
                                        height: margin4,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4)),
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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      SizedBox(height: margin10),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
