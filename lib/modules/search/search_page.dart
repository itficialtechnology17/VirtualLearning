import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/modules/search/chapter_tab.dart';
import 'package:virtual_learning/modules/search/search_notes_tab.dart';
import 'package:virtual_learning/modules/search/search_test_description_tab.dart';
import 'package:virtual_learning/modules/search/search_topic_tab.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/widgets/square_tab_indicator.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSearchPage();
  }
}

class _StateSearchPage extends State<SearchPage> with TickerProviderStateMixin {
  SearchController _searchController = Get.put(SearchController());

  final tfSearchController = TextEditingController();
  ThemeController _themeController = Get.find();
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    tfSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: margin8,
                      ),
                      Material(
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
                      SizedBox(
                        width: margin8,
                      ),
                      Expanded(
                        child: TextFormField(
                          autofocus: true,
                          controller: tfSearchController,
                          onChanged: (value) {
                            setState(() {
                              if (tfSearchController.text
                                  .toString()
                                  .isNotEmpty) {
                                _searchController.getSearch(
                                    tfSearchController.text.toString());
                              }
                            });
                          },
                          style: textStyle10.copyWith(
                              color: _themeController.textColor.value),
                          decoration: InputDecoration(
                              hintText: "Search chapter,topic,test,notes",
                              hintStyle:
                                  textStyle9.copyWith(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: margin8,
                      ),
                      Visibility(
                        visible: tfSearchController.text.toString().length > 0
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tfSearchController.text = "";
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: _themeController.iconColor.value,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: margin8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: _searchController.isLoading.value
              ? Padding(
                  padding: EdgeInsets.all(margin16),
                  child: ShimmerDummyPage(),
                )
              : DefaultTabController(
                  length: 4,
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverPersistentHeader(
                          delegate: _SliverAppBarDelegate(
                            TabBar(
                              labelStyle: textStyle10,
                              labelColor: Colors.green,
                              isScrollable: false,
                              unselectedLabelColor: textColor,
                              indicator: SquareTabIndicator(
                                  color: Colors.green, radius: 2),
                              tabs: [
                                getTab("Chapter"),
                                getTab("Topic"),
                                getTab("Test"),
                                getTab("Notes"),
                              ],
                              controller: _tabController,
                            ),
                          ),
                          pinned: true,
                        )
                      ];
                    },
                    body: TabBarView(
                      children: [
                        ChapterTab(),
                        SearchTopicTab(),
                        SearchTestDescriptionTab(),
                        SearchNotesTab()
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
        ));
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
  SearchController _searchController = Get.find();

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: _themeController.background.value,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
