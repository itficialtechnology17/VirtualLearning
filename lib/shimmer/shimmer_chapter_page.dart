import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/utils/methods.dart';

class ShimmerChapterPage extends StatelessWidget {
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: _themeController.background.value,
        body: Shimmer.fromColors(
          baseColor: _themeController.shimmerColor1.value,
          highlightColor: _themeController.shimmerColor2.value,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
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
                              height: Get.height * 0.15,
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
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
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
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Container(
                                      width: 80,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: margin24,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
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
        )));
  }
}
