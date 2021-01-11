import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/modules/search/chapter_tab.dart';
import 'package:virtual_learning/modules/search/subject_tab.dart';
import 'package:virtual_learning/modules/search/topic_tab.dart';
import 'package:virtual_learning/widgets/square_tab_indicator.dart';

import 'non_search_view.dart';

var searchText = "";

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSearchPage();
  }
}

class _StateSearchPage extends State<SearchPage> with TickerProviderStateMixin {
  SearchController _searchController = Get.put(SearchController());

  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            leading: Container(
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Color(0xffD0E6EE),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          )),
                      width: double.infinity,
                      height: AppBar().preferredSize.height -
                          AppBar().preferredSize.height * 0.30,
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            title: TextFormField(
              autofocus: true,
              controller: _searchController.tfSearchController.value,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              style: TextStyle(),
              decoration: InputDecoration(
                  hintText: "Search concept", border: InputBorder.none),
            ),
            actions: [
              SizedBox(
                width: 16,
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
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
          body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        indicator:
                            SquareTabIndicator(color: Colors.green, radius: 2),
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
              body: searchText == ""
                  ? NonSearchView()
                  : TabBarView(
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
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

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
            color: Colors.white,
          );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
