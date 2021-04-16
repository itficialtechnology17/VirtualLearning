import 'dart:async';

import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/modules/lesson/topic_test.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CustomVideoPlayer extends StatefulWidget {
  final ModelTopic modelTopic;

  CustomVideoPlayer(this.modelTopic);

  @override
  State<StatefulWidget> createState() {
    return _YoutubeVideoState();
  }
}

class _YoutubeVideoState extends State<CustomVideoPlayer> {
  bool controllerVisible = true;
  bool isMute = false;
  double volume = 0;
  VideoPlayerController _controller;
  // YoutubePlayerController _controller;
  // YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // startTimer();

    //getUrl();
    _controller = VideoPlayerController.network(
      // 'https://itficial.app/virtuale/test_video.mp4',
      'https://www.youtube.com/watch?v=' +
          widget.modelTopic.content.videoId +
          '',
      youtubeVideoQuality: VideoQuality.low144,

      // 'https://www.youtube.com/watch?v=6jvqXxt3WNo',
      // 'https://www.youtube.com/watch?v=w70AWWb3fJI',
      // 'https://www.youtube.com/watch?v=Ac1U3Sbhnfk',
      // youtubeVideoQuality: VideoQuality.high4320
      // 'https://itficial.app/virtuale/test_video.mp4',
      // 'https://www.youtube.com/download_my_video?v=Ld09km3rnUQ&t=QUFFLUhqa0JaZUVYdHlqcE4wRm53NlVHNXpKU0ttSXV6d3xBQ3Jtc0tuTk1BUVdyeTk1T2FtZ1hrME8zdmJtdE1SeTFheXQtdFBjV3FPREhrVTFFbzA3c1RuYlpCa19aMlZkR3JyMnYtdGNYbi1welRxdjFDdkpXdXJMVXRsSm1Scmo5S1BUdTVKbFRFTVdUem1McnFEam5JOA%3D%3D',
    );
    //
    // _controller = YoutubePlayerController(
    //   initialVideoId: widget.modelTopic.content.videoId,
    //   flags: const YoutubePlayerFlags(
    //       mute: false,
    //       autoPlay: true,
    //       disableDragSeek: false,
    //       loop: false,
    //       controlsVisibleAtStart: false,
    //       isLive: false,
    //       forceHD: true,
    //       enableCaption: false,
    //       hideControls: true),
    // )..addListener(listener);

    // _controller = YoutubePlayerController(
    //   initialVideoId: widget.modelTopic.content.videoId,
    //   params: const YoutubePlayerParams(
    //     showControls: false,
    //     showFullscreenButton: false,
    //     desktopMode: false,
    //     autoPlay: true,
    //     privacyEnhanced: false,
    //     // useHybridComposition: true,
    //   ),
    // );

    _controller.addListener(() {
      setState(() {
        print("Okay Test");
      });
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();

    // var _duration = new Duration(seconds: 4);
    // Timer(_duration, hideController);
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }

  // double _volume = 100;
  // bool _muted = false;
  // bool _isPlayerReady = false;
  // PlayerState _playerState;
  // YoutubeMetaData _videoMetaData;

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Duration lastPlayedSecond = _controller.value.position;
    _subjectController.setWatchHistory(
        lastPlayedSecond.inMinutes.toString(),
        _subjectController
            .arrOfChapter[_subjectController.selectedChapterPosition]
            .topic[_subjectController.selectedTopicPosition]
            .content
            .id
            .toString(),
        _subjectController
            .arrOfChapter[_subjectController.selectedChapterPosition]
            .topic[_subjectController.selectedTopicPosition]
            .id
            .toString());
    super.dispose();
  }

  hideController() {
    setState(() {
      if (_controller.value.isPlaying) controllerVisible = false;
    });
  }

  SubjectController _subjectController = Get.find();
  TestController _testController = Get.find();

