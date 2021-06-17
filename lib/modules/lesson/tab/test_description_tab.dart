import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/test/test_guide.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class TestDescriptionTab extends StatelessWidget {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: _themeController.isDarkTheme.value
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: _themeController.isDarkTheme.value
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: _themeController.background.value,
        statusBarColor: _themeController.background.value));

    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Obx(() => _subjectController.isTopicLoading.value
              ? ShimmerDummyPage()
              : Container(
                  margin: EdgeInsets.only(right: margin16),
                  child: _subjectController.arrOfTestDescription != null &&
                          _subjectController.arrOfTestDescription.isNotEmpty
                      ? ListView.separated(
                          // itemCount: _subjectController.arrOfTestDescription.length,
                          itemCount:
                              _subjectController.arrOfTestDescription.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Material(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  Get.to(TestGuide(
                                      _subjectController
                                          .arrOfTestDescription[index],
                                      _subjectController
                                          .arrOfTestDescription[index].title));
                                  // Get.to(TestGuide(ModelTestDescription(), ""));
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: AppBar().preferredSize.height,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: _subjectController
                                                  .arrOfTestDescription[index]
                                                  .title,
                                              style: textStyle10.copyWith(
                                                  color: Color(0xff7FCB4F))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      _subjectController
                                                  .arrOfTestDescription[index]
                                                  .isGiven ==
                                              0
                                          ? Text(
                                              "Start".toUpperCase(),
                                              style: textStyle9Bold.copyWith(
                                                  color: Color(0xff0A0A78)),
                                            )
                                          : Text(
                                              "Re-Test".toUpperCase(),
                                              style: textStyle9Bold.copyWith(
                                                  color: Color(0xff0A0A78)),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                              child: Container(
                                color: Colors.transparent,
                              ),
                            );
                          },
                        )
                      : Container(
                          child: Center(
                            child: Text(
                              "Test not available.",
                              style: textStyle9.copyWith(
                                  color: _themeController.textColor.value),
                            ),
                          ),
                          height: Get.height - (AppBar().preferredSize.height),
                        ),
                )),
        ));
  }
}
