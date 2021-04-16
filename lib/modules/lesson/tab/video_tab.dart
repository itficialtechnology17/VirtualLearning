import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/subject/custom_video_player.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class VideoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateVideoTab();
  }
}

class _StateVideoTab extends State<VideoTab> {
  SubjectController _subjectController = Get.find();

  var arrOfChapterBG = [
    'https://itficial.app/virtuale/storage/pencils-5096372_960_720.jpeg',
    // 'https://itficial.app/virtuale/storage/1.jpg',
    // 'https://itficial.app/virtuale/storage/2.jpg',
    // 'https://itficial.app/virtuale/storage/3.jpg',
    // 'https://itficial.app/virtuale/storage/5.jpg'
    //     'https://itficial.app/virtuale/storage/6.jpg'
    //     'https://itficial.app/virtuale/storage/7.jpg'
  ];

  List<Color> colors = [
    Color(0xff0A0A78),
    Color(0xffF9CC12),
    Color(0xff22813D),
    // Color(0xff00B4FF),
    // Color(0xff17212A),
    Color(0xff4E2A99),
    // Color(0xff7FCB4F),
    Color(0xffFD5CA0),
  ];

  getRandomBG() {
    return (arrOfChapterBG.toList()..shuffle()).first;
  }

  getRandomColor() {
    return (colors.toList()..shuffle()).first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Container(
        margin: EdgeInsets.only(right: margin16),
        child: ListView(
          shrinkWrap: true,
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _subjectController
                    .arrOfChapter[_subjectController.selectedChapterPosition]
                    .topic
                    .length,
                // itemCount: _subjectController.arrOfTopic.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(_subjectController
                                .arrOfChapter[
                                    _subjectController.selectedChapterPosition]
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
                          _subjectController.selectedTopicPosition = index;
                          _subjectController.getNextFourVideo();
                          Get.to(CustomVideoPlayer(_subjectController
                                  .arrOfChapter[_subjectController
                                      .selectedChapterPosition]
                                  .topic[
                              _subjectController.selectedTopicPosition]));
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 0.45,
                              height: Get.width * 0.30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: HexColor.fromHex(_subjectController
                                        .arrOfChapter[_subjectController
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
                                          .arrOfChapter[_subjectController
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
                                    bottom: margin4, right: margin4),
                                child: Material(
                                  color: Colors.white.withOpacity(0.90),
                                  type: MaterialType.circle,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      _subjectController.selectedTopicPosition =
                                          index;
                                      _subjectController.getNextFourVideo();
                                      Get.to(CustomVideoPlayer(_subjectController
                                              .arrOfChapter[_subjectController
                                                  .selectedChapterPosition]
                                              .topic[
                                          _subjectController
                                              .selectedTopicPosition]));
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
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