  int rotation = 0;

  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _start++;
          if (_start == 10) {
            hideController();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          rotation == 0
              ? Container(
                  color: Colors.white,
                )
              : SizedBox.shrink(),
          rotation != 0
              ? Center(
                  child: RotatedBox(
                    child: Container(
                      // color: Colors.black,
                      child: AspectRatio(
                        // aspectRatio: _controller.value.aspectRatio,
                        aspectRatio: 16 / 9,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            GestureDetector(
                              child: Container(
                                color: controllerVisible
                                    ? Colors.black26
                                    : Colors.transparent,
                              ),
                              onTap: () {
                                setState(() {
                                  controllerVisible = !controllerVisible;
                                  if (controllerVisible) {
                                    var _duration = new Duration(seconds: 4);
                                    Timer(_duration, hideController);
                                  }
                                });
                              },
                            ),
                            controllerVisible
                                ? Stack(
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Duration currentDuration =
                                                          _controller
                                                              .value.position;
                                                      Duration _nextDuration =
                                                          Duration(
                                                              milliseconds:
                                                                  10000);
                                                      _controller.seekTo(
                                                          currentDuration -
                                                              _nextDuration);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Icon(
                                                        Icons.replay_10,
                                                        color: Colors.white,
                                                        size: Get.width * 0.10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (_controller
                                                          .value.isPlaying) {
                                                        setState(() {
                                                          controllerVisible =
                                                              true;
                                                        });
                                                        _controller.pause();
                                                      } else {
                                                        _controller.play();
                                                        setState(() {
                                                          controllerVisible =
                                                              false;
                                                        });
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Icon(
                                                        _controller
                                                                .value.isPlaying
                                                            ? Icons.pause
                                                            : Icons.play_arrow,
                                                        color: Colors.white,
                                                        size: Get.width * 0.10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Duration currentDuration =
                                                          _controller
                                                              .value.position;
                                                      Duration _nextDuration =
                                                          Duration(
                                                              milliseconds:
                                                                  10000);
                                                      _controller.seekTo(
                                                          currentDuration +
                                                              _nextDuration);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Icon(
                                                        Icons.forward_10,
                                                        color: Colors.white,
                                                        size: Get.width * 0.10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 4),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: VideoProgressIndicator(
                                                  _controller,
                                                  allowScrubbing: true,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Material(
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    _showBottomSheet(context);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "1x",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isMute = !isMute;
                                                      if (isMute) {
                                                        volume = _controller
                                                            .value.volume;
                                                        _controller
                                                            .setVolume(0);
                                                      } else {
                                                        _controller
                                                            .setVolume(volume);
                                                      }
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      isMute
                                                          ? Icons
                                                              .volume_off_sharp
                                                          : Icons.volume_up,
                                                      color: Colors.white,
                                                      size: Get.width * 0.06,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Material(
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (rotation == 0) {
                                                        rotation = 45;
                                                      } else {
                                                        rotation = 0;
                                                      }
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: Icon(
                                                      Icons.fullscreen,
                                                      color: Colors.white,
                                                      size: Get.width * 0.06,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Align(
                                      //   alignment: Alignment.topRight,
                                      //   child: Material(
                                      //     type: MaterialType.circle,
                                      //     clipBehavior:
                                      //         Clip.antiAliasWithSaveLayer,
                                      //     color: Colors.transparent,
                                      //     child: InkWell(
                                      //       onTap: () {},
                                      //       child: Padding(
                                      //         padding: EdgeInsets.symmetric(
                                      //             horizontal: 16, vertical: 8),
                                      //         child: Icon(
                                      //           Icons.more_vert,
                                      //           color: Colors.white,
                                      //           size: Get.width * 0.06,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  )
                                : SizedBox.shrink(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).padding.top,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: margin4,
                                    ),
                                    controllerVisible
                                        ? Material(
                                            color: Colors.transparent,
                                            type: MaterialType.circle,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  rotation = 0;
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(margin8),
                                                child: Image.asset(
                                                  ASSETS_ICONS_PATH +
                                                      'ic_back.png',
                                                  height: iconHeightWidth,
                                                  width: iconHeightWidth,
                                                  fit: BoxFit.fitWidth,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    quarterTurns: rotation,
                  ),
                )
              : RotatedBox(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Column(
                      children: [
                        AspectRatio(
                          // aspectRatio: _controller.value.aspectRatio,
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              VideoPlayer(_controller),
                              GestureDetector(
                                child: Container(
                                  color: controllerVisible
                                      ? Colors.black26
                                      : Colors.transparent,
                                ),
                                onTap: () {
                                  setState(() {
                                    controllerVisible = !controllerVisible;
                                    if (controllerVisible) {
                                      var _duration = new Duration(seconds: 4);
                                      Timer(_duration, hideController);
                                    }
                                  });
                                },
                              ),
                              controllerVisible
                                  ? Stack(
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Material(
                                                    type: MaterialType.circle,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Duration
                                                            currentDuration =
                                                            _controller
                                                                .value.position;
                                                        Duration _nextDuration =
                                                            Duration(
                                                                milliseconds:
                                                                    10000);
                                                        _controller.seekTo(
                                                            currentDuration -
                                                                _nextDuration);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Icon(
                                                          Icons.replay_10,
                                                          color: Colors.white,
                                                          size:
                                                              Get.width * 0.10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Material(
                                                    type: MaterialType.circle,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (_controller
                                                            .value.isPlaying) {
                                                          setState(() {
                                                            controllerVisible =
                                                                true;
                                                          });
                                                          _controller.pause();
                                                        } else {
                                                          _controller.play();
                                                          setState(() {
                                                            controllerVisible =
                                                                false;
                                                          });
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Icon(
                                                          _controller.value
                                                                  .isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          color: Colors.white,
                                                          size:
                                                              Get.width * 0.10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Material(
                                                    type: MaterialType.circle,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Duration
                                                            currentDuration =
                                                            _controller
                                                                .value.position;
                                                        Duration _nextDuration =
                                                            Duration(
                                                                milliseconds:
                                                                    10000);
                                                        _controller.seekTo(
                                                            currentDuration +
                                                                _nextDuration);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Icon(
                                                          Icons.forward_10,
                                                          color: Colors.white,
                                                          size:
                                                              Get.width * 0.10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: VideoProgressIndicator(
                                                    _controller,
                                                    allowScrubbing: true,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      _showBottomSheet(context);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Text(
                                                        "1x",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        isMute = !isMute;
                                                        if (isMute) {
                                                          volume = _controller
                                                              .value.volume;
                                                          _controller
                                                              .setVolume(0);
                                                        } else {
                                                          _controller.setVolume(
                                                              volume);
                                                        }
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Icon(
                                                        isMute
                                                            ? Icons
                                                                .volume_off_sharp
                                                            : Icons.volume_up,
                                                        color: Colors.white,
                                                        size: Get.width * 0.06,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Material(
                                                  type: MaterialType.circle,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (rotation == 0) {
                                                          rotation = 45;
                                                        } else {
                                                          rotation = 0;
                                                        }
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Icon(
                                                        Icons.fullscreen,
                                                        color: Colors.white,
                                                        size: Get.width * 0.06,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Align(
                                        //   alignment: Alignment.topRight,
                                        //   child: Material(
                                        //     type: MaterialType.circle,
                                        //     clipBehavior:
                                        //         Clip.antiAliasWithSaveLayer,
                                        //     color: Colors.transparent,
                                        //     child: InkWell(
                                        //       onTap: () {},
                                        //       child: Padding(
                                        //         padding: EdgeInsets.symmetric(
                                        //             horizontal: 16, vertical: 8),
                                        //         child: Icon(
                                        //           Icons.more_vert,
                                        //           color: Colors.white,
                                        //           size: Get.width * 0.06,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   height: MediaQuery.of(context).padding.top,
                                  //   color: Colors.black,
                                  // ),
                                  Row(
                                    children: [
                                      controllerVisible
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: margin4),
                                              child: Material(
                                                color: Colors.transparent,
                                                type: MaterialType.circle,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(margin8),
                                                    child: Image.asset(
                                                      ASSETS_ICONS_PATH +
                                                          'ic_back.png',
                                                      height: iconHeightWidth,
                                                      width: iconHeightWidth,
                                                      fit: BoxFit.fitWidth,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                      Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: margin16),
                            // color: Color(0xffF9F9FB),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: margin8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: _subjectController
                                                .arrOfChapter[_subjectController
                                                    .selectedChapterPosition]
                                                .topic[_subjectController
                                                    .selectedTopicPosition]
                                                .name,
                                            style: bodyMediumTestStyle.copyWith(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (_subjectController
                                                      .arrOfChapter[
                                                          _subjectController
                                                              .selectedChapterPosition]
                                                      .topic[_subjectController
                                                          .selectedTopicPosition]
                                                      .isFavorite ==
                                                  0) {
                                                _subjectController.setFavorite(
                                                    _subjectController
                                                        .arrOfChapter[
                                                            _subjectController
                                                                .selectedChapterPosition]
                                                        .topic[_subjectController
                                                            .selectedTopicPosition]
                                                        .id
                                                        .toString());

                                                _subjectController
                                                    .arrOfChapter[_subjectController
                                                        .selectedChapterPosition]
                                                    .topic[_subjectController
                                                        .selectedTopicPosition]
                                                    .isFavorite = 1;
                                              } else {
                                                _subjectController.removeFavorite(
                                                    _subjectController
                                                        .arrOfChapter[
                                                            _subjectController
                                                                .selectedChapterPosition]
                                                        .topic[_subjectController
                                                            .selectedTopicPosition]
                                                        .isFavorite
                                                        .toString());

                                                _subjectController
                                                    .arrOfChapter[_subjectController
                                                        .selectedChapterPosition]
                                                    .topic[_subjectController
                                                        .selectedTopicPosition]
                                                    .isFavorite = 0;
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              _subjectController
                                                          .arrOfChapter[
                                                              _subjectController
                                                                  .selectedChapterPosition]
                                                          .topic[_subjectController
                                                              .selectedTopicPosition]
                                                          .isFavorite ==
                                                      0
                                                  ? Icons.bookmark_border
                                                  : Icons.bookmark,
                                              color: Colors.green,
                                              size: iconHeightWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: Get.width,
                                    height: 2,
                                    margin: EdgeInsets.only(top: margin8),
                                    color: Color(0xffE9E9E9),
                                  ),
                                  SizedBox(
                                    height: margin8,
                                  ),
                                  _subjectController
                                          .arrOfNextFourVideo.isNotEmpty
                                      ? RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Next",
                                                style: textStyle10Bold.copyWith(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: " Topic",
                                                style: textStyle10Bold.copyWith(
                                                    color: Color(0xff7FCB4F))),
                                          ]),
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: margin8,
                                  ),
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
                                          .arrOfNextFourVideo.length,
                                      // itemCount: _subjectController.arrOfTopic.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      _subjectController
                                                          .arrOfNextFourVideo[
                                                              index]
                                                          .image),
                                                  fit: BoxFit.cover)),
                                          child: Material(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              splashColor: Colors.white,
                                              onTap: () {
                                                _subjectController
                                                        .selectedTopicPosition =
                                                    index;
                                                _subjectController
                                                    .getNextFourVideo();
                                                Get.off(CustomVideoPlayer(
                                                    _subjectController
                                                            .arrOfChapter[
                                                                _subjectController
                                                                    .selectedChapterPosition]
                                                            .topic[
                                                        _subjectController
                                                            .selectedTopicPosition]));
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: Get.width * 0.45,
                                                    height: Get.width * 0.30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: HexColor.fromHex(
                                                              _subjectController
                                                                  .arrOfNextFourVideo[
                                                                      index]
                                                                  .color)
                                                          .withOpacity(0.80),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: margin4,
                                                        bottom: margin24,
                                                        right: margin20,
                                                      ),
                                                      child: RichText(
                                                        maxLines: 3,
                                                        textAlign:
                                                            TextAlign.left,
                                                        text: TextSpan(
                                                            style: textStyle9
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                            text: _subjectController
                                                                .arrOfNextFourVideo[
                                                                    index]
                                                                .name),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: margin4,
                                                          right: margin4),
                                                      child: Material(
                                                        color: Colors.white
                                                            .withOpacity(0.90),
                                                        type:
                                                            MaterialType.circle,
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    margin2),
                                                            child: Icon(
                                                              Icons.play_arrow,
                                                              size:
                                                                  iconHeightWidth,
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
                                  Spacer(),
                                  _subjectController
                                          .arrOfChapter[_subjectController
                                              .selectedChapterPosition]
                                          .topic[_subjectController
                                              .selectedTopicPosition]
                                          .content
                                          .question
                                          .isNotEmpty
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              bottom: margin24 + margin24),
                                          child: Center(
                                            child: Material(
                                              color: Color(0xff7FCB4F),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              child: InkWell(
                                                splashColor: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                onTap: () {
                                                  _testController.isVideoPlaying
                                                      .value = true;
                                                  _controller.pause();
                                                  Get.to(TopicTest(_subjectController
                                                          .arrOfChapter[
                                                              _subjectController
                                                                  .selectedChapterPosition]
                                                          .topic[
                                                      _subjectController
                                                          .selectedTopicPosition]));
                                                },
                                                child: Container(
                                                  width: Get.width * 0.40,
                                                  height: Get.height * 0.06,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Start Quiz",
                                                        style: textStyle10Bold
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink()
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  quarterTurns: rotation,
                ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   const player = YoutubePlayerIFrame();
  //   return YoutubePlayerControllerProvider(
  //     // Passing controller to widgets below.
  //     controller: _controller,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Youtube Player IFrame'),
  //       ),
  //       body: LayoutBuilder(
  //         builder: (context, constraints) {
  //           if (kIsWeb && constraints.maxWidth > 800) {
  //             return Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Expanded(child: player),
  //                 const SizedBox(
  //                   width: 500,
  //                   child: SingleChildScrollView(),
  //                 ),
  //               ],
  //             );
  //           }
  //           return ListView(
  //             children: [
  //               player,
  //               // const Controls(),
  //             ],
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Scaffold(
  //   backgroundColor: rotation == 0 ? Color(0xffF9F9FB) : Colors.black,
  //   body: Obx(() => Stack(
  //         fit: StackFit.expand,
  //         children: [
  //           RotatedBox(
  //             child: Stack(children: [
  //               rotation == 0
  //                   ? Container(
  //                       child: Column(
  //                         children: [
  //                           AspectRatio(
  //                             aspectRatio: 16 / 9,
  //                             child: Stack(
  //                               fit: StackFit.expand,
  //                               children: <Widget>[
  //                                 // VideoPlayer(_controller),
  //                                 // YoutubePlayer(
  //                                 //   controller: _controller,
  //                                 //   showVideoProgressIndicator: false,
  //                                 //   progressIndicatorColor:
  //                                 //       Colors.blueAccent,
  //                                 //   topActions: <Widget>[
  //                                 //     const SizedBox(width: 8.0),
  //                                 //     Expanded(
  //                                 //       child: Text(
  //                                 //         _controller.metadata.title,
  //                                 //         style: const TextStyle(
  //                                 //           color: Colors.white,
  //                                 //           fontSize: 18.0,
  //                                 //         ),
  //                                 //         overflow: TextOverflow.ellipsis,
  //                                 //         maxLines: 1,
  //                                 //       ),
  //                                 //     ),
  //                                 //     IconButton(
  //                                 //       icon: const Icon(
  //                                 //         Icons.settings,
  //                                 //         color: Colors.white,
  //                                 //         size: 25.0,
  //                                 //       ),
  //                                 //       onPressed: () {},
  //                                 //     ),
  //                                 //   ],
  //                                 //   onReady: () {
  //                                 //     _isPlayerReady = true;
  //                                 //   },
  //                                 //   onEnded: (data) {},
  //                                 // ),
  //                                 GestureDetector(
  //                                   child: Container(
  //                                     color: controllerVisible
  //                                         ? Colors.black26
  //                                         : Colors.transparent,
  //                                   ),
  //                                   onTap: () {
  //                                     setState(() {
  //                                       controllerVisible =
  //                                           !controllerVisible;
  //                                       if (controllerVisible) {
  //                                         var _duration =
  //                                             new Duration(seconds: 4);
  //                                         Timer(_duration, hideController);
  //                                       }
  //                                     });
  //                                   },
  //                                 ),
  //                                 controllerVisible
  //                                     ? Stack(
  //                                         children: [
  //                                           Center(
  //                                             child: Row(
  //                                               children: [
  //                                                 Expanded(
  //                                                   child: Center(
  //                                                     child: Material(
  //                                                       type: MaterialType
  //                                                           .circle,
  //                                                       clipBehavior: Clip
  //                                                           .antiAliasWithSaveLayer,
  //                                                       color: Colors
  //                                                           .transparent,
  //                                                       child: InkWell(
  //                                                         onTap: () {
  //                                                           Duration
  //                                                               currentDuration =
  //                                                               _controller
  //                                                                   .value
  //                                                                   .position;
  //                                                           Duration
  //                                                               _nextDuration =
  //                                                               Duration(
  //                                                                   milliseconds:
  //                                                                       10000);
  //                                                           _controller.seekTo(
  //                                                               currentDuration -
  //                                                                   _nextDuration);
  //                                                         },
  //                                                         child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets
  //                                                                   .all(4),
  //                                                           child: Icon(
  //                                                             Icons
  //                                                                 .replay_10,
  //                                                             color: Colors
  //                                                                 .white,
  //                                                             size:
  //                                                                 Get.width *
  //                                                                     0.10,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                                 Expanded(
  //                                                   child: Center(
  //                                                     child: Material(
  //                                                       type: MaterialType
  //                                                           .circle,
  //                                                       clipBehavior: Clip
  //                                                           .antiAliasWithSaveLayer,
  //                                                       color: Colors
  //                                                           .transparent,
  //                                                       child: InkWell(
  //                                                         onTap: () {
  //                                                           // if (_controller
  //                                                           //     .value
  //                                                           //     .isPlaying) {
  //                                                           //   setState(() {
  //                                                           //     controllerVisible =
  //                                                           //         true;
  //                                                           //   });
  //                                                           //   _controller
  //                                                           //       .pause();
  //                                                           // } else {
  //                                                           //   _controller
  //                                                           //       .play();
  //                                                           //   setState(() {
  //                                                           //     controllerVisible =
  //                                                           //         false;
  //                                                           //   });
  //                                                           // }
  //                                                         },
  //                                                         child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets
  //                                                                   .all(4),
  //                                                           child: Icon(
  //                                                             /*
  //                                                             _controller
  //                                                                     .value
  //                                                                     .isPlaying
  //                                                                 ? Icons
  //                                                                     .pause
  //                                                                 : */
  //                                                             Icons
  //                                                                 .play_arrow,
  //                                                             color: Colors
  //                                                                 .white,
  //                                                             size:
  //                                                                 Get.width *
  //                                                                     0.10,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                                 Expanded(
  //                                                   child: Center(
  //                                                     child: Material(
  //                                                       type: MaterialType
  //                                                           .circle,
  //                                                       clipBehavior: Clip
  //                                                           .antiAliasWithSaveLayer,
  //                                                       color: Colors
  //                                                           .transparent,
  //                                                       child: InkWell(
  //                                                         onTap: () {
  //                                                           Duration
  //                                                               currentDuration =
  //                                                               _controller
  //                                                                   .value
  //                                                                   .position;
  //                                                           Duration
  //                                                               _nextDuration =
  //                                                               Duration(
  //                                                                   milliseconds:
  //                                                                       10000);
  //                                                           _controller.seekTo(
  //                                                               currentDuration +
  //                                                                   _nextDuration);
  //                                                         },
  //                                                         child: Padding(
  //                                                           padding:
  //                                                               EdgeInsets
  //                                                                   .all(4),
  //                                                           child: Icon(
  //                                                             Icons
  //                                                                 .forward_10,
  //                                                             color: Colors
  //                                                                 .white,
  //                                                             size:
  //                                                                 Get.width *
  //                                                                     0.10,
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                           Align(
  //                                             alignment:
  //                                                 Alignment.bottomCenter,
  //                                             child: Padding(
  //                                               padding:
  //                                                   EdgeInsets.symmetric(
  //                                                       horizontal: 16,
  //                                                       vertical: 4),
  //                                               child: Row(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment
  //                                                         .center,
  //                                                 children: [
  //                                                   Expanded(
  //                                                     child: Text("")
  //                                                     /*VideoProgressIndicator(
  //                                                       _controller,
  //                                                       allowScrubbing:
  //                                                           true,
  //                                                     )*/
  //                                                     ,
  //                                                   ),
  //                                                   SizedBox(
  //                                                     width: 16,
  //                                                   ),
  //                                                   Material(
  //                                                     color: Colors
  //                                                         .transparent,
  //                                                     type: MaterialType
  //                                                         .circle,
  //                                                     clipBehavior: Clip
  //                                                         .antiAliasWithSaveLayer,
  //                                                     child: InkWell(
  //                                                       onTap: () {},
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             EdgeInsets.all(
  //                                                                 margin8),
  //                                                         child: Text(
  //                                                           "1x",
  //                                                           style: textStyle10
  //                                                               .copyWith(
  //                                                                   color: Colors
  //                                                                       .white),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                   Material(
  //                                                     type: MaterialType
  //                                                         .circle,
  //                                                     clipBehavior: Clip
  //                                                         .antiAliasWithSaveLayer,
  //                                                     color: Colors
  //                                                         .transparent,
  //                                                     child: InkWell(
  //                                                       onTap: () {
  //                                                         setState(() {
  //                                                           // isMute =
  //                                                           //     !isMute;
  //                                                           // if (isMute) {
  //                                                           //   volume =
  //                                                           //       _controller
  //                                                           //           .value
  //                                                           //           .volume;
  //                                                           //   _controller
  //                                                           //       .setVolume(
  //                                                           //           0);
  //                                                           // } else {
  //                                                           //   _controller
  //                                                           //       .setVolume(
  //                                                           //           volume);
  //                                                           // }
  //                                                         });
  //                                                       },
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             EdgeInsets
  //                                                                 .all(4),
  //                                                         child: Icon(
  //                                                           isMute
  //                                                               ? Icons
  //                                                                   .volume_off_sharp
  //                                                               : Icons
  //                                                                   .volume_up,
  //                                                           color: Colors
  //                                                               .white,
  //                                                           size:
  //                                                               Get.width *
  //                                                                   0.06,
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                   SizedBox(
  //                                                     width: 4,
  //                                                   ),
  //                                                   Material(
  //                                                     type: MaterialType
  //                                                         .circle,
  //                                                     clipBehavior: Clip
  //                                                         .antiAliasWithSaveLayer,
  //                                                     color: Colors
  //                                                         .transparent,
  //                                                     child: InkWell(
  //                                                       onTap: () {
  //                                                         setState(() {
  //                                                           if (rotation ==
  //                                                               0) {
  //                                                             rotation = 45;
  //                                                           } else {
  //                                                             rotation = 0;
  //                                                           }
  //                                                         });
  //                                                       },
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             EdgeInsets
  //                                                                 .all(4),
  //                                                         child: Icon(
  //                                                           Icons
  //                                                               .fullscreen,
  //                                                           color: Colors
  //                                                               .white,
  //                                                           size:
  //                                                               Get.width *
  //                                                                   0.06,
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   )
  //                                                 ],
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       )
  //                                     : SizedBox.shrink(),
  //                                 Column(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.start,
  //                                   children: [
  //                                     Container(
  //                                       height: MediaQuery.of(context)
  //                                           .padding
  //                                           .top,
  //                                       color: Colors.black,
  //                                     ),
  //                                     Row(
  //                                       children: [
  //                                         SizedBox(
  //                                           width: margin4,
  //                                         ),
  //                                         controllerVisible
  //                                             ? Material(
  //                                                 color: Colors.transparent,
  //                                                 type: MaterialType.circle,
  //                                                 clipBehavior: Clip
  //                                                     .antiAliasWithSaveLayer,
  //                                                 child: InkWell(
  //                                                   onTap: () {
  //                                                     Get.back();
  //                                                   },
  //                                                   child: Padding(
  //                                                     padding:
  //                                                         EdgeInsets.all(
  //                                                             margin8),
  //                                                     child: Image.asset(
  //                                                       ASSETS_ICONS_PATH +
  //                                                           'ic_back.png',
  //                                                       height:
  //                                                           iconHeightWidth,
  //                                                       width:
  //                                                           iconHeightWidth,
  //                                                       fit:
  //                                                           BoxFit.fitWidth,
  //                                                       color: Colors.white,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               )
  //                                             : SizedBox.shrink(),
  //                                         Spacer(),
  //                                       ],
  //                                     )
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: Container(
  //                               margin: EdgeInsets.symmetric(
  //                                   horizontal: margin16),
  //                               color: Color(0xffF9F9FB),
  //                               child: MediaQuery.removePadding(
  //                                 context: context,
  //                                 removeTop: true,
  //                                 child: Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     SizedBox(
  //                                       height: margin8,
  //                                     ),
  //                                     Row(
  //                                       children: [
  //                                         Expanded(
  //                                           child: RichText(
  //                                             maxLines: 2,
  //                                             textAlign: TextAlign.start,
  //                                             overflow:
  //                                                 TextOverflow.ellipsis,
  //                                             text: TextSpan(
  //                                               text: _subjectController
  //                                                   .arrOfChapter[
  //                                                       _subjectController
  //                                                           .selectedChapterPosition]
  //                                                   .topic[_subjectController
  //                                                       .selectedTopicPosition]
  //                                                   .name,
  //                                               style: bodyMediumTestStyle
  //                                                   .copyWith(
  //                                                       color:
  //                                                           Colors.black),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         SizedBox(
  //                                           width: 8,
  //                                         ),
  //                                         Material(
  //                                           color: Colors.transparent,
  //                                           borderRadius:
  //                                               BorderRadius.circular(8),
  //                                           child: InkWell(
  //                                             onTap: () {
  //                                               setState(() {
  //                                                 if (_subjectController
  //                                                         .arrOfTopic[
  //                                                             _subjectController
  //                                                                 .activeTopicPosition
  //                                                                 .value]
  //                                                         .isFavorite ==
  //                                                     0) {
  //                                                   _subjectController.setFavorite(
  //                                                       _subjectController
  //                                                           .arrOfChapter[
  //                                                               _subjectController
  //                                                                   .selectedChapterPosition]
  //                                                           .topic[_subjectController
  //                                                               .selectedTopicPosition]
  //                                                           .id
  //                                                           .toString());
  //
  //                                                   _subjectController
  //                                                       .arrOfChapter[
  //                                                           _subjectController
  //                                                               .selectedChapterPosition]
  //                                                       .topic[_subjectController
  //                                                           .selectedTopicPosition]
  //                                                       .isFavorite = 1;
  //                                                 } else {
  //                                                   _subjectController.removeFavorite(
  //                                                       _subjectController
  //                                                           .arrOfChapter[
  //                                                               _subjectController
  //                                                                   .selectedChapterPosition]
  //                                                           .topic[_subjectController
  //                                                               .selectedTopicPosition]
  //                                                           .isFavorite
  //                                                           .toString());
  //
  //                                                   _subjectController
  //                                                       .arrOfChapter[
  //                                                           _subjectController
  //                                                               .selectedChapterPosition]
  //                                                       .topic[_subjectController
  //                                                           .selectedTopicPosition]
  //                                                       .isFavorite = 0;
  //                                                 }
  //                                               });
  //                                             },
  //                                             child: Container(
  //                                               padding: EdgeInsets.all(8),
  //                                               decoration: BoxDecoration(),
  //                                               child: Icon(
  //                                                 Icons.bookmark_border,
  //                                                 color: Colors.green,
  //                                                 size: iconHeightWidth,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     Container(
  //                                       width: Get.width,
  //                                       height: 2,
  //                                       margin:
  //                                           EdgeInsets.only(top: margin8),
  //                                       color: Color(0xffE9E9E9),
  //                                     ),
  //                                     SizedBox(
  //                                       height: margin8,
  //                                     ),
  //                                     _subjectController
  //                                             .arrOfNextFourVideo.isNotEmpty
  //                                         ? RichText(
  //                                             text: TextSpan(children: [
  //                                               TextSpan(
  //                                                   text: "Next",
  //                                                   style: textStyle10Bold
  //                                                       .copyWith(
  //                                                           color: Colors
  //                                                               .black)),
  //                                               TextSpan(
  //                                                   text: " Topic",
  //                                                   style: textStyle10Bold
  //                                                       .copyWith(
  //                                                           color: Color(
  //                                                               0xff7FCB4F))),
  //                                             ]),
  //                                           )
  //                                         : SizedBox.shrink(),
  //                                     SizedBox(
  //                                       height: margin8,
  //                                     ),
  //                                     MediaQuery.removePadding(
  //                                       context: context,
  //                                       removeTop: true,
  //                                       child: GridView.builder(
  //                                         gridDelegate:
  //                                             SliverGridDelegateWithFixedCrossAxisCount(
  //                                                 crossAxisCount: 2,
  //                                                 childAspectRatio: 3 / 2,
  //                                                 crossAxisSpacing: 16,
  //                                                 mainAxisSpacing: 16),
  //
  //                                         shrinkWrap: true,
  //                                         physics:
  //                                             NeverScrollableScrollPhysics(),
  //                                         itemCount: _subjectController
  //                                             .arrOfNextFourVideo.length,
  //                                         // itemCount: _subjectController.arrOfTopic.length,
  //                                         itemBuilder: (context, index) {
  //                                           return Container(
  //                                             decoration: BoxDecoration(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         8),
  //                                                 image: DecorationImage(
  //                                                     image: NetworkImage(
  //                                                         _subjectController
  //                                                             .arrOfNextFourVideo[
  //                                                                 index]
  //                                                             .image),
  //                                                     fit: BoxFit.cover)),
  //                                             child: Material(
  //                                               color: Colors.transparent,
  //                                               borderRadius:
  //                                                   BorderRadius.circular(
  //                                                       8),
  //                                               child: InkWell(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         8),
  //                                                 splashColor: Colors.white,
  //                                                 onTap: () {
  //                                                   _subjectController
  //                                                           .selectedTopicPosition =
  //                                                       index;
  //                                                   _subjectController
  //                                                       .getNextFourVideo();
  //                                                   Get.off(CustomVideoPlayer(
  //                                                       _subjectController
  //                                                               .arrOfChapter[
  //                                                                   _subjectController
  //                                                                       .selectedChapterPosition]
  //                                                               .topic[
  //                                                           _subjectController
  //                                                               .selectedTopicPosition]));
  //                                                 },
  //                                                 child: Stack(
  //                                                   children: [
  //                                                     Container(
  //                                                       width: Get.width *
  //                                                           0.45,
  //                                                       height: Get.width *
  //                                                           0.30,
  //                                                       decoration:
  //                                                           BoxDecoration(
  //                                                         borderRadius:
  //                                                             BorderRadius
  //                                                                 .circular(
  //                                                                     8),
  //                                                         color: HexColor.fromHex(
  //                                                                 _subjectController
  //                                                                     .arrOfNextFourVideo[
  //                                                                         index]
  //                                                                     .color)
  //                                                             .withOpacity(
  //                                                                 0.80),
  //                                                       ),
  //                                                     ),
  //                                                     Align(
  //                                                       alignment: Alignment
  //                                                           .centerLeft,
  //                                                       child: Padding(
  //                                                         padding:
  //                                                             EdgeInsets
  //                                                                 .only(
  //                                                           left: margin4,
  //                                                           bottom:
  //                                                               margin24,
  //                                                           right: margin20,
  //                                                         ),
  //                                                         child: RichText(
  //                                                           maxLines: 3,
  //                                                           textAlign:
  //                                                               TextAlign
  //                                                                   .left,
  //                                                           text: TextSpan(
  //                                                               style: textStyle9.copyWith(
  //                                                                   color: Colors
  //                                                                       .white),
  //                                                               text: _subjectController
  //                                                                   .arrOfNextFourVideo[
  //                                                                       index]
  //                                                                   .name),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                     Align(
  //                                                       alignment: Alignment
  //                                                           .bottomRight,
  //                                                       child: Container(
  //                                                         margin: EdgeInsets
  //                                                             .only(
  //                                                                 bottom:
  //                                                                     margin4,
  //                                                                 right:
  //                                                                     margin4),
  //                                                         child: Material(
  //                                                           color: Colors
  //                                                               .white
  //                                                               .withOpacity(
  //                                                                   0.90),
  //                                                           type:
  //                                                               MaterialType
  //                                                                   .circle,
  //                                                           clipBehavior: Clip
  //                                                               .antiAliasWithSaveLayer,
  //                                                           child: InkWell(
  //                                                             onTap: () {},
  //                                                             child:
  //                                                                 Padding(
  //                                                               padding:
  //                                                                   EdgeInsets.all(
  //                                                                       margin2),
  //                                                               child: Icon(
  //                                                                 Icons
  //                                                                     .play_arrow,
  //                                                                 size:
  //                                                                     iconHeightWidth,
  //                                                               ),
  //                                                               /*child: Image.asset(
  //                                                 ASSETS_ICONS_PATH +
  //                                                     'ic_play.png',
  //                                                 height:
  //                                                     iconHeightWidth - 8,
  //                                                 width:
  //                                                     iconHeightWidth - 8,
  //                                                 fit: BoxFit.fill,
  //                                               ),*/
  //                                                             ),
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                     )
  //                                                   ],
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           );
  //                                         },
  //                                       ),
  //                                     ),
  //                                     Spacer(),
  //                                     _subjectController
  //                                             .arrOfChapter[_subjectController
  //                                                 .selectedChapterPosition]
  //                                             .topic[_subjectController
  //                                                 .selectedTopicPosition]
  //                                             .content
  //                                             .question
  //                                             .isNotEmpty
  //                                         ? Center(
  //                                             child: Material(
  //                                               color: Color(0xff7FCB4F),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(
  //                                                       24),
  //                                               child: InkWell(
  //                                                 splashColor: Colors.white,
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         24),
  //                                                 onTap: () {
  //                                                   _testController
  //                                                       .isVideoPlaying
  //                                                       .value = true;
  //                                                   _controller.pause();
  //                                                   Get.to(TopicTest(_subjectController
  //                                                           .arrOfChapter[
  //                                                               _subjectController
  //                                                                   .selectedChapterPosition]
  //                                                           .topic[
  //                                                       _subjectController
  //                                                           .selectedTopicPosition]));
  //                                                 },
  //                                                 child: Container(
  //                                                   width: Get.width * 0.40,
  //                                                   height:
  //                                                       Get.height * 0.06,
  //                                                   decoration: BoxDecoration(
  //                                                       borderRadius:
  //                                                           BorderRadius
  //                                                               .circular(
  //                                                                   24)),
  //                                                   child: Row(
  //                                                     mainAxisAlignment:
  //                                                         MainAxisAlignment
  //                                                             .center,
  //                                                     children: [
  //                                                       Text(
  //                                                         "Start Quiz",
  //                                                         style: textStyle10Bold
  //                                                             .copyWith(
  //                                                                 color: Colors
  //                                                                     .white),
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           )
  //                                         : SizedBox.shrink()
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     )
  //                   : Center(
  //                       child: AspectRatio(
  //                         aspectRatio: 16 / 9,
  //                         child: Stack(
  //                           fit: StackFit.expand,
  //                           children: <Widget>[
  //                             // VideoPlayer(_controller),
  //                             // YoutubePlayer(
  //                             //   controller: _controller,
  //                             //   showVideoProgressIndicator: true,
  //                             //   progressIndicatorColor: Colors.blueAccent,
  //                             //   topActions: <Widget>[
  //                             //     const SizedBox(width: 8.0),
  //                             //     Expanded(
  //                             //       child: Text(
  //                             //         _controller.metadata.title,
  //                             //         style: const TextStyle(
  //                             //           color: Colors.white,
  //                             //           fontSize: 18.0,
  //                             //         ),
  //                             //         overflow: TextOverflow.ellipsis,
  //                             //         maxLines: 1,
  //                             //       ),
  //                             //     ),
  //                             //     IconButton(
  //                             //       icon: const Icon(
  //                             //         Icons.settings,
  //                             //         color: Colors.white,
  //                             //         size: 25.0,
  //                             //       ),
  //                             //       onPressed: () {},
  //                             //     ),
  //                             //   ],
  //                             //   onReady: () {
  //                             //     _isPlayerReady = true;
  //                             //   },
  //                             //   onEnded: (data) {},
  //                             // ),
  //                             GestureDetector(
  //                               child: Container(
  //                                 color: controllerVisible
  //                                     ? Colors.black26
  //                                     : Colors.transparent,
  //                               ),
  //                               onTap: () {
  //                                 setState(() {
  //                                   controllerVisible = !controllerVisible;
  //                                   if (controllerVisible) {
  //                                     var _duration =
  //                                         new Duration(seconds: 4);
  //                                     Timer(_duration, hideController);
  //                                   }
  //                                 });
  //                               },
  //                             ),
  //                             controllerVisible
  //                                 ? Stack(
  //                                     children: [
  //                                       Center(
  //                                         child: Row(
  //                                           children: [
  //                                             Expanded(
  //                                               child: Center(
  //                                                 child: Material(
  //                                                   type:
  //                                                       MaterialType.circle,
  //                                                   clipBehavior: Clip
  //                                                       .antiAliasWithSaveLayer,
  //                                                   color:
  //                                                       Colors.transparent,
  //                                                   child: InkWell(
  //                                                     onTap: () {
  //                                                       Duration
  //                                                           currentDuration =
  //                                                           _controller
  //                                                               .value
  //                                                               .position;
  //                                                       Duration
  //                                                           _nextDuration =
  //                                                           Duration(
  //                                                               milliseconds:
  //                                                                   10000);
  //                                                       _controller.seekTo(
  //                                                           currentDuration -
  //                                                               _nextDuration);
  //                                                     },
  //                                                     child: Padding(
  //                                                       padding:
  //                                                           EdgeInsets.all(
  //                                                               4),
  //                                                       child: Icon(
  //                                                         Icons.replay_10,
  //                                                         color:
  //                                                             Colors.white,
  //                                                         size: Get.width *
  //                                                             0.10,
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             Expanded(
  //                                               child: Center(
  //                                                 child: Material(
  //                                                   type:
  //                                                       MaterialType.circle,
  //                                                   clipBehavior: Clip
  //                                                       .antiAliasWithSaveLayer,
  //                                                   color:
  //                                                       Colors.transparent,
  //                                                   child: InkWell(
  //                                                     onTap: () {
  //                                                       // if (_controller
  //                                                       //     .value
  //                                                       //     .isPlaying) {
  //                                                       //   setState(() {
  //                                                       //     controllerVisible =
  //                                                       //         true;
  //                                                       //   });
  //                                                       //   _controller
  //                                                       //       .pause();
  //                                                       // } else {
  //                                                       //   _controller
  //                                                       //       .play();
  //                                                       //   setState(() {
  //                                                       //     controllerVisible =
  //                                                       //         false;
  //                                                       //   });
  //                                                       // }
  //                                                     },
  //                                                     child: Padding(
  //                                                       padding:
  //                                                           EdgeInsets.all(
  //                                                               4),
  //                                                       child: Icon(
  //                                                         /*
  //                                                         _controller.value
  //                                                                 .isPlaying
  //                                                             ? Icons.pause
  //                                                             : */
  //                                                         Icons.play_arrow,
  //                                                         color:
  //                                                             Colors.white,
  //                                                         size: Get.width *
  //                                                             0.10,
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             Expanded(
  //                                               child: Center(
  //                                                 child: Material(
  //                                                   type:
  //                                                       MaterialType.circle,
  //                                                   clipBehavior: Clip
  //                                                       .antiAliasWithSaveLayer,
  //                                                   color:
  //                                                       Colors.transparent,
  //                                                   child: InkWell(
  //                                                     onTap: () {
  //                                                       Duration
  //                                                           currentDuration =
  //                                                           _controller
  //                                                               .value
  //                                                               .position;
  //                                                       Duration
  //                                                           _nextDuration =
  //                                                           Duration(
  //                                                               milliseconds:
  //                                                                   10000);
  //                                                       _controller.seekTo(
  //                                                           currentDuration +
  //                                                               _nextDuration);
  //                                                     },
  //                                                     child: Padding(
  //                                                       padding:
  //                                                           EdgeInsets.all(
  //                                                               4),
  //                                                       child: Icon(
  //                                                         Icons.forward_10,
  //                                                         color:
  //                                                             Colors.white,
  //                                                         size: Get.width *
  //                                                             0.10,
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                       Align(
  //                                         alignment: Alignment.bottomCenter,
  //                                         child: Padding(
  //                                           padding: EdgeInsets.symmetric(
  //                                               horizontal: 16,
  //                                               vertical: 4),
  //                                           child: Row(
  //                                             crossAxisAlignment:
  //                                                 CrossAxisAlignment.center,
  //                                             children: [
  //                                               Expanded(
  //                                                 child: Text("")
  //                                                 /*VideoProgressIndicator(
  //                                                   _controller,
  //                                                   allowScrubbing: true,
  //                                                 )*/
  //                                                 ,
  //                                               ),
  //                                               SizedBox(
  //                                                 width: 16,
  //                                               ),
  //                                               Material(
  //                                                 color: Colors.transparent,
  //                                                 type: MaterialType.circle,
  //                                                 clipBehavior: Clip
  //                                                     .antiAliasWithSaveLayer,
  //                                                 child: InkWell(
  //                                                   onTap: () {},
  //                                                   child: Padding(
  //                                                     padding:
  //                                                         EdgeInsets.all(
  //                                                             margin8),
  //                                                     child: Text(
  //                                                       "1x",
  //                                                       style: textStyle10
  //                                                           .copyWith(
  //                                                               color: Colors
  //                                                                   .white),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               Material(
  //                                                 type: MaterialType.circle,
  //                                                 clipBehavior: Clip
  //                                                     .antiAliasWithSaveLayer,
  //                                                 color: Colors.transparent,
  //                                                 child: InkWell(
  //                                                   onTap: () {
  //                                                     setState(() {
  //                                                       // isMute = !isMute;
  //                                                       // if (isMute) {
  //                                                       //   volume =
  //                                                       //       _controller
  //                                                       //           .value
  //                                                       //           .volume;
  //                                                       //   _controller
  //                                                       //       .setVolume(0);
  //                                                       // } else {
  //                                                       //   _controller
  //                                                       //       .setVolume(
  //                                                       //           volume);
  //                                                       // }
  //                                                     });
  //                                                   },
  //                                                   child: Padding(
  //                                                     padding:
  //                                                         EdgeInsets.all(4),
  //                                                     child: Icon(
  //                                                       isMute
  //                                                           ? Icons
  //                                                               .volume_off_sharp
  //                                                           : Icons
  //                                                               .volume_up,
  //                                                       color: Colors.white,
  //                                                       size: Get.width *
  //                                                           0.06,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               SizedBox(
  //                                                 width: 4,
  //                                               ),
  //                                               Material(
  //                                                 type: MaterialType.circle,
  //                                                 clipBehavior: Clip
  //                                                     .antiAliasWithSaveLayer,
  //                                                 color: Colors.transparent,
  //                                                 child: InkWell(
  //                                                   onTap: () {
  //                                                     setState(() {
  //                                                       if (rotation == 0) {
  //                                                         rotation = 45;
  //                                                       } else {
  //                                                         rotation = 0;
  //                                                       }
  //                                                     });
  //                                                   },
  //                                                   child: Padding(
  //                                                     padding:
  //                                                         EdgeInsets.all(4),
  //                                                     child: Icon(
  //                                                       Icons.fullscreen,
  //                                                       color: Colors.white,
  //                                                       size: Get.width *
  //                                                           0.06,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               )
  //                                             ],
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   )
  //                                 : SizedBox.shrink(),
  //                             Column(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: MediaQuery.of(context)
  //                                               .padding
  //                                               .top -
  //                                           15),
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     SizedBox(
  //                                       width: margin4,
  //                                     ),
  //                                     Material(
  //                                       color: Colors.transparent,
  //                                       type: MaterialType.circle,
  //                                       clipBehavior:
  //                                           Clip.antiAliasWithSaveLayer,
  //                                       child: InkWell(
  //                                         onTap: () {
  //                                           Get.back();
  //                                         },
  //                                         child: Padding(
  //                                           padding:
  //                                               EdgeInsets.all(margin8),
  //                                           child: Image.asset(
  //                                             ASSETS_ICONS_PATH +
  //                                                 'ic_back.png',
  //                                             height: iconHeightWidth,
  //                                             width: iconHeightWidth,
  //                                             fit: BoxFit.fitWidth,
  //                                             color: Colors.white,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     Spacer(),
  //                                   ],
  //                                 )
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //             ]),
  //             quarterTurns: rotation,
  //           )
  //         ],
  //       )));
  // }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Playback Speed"),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: playbackSpeed.length,
                            itemBuilder: (_, index) {
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                    setState(() {
                                      _controller.setPlaybackSpeed(
                                          playbackSpeed[index].value);
                                    });
                                  },
                                  child: Container(
                                    child: RadioListTile(
                                      value: playbackSpeed[index].isSelected,
                                      groupValue: 1,
                                      selected: playbackSpeed[index].isSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          for (var i = 0;
                                              i < playbackSpeed.length;
                                              ++i) {
                                            playbackSpeed[i].isSelected = false;
                                          }
                                          playbackSpeed[index].isSelected =
                                              true;
                                        });
                                        Navigator.pop(context);
                                      },
                                      title: Text(playbackSpeed[index].name),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

var playbackSpeed = [
  ModelPlaybackSpeed("0.5x", false, 0.5),
  ModelPlaybackSpeed("0.75x", false, 0.75),
  ModelPlaybackSpeed("Normal", false, 1),
  ModelPlaybackSpeed("1.25x", false, 1.25),
  ModelPlaybackSpeed("1.5x", false, 1.5),
  ModelPlaybackSpeed("2x", false, 2)
];

class ModelPlaybackSpeed {
  String name;
  bool isSelected = false;
  double value;

  ModelPlaybackSpeed(this.name, this.isSelected, this.value);
}
