import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/lesson/tab/notes_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/q_bank_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/test_description_tab.dart';
import 'package:virtual_learning/modules/lesson/tab/video_tab.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/widgets/shimmer_topic.dart';

class TopicListing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTopicListing();
  }
}

class _StateTopicListing extends State<TopicListing>
    with TickerProviderStateMixin {
  SubjectController _subjectController = Get.find();

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xff667db6), Color(0xff0082c8)])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    _subjectController.getTopic();
    // _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  // TabController _tabController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.dark,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  HexColor.fromHex(
                      _subjectController.selectedSubject.value.color1),
                  HexColor.fromHex(
                      _subjectController.selectedSubject.value.color2),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )),
            ),
            title: Text(
              _subjectController.selectedChapter.value.name.substring(3),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            leading: Container(
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      )),
                      width: double.infinity,
                      height: AppBar().preferredSize.height -
                          AppBar().preferredSize.height * 0.30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              // controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.white,
              onTap: (index) {},
              tabs: [
                Tab(
                  child: Text("Videos".toUpperCase()),
                ),
                Tab(
                  child: Text("Q-Bank".toUpperCase()),
                ),
                Tab(
                  child: Text("Test".toUpperCase()),
                ),
                Tab(
                  child: Text("Notes".toUpperCase()),
                ),
              ],
            ),
          ),
          body: Obx(
            () => _subjectController.isTopicLoading.value
                ? ShimmerTopic()
                : TabBarView(
                    children: [
                      VideoTab(),
                      QuestionBankTab(),
                      TestDescriptionTab(),
                      NotesTab(),
                    ],
                  ),
          )),
    );
  }
}
