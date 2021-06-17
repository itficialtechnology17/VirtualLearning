import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class PerformanceTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePerformanceTab();
  }
}

class _StatePerformanceTab extends State<PerformanceTab>
    with TickerProviderStateMixin {
  SubjectController _subjectController = Get.find();
  ThemeController _themeController = Get.find();
  DashboardController _dashboardController = Get.find();

  TabController _tabController;
  List<Widget> _tabs = List<Widget>();
  List<Widget> _tabContent = List<Widget>();

  @override
  void initState() {
    super.initState();
    _tabs = getTabs();
    _tabController = TabController(
        length: _subjectController.arrOfSubject.length + 1,
        vsync: this,
        initialIndex: 0);
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
        body: DefaultTabController(
          length: _subjectController.arrOfSubject.length + 1,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelStyle: textStyle10,
                      labelColor: Colors.green,
                      unselectedLabelColor: textColor,
                      indicatorColor: Colors.green,
                      labelPadding:
                          EdgeInsets.only(left: margin8, right: margin8),
                      isScrollable: true,
                      tabs: _tabs,
                      controller: _tabController,
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: getTabWidgets(),
              controller: _tabController,
            ),
          ),
        )));
  }

  List<Widget> getTabs() {
    _tabs.clear();
    for (int i = 0; i < _subjectController.arrOfSubject.length + 1; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Widget getTab(title) {
    if (title == 0) {
      return Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: Get.height * 0.06,
                width: Get.height * 0.06,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    ASSETS_ICONS_PATH + 'ic_small_logo.png',
                    height: Get.height * 0.04,
                    width: Get.height * 0.04,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            SizedBox(
              height: margin4,
            ),
            RichText(
              textScaleFactor: 1.0,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: textStyle9.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _themeController.textColor.value),
                  text: "All Subject"),
            )
          ],
        ),
      ));
    } else {
      return Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              storageUrl + _subjectController.arrOfSubject[title - 1].icon,
              height: Get.height * 0.06,
              width: Get.height * 0.06,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: margin4,
            ),
            RichText(
              textScaleFactor: 1.0,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: textStyle9.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _themeController.textColor.value),
                  text: _subjectController.arrOfSubject[title - 1].name),
            )
          ],
        ),
      ));
    }
  }

  List<Widget> getTabWidgets() {
    _tabContent.clear();

    for (int i = 0; i < _tabs.length; i++) {
      _tabContent.add(getTabContent(i));
    }
    return _tabContent;
  }

  getTabContent(int position) {
    List<_PieData> pieData = List<_PieData>();
    for (int i = 0; i < _subjectController.arrOfSubject.length; i++) {
      pieData
          .add(_PieData(_subjectController.arrOfSubject[i].name, 35, "Test"));
    }

    TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

    if (position == 0) {
      return Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SfCircularChart(
                title: ChartTitle(
                    text: 'Overall Statistics',
                    textStyle: textStyle10Bold.copyWith(
                        color: _themeController.textColor.value)),
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(
                    isVisible: true,
                    toggleSeriesVisibility: false,
                    position: LegendPosition.bottom),
                series: <PieSeries<_PieData, String>>[
                  PieSeries<_PieData, String>(
                      explode: true,
                      explodeIndex: 0,
                      dataSource: pieData,
                      xValueMapper: (_PieData data, _) => data.xData,
                      yValueMapper: (_PieData data, _) => data.yData,
                      dataLabelMapper: (_PieData data, _) => data.text,
                      enableSmartLabels: true,
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                ]),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: margin24),
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  boxShadow: [
                    !_themeController.isDarkTheme.value
                        ? BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(0, 0),
                            blurRadius: 10.0,
                          )
                        : BoxShadow(),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: _themeController.cardBackground.value),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "10/25".toString(),
                          style: textStyle11Bold.copyWith(
                              fontWeight: FontWeight.w900,
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin4,
                        ),
                        Text(
                          "Question\nCorrect",
                          textAlign: TextAlign.center,
                          style: textStyle9Bold.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    color: Color(0xffE9E9E9),
                    height: Get.height * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "15/152".toString(),
                          style: textStyle11Bold.copyWith(
                              fontWeight: FontWeight.w900,
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin4,
                        ),
                        Text(
                          "Test\nAttempted",
                          textAlign: TextAlign.center,
                          style: textStyle9Bold.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    color: Color(0xffE9E9E9),
                    height: Get.height * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "4 sec".toString(),
                          style: textStyle11Bold.copyWith(
                              fontWeight: FontWeight.w900,
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin4,
                        ),
                        Text(
                          "Avg. Time/\nquestion",
                          textAlign: TextAlign.center,
                          style: textStyle9Bold.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _dashboardController.arrOfWatchHistory.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: margin16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: 1.0,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Recently Taken",
                                style: textStyle10Bold.copyWith(
                                    color: _themeController.textColor.value)),
                            TextSpan(
                                text: " Tests",
                                style: textStyle10Bold.copyWith(
                                    color: Color(0xff7FCB4F))),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              _dashboardController.arrOfWatchHistory.length > 3
                                  ? 3
                                  : _dashboardController
                                      .arrOfWatchHistory.length,
                          itemBuilder: (context, index) {
                            return Material(
                              color: _themeController.cardBackground.value,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {},
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: margin16,
                                      ),
                                      Container(
                                        height: iconMediumHeightWidth + 10,
                                        width: iconMediumHeightWidth + 10,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.greenAccent,
                                              width: 5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "10%",
                                            style: textStyle9Bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: margin16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaleFactor: 1.0,
                                              text: TextSpan(
                                                  text: _dashboardController
                                                      .arrOfWatchHistory[index]
                                                      .name,
                                                  style: textStyle10.copyWith(
                                                      color: _themeController
                                                          .textColor.value)),
                                              maxLines: 1,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Start again",
                                                  textScaleFactor: 1.0,
                                                  style: textStyle9.copyWith(
                                                      color: _themeController
                                                          .textColor.value),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: margin16,
                                      ),
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: margin16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16,
                            );
                          },
                        )
                      ],
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      );
    } else {
      return Container(
        color: _themeController.background.value,
        margin: EdgeInsets.only(left: 16, top: 16),
        child: Center(
          child: Text(
              _subjectController.arrOfSubject[position - 1].name + " Content"),
        ),
      );
    }
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  ThemeController _themeController = Get.find();

  @override
  double get minExtent => Get.height * 0.15;

  @override
  double get maxExtent => Get.height * 0.15;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin16),
      decoration: BoxDecoration(
          color: _themeController.background.value,
          border: Border(
            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
            bottom: BorderSide(width: 1.0, color: Colors.grey),
          )),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
