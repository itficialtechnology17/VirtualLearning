import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePlayVideo();
  }
}

class _StatePlayVideo extends State<PlayVideo> {
  YoutubePlayerController _controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    setVideo(_subjectController
        .arrOfTopic[_subjectController.activeTopicPosition.value]
        .content
        .videoId);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      child: YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.green,
          onReady: () {},
          onEnded: (data) {},
        ),
        builder: (context, player) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: [
                Stack(
                  children: [
                    player,
                    Material(
                      color: Colors.transparent,
                      type: MaterialType.circle,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                            _subjectController
                                .arrOfTopic[_subjectController
                                    .activeTopicPosition.value]
                                .name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(),
                          child: Icon(
                            Icons.bookmark_border,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(),
                          child: Icon(
                            Icons.share_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                )

                /*Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _subjectController.arrOfTopic.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ],
                            image: DecorationImage(
                                image: AssetImage("assets/images/ic_bg.png"),
                                fit: BoxFit.fill)),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _subjectController.activeTopicPosition.value =
                                  index;

                              setVideo(_subjectController
                                  .arrOfTopic[_subjectController
                                      .activeTopicPosition.value]
                                  .content
                                  .videoId);
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _subjectController
                                                    .arrOfTopic[index].id
                                                    .toString() +
                                                ". ".toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text: _subjectController
                                                        .arrOfTopic[index].name,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: "Poppins",
                                                        fontSize: 16)),
                                                maxLines: 1,
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                _subjectController
                                                        .arrOfTopic[index]
                                                        .minutes +
                                                    " Mins",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Material(
                                        color: Colors.white,
                                        type: MaterialType.circle,
                                        child: InkWell(
                                          splashColor: Colors.grey,
                                          onTap: () {
                                            _subjectController
                                                .activeTopicPosition
                                                .value = index;

                                            setVideo(_subjectController
                                                .arrOfTopic[_subjectController
                                                    .activeTopicPosition.value]
                                                .content
                                                .videoId);
                                          },
                                          child: CircularPercentIndicator(
                                            radius: 40.0,
                                            lineWidth: 2.0,
                                            percent: 0.4,
                                            backgroundColor: Colors.white,
                                            center: Icon(
                                              Icons.play_arrow,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                            progressColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setVideo(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        hideControls: false,
        enableCaption: false,
      ),
    );
  }
}
