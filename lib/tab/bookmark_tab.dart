import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/bookmark_controller.dart';
import 'package:virtual_learning/model/model_bookmark.dart';
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

  BookmarkController _bookmarkController = Get.put(BookmarkController());

  @override
  void initState() {
    super.initState();
    // _bookmarkController.getBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: Colors.white,
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
                          style: textStyle10Bold,
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  ),
                  // TabBar(
                  //   isScrollable: true,
                  //   labelStyle: TextStyle(
                  //       fontFamily: 'Nunito',
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.white),
                  //   labelColor: Colors.green,
                  //   unselectedLabelColor: Colors.black,
                  //   indicator:
                  //       CircleTabIndicator(color: Colors.green, radius: 2),
                  //   tabs: _tabs,
                  //   controller: _tabController,
                  // ),
                ],
              ),
            ),
            body: FutureBuilder<List<ModelBookmark>>(
              future: _bookmarkController.getBookmark(),
              builder: (context, data) {
                if (data.hasData) {
                  setTabData();
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: DefaultTabController(
                      length: _bookmarkController.arrOfBookmark.length,
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            // SliverAppBar(
                            //   centerTitle: true,
                            //   brightness: Brightness.light,
                            //   expandedHeight:
                            //       MediaQuery.of(context).size.height * 0.20 -
                            //           16,
                            //   elevation: 0,
                            //   pinned: true,
                            //   titleSpacing: 0.0,
                            //   automaticallyImplyLeading: false,
                            //   leading: Container(
                            //     child: Center(
                            //       child: Material(
                            //         color: Colors.transparent,
                            //         child: InkWell(
                            //           onTap: () {
                            //             Navigator.pop(context);
                            //           },
                            //           child: Container(
                            //             margin: EdgeInsets.only(right: 8),
                            //             decoration: BoxDecoration(
                            //                 color: Color(0xffD0E6EE),
                            //                 borderRadius: BorderRadius.only(
                            //                   topRight: Radius.circular(4),
                            //                   bottomRight: Radius.circular(4),
                            //                 )),
                            //             width: double.infinity,
                            //             height: AppBar().preferredSize.height -
                            //                 AppBar().preferredSize.height *
                            //                     0.30,
                            //             child: Icon(Icons.arrow_back,
                            //                 color: Colors.black),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   flexibleSpace: Container(
                            //     height:
                            //         MediaQuery.of(context).size.height * 0.20 +
                            //             MediaQuery.of(context).padding.top +
                            //             20,
                            //     color: Colors.white,
                            //     child: Align(
                            //       alignment: Alignment.bottomCenter,
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.end,
                            //         children: [
                            //           Text(
                            //             "Bookmarks",
                            //             style: TextStyle(
                            //                 color: Colors.black,
                            //                 fontFamily: "Nunito",
                            //                 fontSize: 18,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //           Text(
                            //             "List of Bookmarks topics",
                            //             style: TextStyle(
                            //                 color: Colors.grey,
                            //                 fontFamily: "Nunito",
                            //                 fontSize: 12),
                            //           ),
                            //           SizedBox(
                            //             height: 8,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SliverPersistentHeader(
                              delegate: _SliverAppBarDelegate(
                                TabBar(
                                  isScrollable: true,
                                  labelStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                  labelColor: Colors.green,
                                  unselectedLabelColor: Colors.black,
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
                  body: Center(
                      child: Text(data.hasError
                          ? data.error.toString()
                          : "Loading...")),
                );
              },
            ),
          )
        ],
      ),
    );

    // return Scaffold(
    //   body:
    //   FutureBuilder<List<ModelBookmark>>(
    //     future: _bookmarkController.getBookmark(),
    //     builder: (context, data) {
    //       if (data.hasData) {
    //         setTabData();
    //         return Scaffold(
    //           body: DefaultTabController(
    //             length: _bookmarkController.arrOfBookmark.length,
    //             child: NestedScrollView(
    //               headerSliverBuilder:
    //                   (BuildContext context, bool innerBoxIsScrolled) {
    //                 return <Widget>[
    //                   SliverAppBar(
    //                     centerTitle: true,
    //                     brightness: Brightness.light,
    //                     expandedHeight:
    //                         MediaQuery.of(context).size.height * 0.20 - 16,
    //                     elevation: 0,
    //                     pinned: true,
    //                     titleSpacing: 0.0,
    //                     automaticallyImplyLeading: false,
    //                     leading: Container(
    //                       child: Center(
    //                         child: Material(
    //                           color: Colors.transparent,
    //                           child: InkWell(
    //                             onTap: () {
    //                               Navigator.pop(context);
    //                             },
    //                             child: Container(
    //                               margin: EdgeInsets.only(right: 8),
    //                               decoration: BoxDecoration(
    //                                   color: Color(0xffD0E6EE),
    //                                   borderRadius: BorderRadius.only(
    //                                     topRight: Radius.circular(4),
    //                                     bottomRight: Radius.circular(4),
    //                                   )),
    //                               width: double.infinity,
    //                               height: AppBar().preferredSize.height -
    //                                   AppBar().preferredSize.height * 0.30,
    //                               child: Icon(Icons.arrow_back,
    //                                   color: Colors.black),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     flexibleSpace: Container(
    //                       height: MediaQuery.of(context).size.height * 0.20 +
    //                           MediaQuery.of(context).padding.top +
    //                           20,
    //                       color: Colors.white,
    //                       child: Align(
    //                         alignment: Alignment.bottomCenter,
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: [
    //                             Text(
    //                               "Bookmarks",
    //                               style: TextStyle(
    //                                   color: Colors.black,
    //                                   fontFamily: "Nunito",
    //                                   fontSize: 18,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                             Text(
    //                               "List of Bookmarks topics",
    //                               style: TextStyle(
    //                                   color: Colors.grey,
    //                                   fontFamily: "Nunito",
    //                                   fontSize: 12),
    //                             ),
    //                             SizedBox(
    //                               height: 8,
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   SliverPersistentHeader(
    //                     delegate: _SliverAppBarDelegate(
    //                       TabBar(
    //                         isScrollable: true,
    //                         labelStyle: TextStyle(
    //                             fontFamily: 'Nunito',
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400,
    //                             color: Colors.white),
    //                         labelColor: Colors.green,
    //                         unselectedLabelColor: Colors.black,
    //                         indicator: CircleTabIndicator(
    //                             color: Colors.green, radius: 2),
    //                         tabs: _tabs,
    //                         controller: _tabController,
    //                       ),
    //                     ),
    //                     pinned: true,
    //                   )
    //                 ];
    //               },
    //               body: TabBarView(
    //                 children: getTabWidgets(),
    //                 controller: _tabController,
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //       return Scaffold(
    //         body: Center(
    //             child:
    //                 Text(data.hasError ? data.error.toString() : "Loading...")),
    //       );
    //     },
    //   ),
    // );
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
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
        ),
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

  // getTabContent(int position) {
  //   return Container(
  //     color: Colors.white,
  //     child: Obx(() => ListView.separated(
  //           shrinkWrap: true,
  //           itemCount:
  //               _bookmarkController.arrOfBookmark[position].favourites.length,
  //           itemBuilder: (context, index) {
  //             return Container(
  //               margin: EdgeInsets.symmetric(horizontal: 16),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(24),
  //                   boxShadow: [
  //                     BoxShadow(
  //                         color: Colors.white, spreadRadius: 1, blurRadius: 4)
  //                   ],
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/images/ic_bg.png"),
  //                       fit: BoxFit.fill)),
  //               child: Material(
  //                 color: Colors.transparent,
  //                 borderRadius: BorderRadius.circular(24),
  //                 child: InkWell(
  //                   splashColor: Colors.white,
  //                   onTap: () {
  //                     /*_subjectController
  //                     .activeTopicPosition.value = index;
  //                 Get.to(PlayVideo());*/
  //                   },
  //                   borderRadius: BorderRadius.circular(24),
  //                   child: Column(
  //                     children: [
  //                       Padding(
  //                         padding: EdgeInsets.only(
  //                             left: 16, right: 16, top: 16, bottom: 16),
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Row(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 SizedBox(
  //                                   width: 8,
  //                                 ),
  //                                 Column(
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     RichText(
  //                                       text: TextSpan(
  //                                           text: _bookmarkController
  //                                               .arrOfBookmark[position]
  //                                               .favourites[index]
  //                                               .name,
  //                                           style: TextStyle(
  //                                               color: Colors.black,
  //                                               fontWeight: FontWeight.w600,
  //                                               fontFamily: "Nunito",
  //                                               fontSize: 16)),
  //                                       maxLines: 1,
  //                                     ),
  //                                     SizedBox(
  //                                       height: 4,
  //                                     ),
  //                                     // Text(
  //                                     //   _bookmarkController
  //                                     //           .arrOfBookmark[position]
  //                                     //           .favourites[index]
  //                                     //           .minutes +
  //                                     //       " Mins",
  //                                     //   style: TextStyle(
  //                                     //       color: Colors.black45,
  //                                     //       fontWeight: FontWeight.w600,
  //                                     //       fontSize: 12),
  //                                     // ),
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                             Spacer(),
  //                             Material(
  //                               color: Colors.transparent,
  //                               borderRadius: BorderRadius.circular(8),
  //                               child: InkWell(
  //                                 onTap: () {
  //                                   setState(() {
  //                                     if (_bookmarkController
  //                                             .arrOfBookmark[position]
  //                                             .favourites[index]
  //                                             .isFavorite ==
  //                                         0) {
  //                                       _bookmarkController.setFavorite(
  //                                           _bookmarkController
  //                                               .arrOfBookmark[position]
  //                                               .subjectId
  //                                               .toString(),
  //                                           _bookmarkController
  //                                               .arrOfBookmark[position]
  //                                               .favourites[index]
  //                                               .id
  //                                               .toString());
  //
  //                                       _bookmarkController
  //                                           .arrOfBookmark[position]
  //                                           .favourites[index]
  //                                           .isFavorite = 1;
  //                                     } else {
  //                                       _bookmarkController.removeFavorite(
  //                                           _bookmarkController
  //                                               .arrOfBookmark[position]
  //                                               .favourites[index]
  //                                               .id
  //                                               .toString());
  //
  //                                       _bookmarkController
  //                                           .arrOfBookmark[position]
  //                                           .favourites[index]
  //                                           .isFavorite = 0;
  //                                     }
  //                                   });
  //                                 },
  //                                 child: Container(
  //                                   padding: EdgeInsets.all(10),
  //                                   decoration: BoxDecoration(),
  //                                   child: Icon(
  //                                     _bookmarkController
  //                                                 .arrOfBookmark[position]
  //                                                 .favourites[index]
  //                                                 .isFavorite ==
  //                                             0
  //                                         ? Icons.bookmark_border
  //                                         : Icons.bookmark_outlined,
  //                                     color: Colors.green,
  //                                     size: 32,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 8,
  //                             ),
  //                             Material(
  //                               color: Colors.white,
  //                               type: MaterialType.circle,
  //                               child: InkWell(
  //                                 splashColor: Colors.grey,
  //                                 onTap: () {
  //                                   /*_subjectController
  //                                       .activeTopicPosition.value = index;
  //                                   Get.to(PlayVideo());*/
  //                                 },
  //                                 child: CircularPercentIndicator(
  //                                   radius: 30.0,
  //                                   lineWidth: 2.0,
  //                                   percent: 0.4,
  //                                   backgroundColor: Colors.white,
  //                                   center: Icon(
  //                                     Icons.play_arrow,
  //                                     color: Colors.green,
  //                                     size: 20,
  //                                   ),
  //                                   progressColor: Colors.green,
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 8,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //           separatorBuilder: (context, index) {
  //             return SizedBox(
  //               height: 16,
  //             );
  //           },
  //         )),
  //   );
  //   /*return Container(
  //       color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);*/
  // }

  getTabContent(int position) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Obx(() => MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _bookmarkController
                    .arrOfBookmark[position].favourites.length,
                // itemCount: _subjectController.arrOfTopic.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(_bookmarkController
                                .arrOfBookmark[position]
                                .favourites[index]
                                .image),
                            fit: BoxFit.cover)),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        splashColor: Colors.white,
                        onTap: () {
                          // _subjectController.selectedTopicPosition = index;
                          // _subjectController.getNextFourVideo();
                          // Get.to(CustomVideoPlayer(_subjectController
                          //     .arrOfChapter[
                          //         _subjectController.selectedChapterPosition]
                          //     .topic[_subjectController.selectedTopicPosition]));
                          showToast("Work in process");
                        },
                        child: Stack(
                          children: [
                            Container(
                              // width: Get.width * 0.45,
                              // height: Get.width * 0.30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: HexColor.fromHex(_bookmarkController
                                        .arrOfBookmark[position]
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
                                    bottom: margin4, right: margin4),
                                child: Material(
                                  color: Colors.white.withOpacity(0.90),
                                  type: MaterialType.circle,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      // _subjectController.selectedTopicPosition =
                                      //     index;
                                      // _subjectController.getNextFourVideo();
                                      // Get.to(CustomVideoPlayer(_subjectController
                                      //         .arrOfChapter[_subjectController
                                      //             .selectedChapterPosition]
                                      //         .topic[
                                      //     _subjectController
                                      //         .selectedTopicPosition]));
                                      showToast("Work in process");
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin2),
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: iconHeightWidth,
                                      ),
                                      /*child: Image.asset(
                                                      ASSETS_ICONS_PATH +
                                                          'ic_play.png',
                                                      height:
                                                          iconHeightWidth - 8,
                                                      width:
                                                          iconHeightWidth - 8,
                                                      fit: BoxFit.fill,
                                                    ),*/
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
          )),
    );
    /*return Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);*/
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
