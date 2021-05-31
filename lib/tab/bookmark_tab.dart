import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/bookmark_controller.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_bookmark.dart';
import 'package:virtual_learning/modules/bookmark/bookmark_question.dart';
import 'package:virtual_learning/modules/subject/custom_bookmark_video_player.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/widgets/circle_tab_indicator.dart';

class BookmarkTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHome();
  }
}

class _StateHome extends State<BookmarkTab> with TickerProviderStateMixin {
  int _tabCount;

  List<Tab> _tabs = List<Tab>();
  List<Widget> _tabContent = List<Widget>();
  TabController _tabController;

  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();
  BookmarkController _bookmarkController = Get.put(BookmarkController());

  DashboardController _dashboardController = Get.find();
  TestController _testController = Get.find();

  @override
  void initState() {
    super.initState();
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
          body: Stack(
            children: [
              Scaffold(
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
                          child: Center(
                            child: Text(
                              "Bookmarks".toUpperCase(),
                              style: textStyle10Bold.copyWith(
                                  color: _themeController.textColor.value),
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: FutureBuilder<List<ModelBookmark>>(
                  future: _bookmarkController.getBookmark(),
                  builder: (context, data) {
                    if (data.hasData) {
                      setTabData();
                      return Scaffold(
                        backgroundColor: _themeController.background.value,
                        body: DefaultTabController(
                          length: _bookmarkController.arrOfBookmark.length,
                          child: NestedScrollView(
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverPersistentHeader(
                                  delegate: _SliverAppBarDelegate(
                                    TabBar(
                                      isScrollable: true,
                                      labelStyle: textStyle9,
                                      labelColor: Colors.green,
                                      unselectedLabelColor:
                                          _themeController.textColor.value,
                                      indicator: CircleTabIndicator(
                                          color: Colors.green, radius: 2),
                                      tabs: _tabs,
                                      controller: _tabController,
                                    ),
                                  ),
                                  pinned: true,
                                )
                              ];
                            },
                            body: TabBarView(
                              children: getTabWidgets(),
                              controller: _tabController,
                            ),
                          ),
                        ),
                      );
                    }
                    return Scaffold(
                      backgroundColor: _themeController.background.value,
                      body: Center(
                          child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ShimmerDummyPage(),
                      )),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  void setTabData() {
    _tabCount = _bookmarkController.arrOfBookmark.length;
    _tabs = getTabs(_tabCount);
    _tabController = TabController(
        length: _tabs.length,
        vsync: this,
        initialIndex: _bookmarkController.currentBookmarkIndex.value);
  }

  List<Tab> getTabs(int count) {
    _tabs.clear();
    for (int i = 0; i < count; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Tab getTab(int widgetNumber) {
    return Tab(
      child: Text(
        _bookmarkController.arrOfBookmark[widgetNumber].name.toUpperCase(),
        style: textStyle9.copyWith(color: _themeController.textColor.value),
      ),
    );
  }

  List<Widget> getTabWidgets() {
    _tabContent.clear();
    for (int i = 0; i < _tabs.length; i++) {
      _tabContent.add(getTabContent(i));
    }
    return _tabContent;
  }

  getTabContent(int position) {
    return Container(
      color: _themeController.background.value,
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Obx(() => ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: margin8,
              ),
              _bookmarkController.arrOfBookmark[position].favourites.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Topics",
                          style: textStyle10Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin16,
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Container(
                            margin: EdgeInsets.only(right: margin16),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _bookmarkController
                                  .arrOfBookmark[position].favourites.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              _bookmarkController
                                                  .arrOfBookmark[position]
                                                  .favourites[index]
                                                  .image),
                                          fit: BoxFit.cover)),
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {
                                        // _subjectController.selectedTopicPosition = index;
                                        // _subjectController.getNextFourVideo();
                                        Get.to(CustomBookmarkVideoPlayer(
                                            _bookmarkController
                                                .arrOfBookmark[position]
                                                .favourites[index]));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            // width: Get.width * 0.45,
                                            // height: Get.width * 0.30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: HexColor.fromHex(
                                                      _bookmarkController
                                                          .arrOfBookmark[
                                                              position]
                                                          .favourites[index]
                                                          .color)
                                                  .withOpacity(0.80),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: margin4,
                                                bottom: margin24,
                                                right: margin20,
                                              ),
                                              child: RichText(
                                                maxLines: 3,
                                                textAlign: TextAlign.left,
                                                text: TextSpan(
                                                    style: textStyle9.copyWith(
                                                        color: Colors.white),
                                                    text: _bookmarkController
                                                        .arrOfBookmark[position]
                                                        .favourites[index]
                                                        .name),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: margin4,
                                                  right: margin4),
                                              child: Material(
                                                color: _themeController
                                                    .iconColor.value,
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(CustomBookmarkVideoPlayer(
                                                        _bookmarkController
                                                                .arrOfBookmark[
                                                                    position]
                                                                .favourites[
                                                            index]));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(margin2),
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      size: iconHeightWidth,
                                                      color: _themeController
                                                          .playIconColor.value,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: margin16,
                        ),
                        Container(
                          width: Get.width,
                          height: 2,
                          color: Color(0xffE9E9E9),
                        ),
                      ],
                    ),
              SizedBox(
                height: margin8,
              ),
              _bookmarkController
                      .arrOfBookmark[position].chapterQuestion.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Chapter Question",
                          style: textStyle10Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin16,
                        ),
                        ListView.separated(
                            itemCount: _bookmarkController
                                .arrOfBookmark[position].chapterQuestion.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Material(
                                color: _themeController.cardBackground.value,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(BookMarkQuestion(
                                        _bookmarkController
                                            .arrOfBookmark[position]
                                            .chapterQuestion[index],
                                        position,
                                        index));
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: margin4),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: margin8,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Html(
                                                  data: _bookmarkController
                                                      .arrOfBookmark[position]
                                                      .chapterQuestion[index]
                                                      .question,
                                                  style: {
                                                    "body": Style(
                                                        color: _themeController
                                                            .textColor.value,
                                                        fontFamily: "Nunito"),
                                                  }),
                                              SizedBox(
                                                height: margin2,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: margin4),
                                                child: Text(
                                                  _bookmarkController
                                                      .arrOfBookmark[position]
                                                      .displayName,
                                                  style: textStyle9.copyWith(
                                                      color: _themeController
                                                          .textColor.value),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: margin8,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (_bookmarkController
                                                          .arrOfBookmark[
                                                              position]
                                                          .chapterQuestion[
                                                              index]
                                                          .isFavorite ==
                                                      0) {
                                                    _testController
                                                        .setQuestionBookmark(
                                                            _bookmarkController
                                                                .arrOfBookmark[
                                                                    position]
                                                                .chapterQuestion[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                            "chapter");

                                                    _bookmarkController
                                                        .arrOfBookmark[position]
                                                        .chapterQuestion[index]
                                                        .isFavorite = 1;
                                                  } else {
                                                    _subjectController
                                                        .removeFavorite(
                                                            _bookmarkController
                                                                .arrOfBookmark[
                                                                    position]
                                                                .chapterQuestion[
                                                                    index]
                                                                .isFavorite
                                                                .toString(),
                                                            true);

                                                    _bookmarkController
                                                        .arrOfBookmark[position]
                                                        .chapterQuestion[index]
                                                        .isFavorite = 0;
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                _bookmarkController
                                                            .arrOfBookmark[
                                                                position]
                                                            .chapterQuestion[
                                                                index]
                                                            .isFavorite !=
                                                        0
                                                    ? Icons.bookmark
                                                    : Icons
                                                        .bookmark_border_outlined,
                                                color: Colors.green,
                                                size: iconHeightWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: margin8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_themeController, index) {
                              return SizedBox(
                                height: margin12,
                              );
                            }),
                        SizedBox(
                          height: margin8,
                        ),
                      ],
                    ),
              _bookmarkController.arrOfBookmark[position].topicQuestion.isEmpty
                  ? SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Topic Question",
                          style: textStyle10Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
                        SizedBox(
                          height: margin16,
                        ),
                        ListView.separated(
                            itemCount: _bookmarkController
                                .arrOfBookmark[position].topicQuestion.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Material(
                                color: _themeController.cardBackground.value,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      BookMarkQuestion(
                                          _bookmarkController
                                              .arrOfBookmark[position]
                                              .topicQuestion[index],
                                          position,
                                          index),
                                    );
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: margin4),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: margin8,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Html(
                                                  data: _bookmarkController
                                                      .arrOfBookmark[position]
                                                      .topicQuestion[index]
                                                      .question,
                                                  style: {
                                                    "body": Style(
                                                        color: _themeController
                                                            .textColor.value,
                                                        fontFamily: "Nunito"),
                                                  }),
                                              SizedBox(
                                                height: margin2,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: margin4),
                                                child: Text(
                                                  _bookmarkController
                                                      .arrOfBookmark[position]
                                                      .displayName,
                                                  style: textStyle9.copyWith(
                                                      color: _themeController
                                                          .textColor.value),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: margin8,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (_bookmarkController
                                                          .arrOfBookmark[
                                                              position]
                                                          .topicQuestion[index]
                                                          .isFavorite ==
                                                      0) {
                                                    _testController
                                                        .setQuestionBookmark(
                                                            _bookmarkController
                                                                .arrOfBookmark[
                                                                    position]
                                                                .topicQuestion[
                                                                    index]
                                                                .topicId
                                                                .toString(),
                                                            "topic");

                                                    _bookmarkController
                                                        .arrOfBookmark[position]
                                                        .topicQuestion[index]
                                                        .isFavorite = 1;
                                                  } else {
                                                    _subjectController
                                                        .removeFavorite(
                                                            _bookmarkController
                                                                .arrOfBookmark[
                                                                    position]
                                                                .topicQuestion[
                                                                    index]
                                                                .isFavorite
                                                                .toString(),
                                                            true);

                                                    _bookmarkController
                                                        .arrOfBookmark[position]
                                                        .topicQuestion[index]
                                                        .isFavorite = 0;
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                _bookmarkController
                                                            .arrOfBookmark[
                                                                position]
                                                            .topicQuestion[
                                                                index]
                                                            .isFavorite !=
                                                        0
                                                    ? Icons.bookmark
                                                    : Icons
                                                        .bookmark_border_outlined,
                                                color: Colors.green,
                                                size: iconHeightWidth,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: margin8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_themeController, index) {
                              return SizedBox(
                                height: margin12,
                              );
                            }),
                        SizedBox(
                          height: margin8,
                        ),
                      ],
                    ),
            ],
          )),
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
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: _themeController.background.value,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
