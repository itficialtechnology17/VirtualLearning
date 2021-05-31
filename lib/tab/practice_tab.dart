import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/practice/chapter_list.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class PracticeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHome();
  }
}

class _StateHome extends State<PracticeTab> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();
  DashboardController _dashboardController = Get.find();

  @override
  void initState() {
    super.initState();
    // getThemeMode();
  }

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
          body: Obx(() => Stack(
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
                      preferredSize:
                          Size.fromHeight(AppBar().preferredSize.height),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.lightGreenAccent,
                              child: Center(
                                child: Text(
                                  "Practice".toUpperCase(),
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
                                  textScaleFactor: 1.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    body: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: margin16, vertical: margin2),
                      child: ListView(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Choose Subject",
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value)),
                              TextSpan(
                                  text: " For Practice",
                                  style: textStyle10Bold.copyWith(
                                      color: Color(0xff7FCB4F))),
                            ]),
                          ),
                          SizedBox(
                            height: margin24,
                          ),
                          GridView.count(
                            crossAxisCount: 3,
                            // mainAxisSpacing: margin16,
                            shrinkWrap: true,
                            childAspectRatio: 5 / 6,
                            children: List<Widget>.generate(
                                _subjectController.arrOfSubject.length,
                                (index) {
                              return Container(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _subjectController
                                                      .selectedSubject.value =
                                                  _subjectController
                                                      .arrOfSubject[index];

                                              Get.to(ChapterList());
                                            });
                                          },
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  storageUrl +
                                                      _subjectController
                                                          .arrOfSubject[index]
                                                          .icon,
                                                  height: Get.height * 0.09,
                                                  width: Get.height * 0.09,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                RichText(
                                                  textScaleFactor: 1.0,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                      style: textStyle10.copyWith(
                                                          color:
                                                              _themeController
                                                                  .textColor
                                                                  .value,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      text: getTwoWordsName(
                                                          _subjectController
                                                              .arrOfSubject[
                                                                  index]
                                                              .name)),
                                                )
                                              ],
                                            ),
                                          ))));
                              ;
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
