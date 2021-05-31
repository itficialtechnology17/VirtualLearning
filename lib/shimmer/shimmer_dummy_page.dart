import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/utils/methods.dart';

class ShimmerDummyPage extends StatelessWidget {
  ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Shimmer.fromColors(
            baseColor: _themeController.shimmerColor1.value,
            highlightColor: _themeController.shimmerColor2.value,
            // period: Duration(milliseconds: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.70,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
                Container(
                  width: Get.width * 0.40,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
                Container(
                  width: Get.width * 0.50,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
                SizedBox(
                  height: margin16,
                ),
                Container(
                  width: Get.width * 0.70,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
                Container(
                  width: Get.width * 0.40,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
                Container(
                  width: Get.width * 0.50,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.only(bottom: margin12),
                ),
              ],
            ),
          ),
        ));
  }
}
