import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/search_controller.dart';
import 'package:virtual_learning/modules/subject/custom_search_video_player.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class SearchTopicTab extends StatelessWidget {
  ThemeController _themeController = Get.find();
  SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Container(
            margin: EdgeInsets.all(16),
            child: Obx(
              () => _searchController.arrOfTopic.isEmpty
                  ? Center(
                      child: Text(
                        "No Topic Founds.",
                        style: textStyle10.copyWith(
                            color: _themeController.textColor.value),
                      ),
                    )
                  : ListView(
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
                            itemCount: _searchController.arrOfTopic.length > 16
                                ? 16
                                : _searchController.arrOfTopic.length,
                            // itemCount: _subjectController.arrOfTopic.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(_searchController
                                            .arrOfTopic[index].image),
                                        fit: BoxFit.cover)),
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    splashColor: Colors.white,
                                    onTap: () {
                                      if (_searchController.arrOfTopic[index]
                                                  .content.video ==
                                              null ||
                                          _searchController.arrOfTopic[index]
                                                  .content.video ==
                                              "") {
                                        showToast("Video Not Found");
                                      } else {
                                        Get.to(CustomSearchVideoPlayer(
                                            _searchController
                                                .arrOfTopic[index]));
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
                                                    _searchController
                                                        .arrOfTopic[index]
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
                                                  text: _searchController
                                                      .arrOfTopic[index].name),
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
                                                  if (_searchController
                                                              .arrOfTopic[index]
                                                              .content
                                                              .video ==
                                                          null ||
                                                      _searchController
                                                              .arrOfTopic[index]
                                                              .content
                                                              .video ==
                                                          "") {
                                                    showToast(
                                                        "Video Not Found");
                                                  } else {
                                                    Get.to(
                                                        CustomSearchVideoPlayer(
                                                            _searchController
                                                                    .arrOfTopic[
                                                                index]));
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
            ),
          ),
        ));
  }
}
