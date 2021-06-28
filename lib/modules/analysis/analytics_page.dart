import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/analysis_controller.dart';
import 'package:virtual_learning/modules/analysis/performance_tab.dart';
import 'package:virtual_learning/modules/analysis/progress_tab.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateAnalyticsPage();
  }
}

class StateAnalyticsPage extends State<AnalyticsPage>
    with TickerProviderStateMixin {
  ThemeController _themeController = Get.find();
  TabController _tabController;

  AnalysisController _analysisController = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _analysisController.getPerformance();
    _analysisController.getProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: _themeController.background.value,
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
                      Padding(
                        padding: EdgeInsets.only(left: margin12),
                        child: Align(
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
                      ),
                      Center(
                        child: Text(
                          "Learning Analysis".toUpperCase(),
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
        body: Obx(() => _analysisController.isLoading.value
            ? Padding(
                padding: EdgeInsets.all(margin16),
                child: ShimmerDummyPage(),
              )
            : DefaultTabController(
                length: 2,
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
                            tabs: [
                              getTab("Performance"),
                              getTab("Progress"),
                            ],
                            controller: _tabController,
                          ),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(
                    children: [PerformanceTab(), ProgressTab()],
                    controller: _tabController,
                  ),
                ),
              )),
      ),
    );
  }

  Tab getTab(title) {
    return Tab(
      child: Text(
        title.toUpperCase(),
        style: textStyle9.copyWith(color: _themeController.textColor.value),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  ThemeController _themeController = Get.find();

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

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
