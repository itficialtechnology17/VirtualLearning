import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/subject/custom_video_player.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class VideoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateVideoTab();
  }
}

class _StateVideoTab extends State<VideoTab> {
  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

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
          body: Obx(() => _subjectController.isTopicLoading.value
              ? ShimmerDummyPage()
              : _subjectController
                      .arrOfChapter[_subjectController.selectedChapterPosition]
                      .topic
                      .isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(right: margin16),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16),

                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _subjectController
                                  .arrOfChapter[_subjectController
                                      .selectedChapterPosition]
                                  .topic
                                  .length,
                              // itemCount: _subjectController.arrOfTopic.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(_subjectController
                                              .arrOfChapter[_subjectController
                                                  .selectedChapterPosition]
                                              .topic[index]
                                              .image),
                                          fit: BoxFit.cover)),
                                  child: Material(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      splashColor: Colors.white,
                                      onTap: () {
                                        if (_subjectController
                                                .arrOfChapter[_subjectController
                                                    .selectedChapterPosition]
                                                .topic[index]
                                                .content
                                                .video ==
                                            null) {
                                          showToast("Video Not Found");
                                        } else {
                                          _subjectController
                                              .selectedTopicPosition = index;

                                          _subjectController.getNextFourVideo();
                                          Get.to(CustomVideoPlayer(
                                              _subjectController
                                                  .arrOfChapter[_subjectController
                                                      .selectedChapterPosition]
                                                  .topic[index]));
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: Get.width * 0.45,
                                            height: Get.width * 0.30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: HexColor.fromHex(
                                                      _subjectController
                                                          .arrOfChapter[
                                                              _subjectController
                                                                  .selectedChapterPosition]
                                                          .topic[index]
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
                                                    text: _subjectController
                                                        .arrOfChapter[
                                                            _subjectController
                                                                .selectedChapterPosition]
                                                        .topic[index]
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
                                                    .playIconBGColor.value,
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: InkWell(
                                                  onTap: () {
                                                    if (_subjectController
                                                            .arrOfChapter[
                                                                _subjectController
                                                                    .selectedChapterPosition]
                                                            .topic[_subjectController
                                                                .selectedTopicPosition]
                                                            .content
                                                            .video ==
                                                        null) {
                                                      showToast(
                                                          "Video Not Found");
                                                    } else {
                                                      _subjectController
                                                              .selectedTopicPosition =
                                                          index;
                                                      _subjectController
                                                          .getNextFourVideo();
                                                      Get.to(CustomVideoPlayer(
                                                          _subjectController
                                                                  .arrOfChapter[
                                                                      _subjectController
                                                                          .selectedChapterPosition]
                                                                  .topic[
                                                              _subjectController
                                                                  .selectedTopicPosition]));
                                                    }
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
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          "Topics not available.",
                          style: textStyle9.copyWith(
                              color: _themeController.textColor.value),
                        ),
                      ),
                      height: Get.height - (AppBar().preferredSize.height),
                    )),
        ));
  }
}
