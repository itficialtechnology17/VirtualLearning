import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/modules/search/chapter_tab.dart';
import 'package:virtual_learning/modules/search/subject_tab.dart';
import 'package:virtual_learning/modules/search/topic_tab.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/widgets/square_tab_indicator.dart';

String searchText = "";

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSearchPage();
  }
}

class _StateSearchPage extends State<SearchPage> with TickerProviderStateMixin {
  SearchController _searchController = Get.put(SearchController());

  ThemeController _themeController = Get.find();
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
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
                          initialValue: searchText,
                          // controller: _searchController.tfSearchController.value,
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                              if (searchText.isNotEmpty) {
                                _searchController.getSearch(searchText);
                              }
                            });
                          },
                          style: textStyle10,
                          decoration: InputDecoration(
                              hintText: "Search concept",
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: margin8,
                      ),
                      Visibility(
                        visible: searchText.length > 0 ? true : false,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              searchText = "";
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
                  length: 3,
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
                              indicator: SquareTabIndicator(
                                  color: Colors.green, radius: 2),
                              tabs: [
                                getTab("Subject"),
                                getTab("Chapter"),
                                getTab("Topic"),
                              ],
                              controller: _tabController,
                            ),
                          ),
                          pinned: true,
                        )
                      ];
                    },
                    body: TabBarView(
                      children: [SubjectTab(), ChapterTab(), TopicTab()],
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
        style: textStyle10.copyWith(color: _themeController.textColor.value),
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
    return searchText.length <= 0
        ? Container()
        : Container(
            child: _tabBar,
            color: _themeController.background.value,
          );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
