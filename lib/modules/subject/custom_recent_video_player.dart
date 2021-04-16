import 'dart:async';

import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_watch_history.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CustomRecentVideoPlayer extends StatefulWidget {
  final ModelWatchHistory modelWatchHistory;

  CustomRecentVideoPlayer(this.modelWatchHistory);

  @override
  State<StatefulWidget> createState() {
    return _YoutubeVideoState();
  }
}

class _YoutubeVideoState extends State<CustomRecentVideoPlayer> {
  bool controllerVisible = true;
  bool isMute = false;
  double volume = 0;
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=' +
          widget.modelWatchHistory.videoId +
          '',
      youtubeVideoQuality: VideoQuality.low144,
    );
    _controller.addListener(() {
      setState(() {
        print("Okay Test");
      });
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                                            text: widget.modelWatchHistory.name,
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
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (widget.modelWatchHistory
                                                      .isFavorite ==
                                                  0) {
                                                _subjectController.setFavorite(
                                                    widget.modelWatchHistory
                                                        .topicId
                                                        .toString());

                                                widget.modelWatchHistory
                                                    .isFavorite = 1;
                                              } else {
                                                _subjectController
                                                    .removeFavorite(widget
                                                        .modelWatchHistory
                                                        .isFavorite
                                                        .toString());

                                                widget.modelWatchHistory
                                                    .isFavorite = 0;
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              widget.modelWatchHistory
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
