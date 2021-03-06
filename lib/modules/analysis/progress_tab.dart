import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/analysis_controller.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class ProgressTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateProgressTab();
  }
}

class _StateProgressTab extends State<ProgressTab>
    with TickerProviderStateMixin {
  ThemeController _themeController = Get.find();
  AnalysisController analysisController = Get.find();

  TabController _tabController;
  List<Widget> _tabs = List<Widget>();
  List<Widget> _tabContent = List<Widget>();

  @override
  void initState() {
    super.initState();

    _tabs = getTabs();
    _tabController = TabController(
        length: analysisController.arrOfProgress.length,
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
        body: analysisController.isLoadingProgress.value
            ? Padding(
                padding: EdgeInsets.all(margin16),
                child: ShimmerDummyPage(),
              )
            : DefaultTabController(
                length: analysisController.arrOfProgress.length,
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
    for (int i = 0; i < analysisController.arrOfProgress.length; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Widget getTab(title) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == 0
              ? Image.asset(
                  ASSETS_ICONS_PATH + 'ic_small_logo.png',
                  height: Get.height * 0.06,
                  width: Get.height * 0.06,
                  fit: BoxFit.fitWidth,
                )
              : Image.network(
                  storageUrl + analysisController.arrOfProgress[title].icon,
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
                text: analysisController.arrOfProgress[title].name),
          )
        ],
      ),
    ));
  }

  List<Widget> getTabWidgets() {
    _tabContent.clear();

    for (int i = 0; i < _tabs.length; i++) {
      _tabContent.add(getTabContent(i));
    }
    return _tabContent;
  }

  getTabContent(int position) {
    List<_SalesData> data = List<_SalesData>();

    if (position == 0) {
      data.add(_SalesData('Mar', 34));
      data.add(_SalesData('Mar', 34));
      data.add(_SalesData('Mar', 34));
      data.add(_SalesData('Mar', 34));
      data.add(_SalesData('Mar', 34));
      data.add(_SalesData('Mar', 34));
    } else {
      for (int i = 0;
          i < analysisController.arrOfProgress[position].topicHistory.length;
          i++) {
        data.add(_SalesData(
            analysisController.arrOfProgress[position].topicHistory[i].createdOn
                .toString(),
            analysisController
                .arrOfProgress[position].topicHistory[i].topicsLearned));
      }
    }

    TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

    return Container(
      child: ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Activity'),
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
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
                        "" +
                            analysisController
                                .arrOfProgress[position].topicsLearned
                                .toString() +
                            "/" +
                            analysisController
                                .arrOfProgress[position].totalTopics
                                .toString() +
                            "".toString(),
                        style: textStyle11Bold.copyWith(
                            fontWeight: FontWeight.w900,
                            color: _themeController.textColor.value),
                      ),
                      SizedBox(
                        height: margin4,
                      ),
                      Text(
                        "Topic Learned",
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
                        "" +
                            analysisController
                                .arrOfProgress[position].totalMinutes
                                .toString() +
                            " Min".toString(),
                        style: textStyle11Bold.copyWith(
                            fontWeight: FontWeight.w900,
                            color: _themeController.textColor.value),
                      ),
                      SizedBox(
                        height: margin4,
                      ),
                      Text(
                        "Learning Time",
                        textAlign: TextAlign.center,
                        style: textStyle9Bold.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          analysisController.arrOfProgress[position].watchHistory != null
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: margin16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      analysisController
                              .arrOfProgress[position].watchHistory.isNotEmpty
                          ? RichText(
                              textScaleFactor: 1.0,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Recently Concepts",
                                    style: textStyle10Bold.copyWith(
                                        color:
                                            _themeController.textColor.value)),
                                TextSpan(
                                    text: " Learned",
                                    style: textStyle10Bold.copyWith(
                                        color: Color(0xff7FCB4F))),
                              ]),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 20,
                      ),
                      analysisController
                              .arrOfProgress[position].watchHistory.isEmpty
                          ? Container(
                              height: Get.height * 0.10,
                              child: Center(
                                child: Text("No have not learn any topic yet."),
                              ),
                            )
                          : ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: analysisController
                                  .arrOfProgress[position].watchHistory.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  decoration: BoxDecoration(
                                      color:
                                          _themeController.cardBackground.value,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: margin16,
                                      ),
                                      Image.network(
                                        storageUrl +
                                            analysisController
                                                .arrOfProgress[position]
                                                .watchHistory[index]
                                                .standardIcon,
                                        height: iconMediumHeightWidth,
                                        width: iconMediumHeightWidth,
                                        fit: BoxFit.fitWidth,
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
                                                  text: analysisController
                                                      .arrOfProgress[position]
                                                      .watchHistory[index]
                                                      .name,
                                                  style: textStyle10.copyWith(
                                                      color: _themeController
                                                          .textColor.value)),
                                              maxLines: 1,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Chapter : " +
                                                      analysisController
                                                          .arrOfProgress[
                                                              position]
                                                          .watchHistory[index]
                                                          .chapterName,
                                                  textScaleFactor: 1.0,
                                                  style: textStyle9.copyWith(
                                                      color: _themeController
                                                          .textColor.value),
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       EdgeInsets.only(top: 2),
                                                //   child: Icon(
                                                //     Icons
                                                //         .arrow_forward_outlined,
                                                //     color: Colors.grey,
                                                //     size: 10,
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: margin16,
                                      // ),
                                      // Image.asset(
                                      //   ASSETS_ICONS_PATH + 'ic_play.png',
                                      //   height: iconHeightWidth,
                                      //   width: iconHeightWidth,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      SizedBox(
                                        width: margin16,
                                      ),
                                    ],
                                  ),
                                );

                                //   Material(
                                //   color: _themeController.cardBackground.value,
                                //   borderRadius: BorderRadius.circular(8),
                                //   child: InkWell(
                                //     borderRadius: BorderRadius.circular(8),
                                //     onTap: () {
                                //       // Get.to(() => CustomRecentVideoPlayer(
                                //       //     analysisController
                                //       //         .arrOfProgress[position]
                                //       //         .watchHistory[index]));
                                //     },
                                //     child: Container(
                                //       height:
                                //           MediaQuery.of(context).size.height *
                                //               0.10,
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       padding:
                                //           EdgeInsets.symmetric(vertical: 8),
                                //       child: Row(
                                //         children: [
                                //           SizedBox(
                                //             width: margin16,
                                //           ),
                                //           Image.network(
                                //             storageUrl +
                                //                 analysisController
                                //                     .arrOfProgress[position]
                                //                     .watchHistory[index]
                                //                     .standardIcon,
                                //             height: iconMediumHeightWidth,
                                //             width: iconMediumHeightWidth,
                                //             fit: BoxFit.fitWidth,
                                //           ),
                                //           SizedBox(
                                //             width: margin16,
                                //           ),
                                //           Expanded(
                                //             child: Column(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.center,
                                //               crossAxisAlignment:
                                //                   CrossAxisAlignment.start,
                                //               children: [
                                //                 RichText(
                                //                   textScaleFactor: 1.0,
                                //                   text: TextSpan(
                                //                       text: analysisController
                                //                           .arrOfProgress[
                                //                               position]
                                //                           .watchHistory[index]
                                //                           .name,
                                //                       style: textStyle10.copyWith(
                                //                           color:
                                //                               _themeController
                                //                                   .textColor
                                //                                   .value)),
                                //                   maxLines: 1,
                                //                 ),
                                //                 Row(
                                //                   children: [
                                //                     Text(
                                //                       analysisController
                                //                           .arrOfProgress[
                                //                               position]
                                //                           .watchHistory[index]
                                //                           .chapterName,
                                //                       textScaleFactor: 1.0,
                                //                       style: textStyle9.copyWith(
                                //                           color:
                                //                               _themeController
                                //                                   .textColor
                                //                                   .value),
                                //                     ),
                                //                     Padding(
                                //                       padding: EdgeInsets.only(
                                //                           top: 2),
                                //                       child: Icon(
                                //                         Icons
                                //                             .arrow_forward_outlined,
                                //                         color: Colors.grey,
                                //                         size: 10,
                                //                       ),
                                //                     )
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           // SizedBox(
                                //           //   width: margin16,
                                //           // ),
                                //           // Image.asset(
                                //           //   ASSETS_ICONS_PATH + 'ic_play.png',
                                //           //   height: iconHeightWidth,
                                //           //   width: iconHeightWidth,
                                //           //   fit: BoxFit.fill,
                                //           // ),
                                //           SizedBox(
                                //             width: margin16,
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // );
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
              : Container(
                  height: Get.height * 0.10,
                  child: Center(
                    child: Text("No have not learn any topic yet."),
                  ),
                )
        ],
      ),
    );
  }
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
