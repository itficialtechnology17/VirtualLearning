import 'dart:async';

import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/test_controller.dart';
import 'package:virtual_learning/model/model_topic.dart';
import 'package:virtual_learning/modules/lesson/topic_test.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CustomNextVideoPlayer extends StatefulWidget {
  final ModelTopic modelTopic;

  CustomNextVideoPlayer(this.modelTopic);

  @override
  State<StatefulWidget> createState() {
    return _YoutubeVideoState();
  }
}

class _YoutubeVideoState extends State<CustomNextVideoPlayer> {
  bool controllerVisible = true;
  bool isMute = false;
  double volume = 0;
  VideoPlayerController _controller;

  SubjectController _subjectController = Get.find();
  VideoQuality videoQuality = VideoQuality.medium480;
  TestController _testController = Get.find();
  ThemeController _themeController = Get.find();

  int rotation = 0;
  String playbackSpeedValue = "1x";

  bool isSkipVisible = false;
  bool isVideoLoaded = false;
  bool isVideoEnded = false;
  bool isTotalDurationVisible = false;

  @override
  void initState() {
    super.initState();
    _enableRotation();

    print("Current Playing Video Url : " + widget.modelTopic.content.video);
    // _controller = VideoPlayerController.network(
    //     videoUrl + widget.modelTopic.content.video)
    _controller = VideoPlayerController.network(
        "https://vod-progressive.akamaized.net/exp=1625570660~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4311%2F22%2F571557324%2F2701107352.mp4~hmac=629cecebd74bfdb40056bfd495f8b4a6abcd876cb8bef91bc397dc83512e06de/vimeo-prod-skyfire-std-us/01/4311/22/571557324/2701107352.mp4")
      ..initialize().then((_) {
        startTimer();
        setState(() {
          isVideoLoaded = true;
          isTotalDurationVisible = true;
          isSkipVisible = true;
          isVideoEnded = false;
        });
        hideController();
        setState(() {});
      })
      ..play()
      ..addListener(() {
        if (_controller.value.position == _controller.value.duration) {
          setState(() {
            isVideoEnded = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  hideController() {
    setState(() {
      if (_controller.value.isPlaying) controllerVisible = false;
    });
  }

  Timer _timer;
  int _start = 9;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            isSkipVisible = false;
            timer.cancel();
          });
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  format(Duration d) {
    if (d
        .toString()
        .split('.')
        .first
        .padLeft(8, "0")
        .substring(3)
        .contains("null")) {
      return "";
    } else {
      return d.toString().split('.').first.padLeft(8, "0").substring(3);
    }
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
          body: OrientationBuilder(builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? getPortraitView()
                : Center(
                    child: getLandscapeView(),
                  );
          }),
        ));
  }

  Widget getLandscapeView() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      // status bar color
    ));

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          // color: _themeController.background.value,
          color: _themeController.background.value,
          child: AspectRatio(
            // aspectRatio: _controller.value.aspectRatio,
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                VideoPlayer(_controller),
                GestureDetector(
                  child: Container(
                    color:
                        controllerVisible ? Colors.black26 : Colors.transparent,
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Duration currentDuration =
                                              _controller.value.position;
                                          Duration _nextDuration =
                                              Duration(milliseconds: 10000);
                                          _controller.seekTo(
                                              currentDuration - _nextDuration);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.replay_10,
                                            color: Colors.white,
                                            size: Get.height * 0.10,
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (_controller.value.isPlaying) {
                                            setState(() {
                                              controllerVisible = true;
                                            });
                                            _controller.pause();
                                          } else {
                                            _controller.play();
                                            setState(() {
                                              controllerVisible = false;
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            _controller.value.isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.white,
                                            size: Get.height * 0.10,
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Duration currentDuration =
                                              _controller.value.position;
                                          Duration _nextDuration =
                                              Duration(milliseconds: 10000);
                                          _controller.seekTo(
                                              currentDuration + _nextDuration);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.forward_10,
                                            color: Colors.white,
                                            size: Get.height * 0.10,
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
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: Get.width * 0.07,
                                maxHeight: Get.width * 0.07,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              margin: EdgeInsets.symmetric(
                                  horizontal: margin8, vertical: margin24),
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                      BorderRadius.circular(margin24)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(bottom: margin2),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  ValueListenableBuilder(
                                                    valueListenable:
                                                        _controller,
                                                    builder: (context,
                                                        VideoPlayerValue value,
                                                        child) {
                                                      Duration currentDuration =
                                                          _controller
                                                              .value.position;

                                                      return Row(
                                                        children: [
                                                          Text(
                                                            format(
                                                                currentDuration),
                                                            style: textStyle9
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  Spacer(),
                                                  ValueListenableBuilder(
                                                    valueListenable:
                                                        _controller,
                                                    builder: (context,
                                                        VideoPlayerValue value,
                                                        child) {
                                                      return Row(
                                                        children: [
                                                          Text(
                                                            format(_controller
                                                                .value
                                                                .duration),
                                                            style: textStyle9
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                              VideoProgressIndicator(
                                                _controller,
                                                allowScrubbing: true,
                                              )
                                            ],
                                          ),
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
                                            if (isVideoLoaded) {
                                              _showBottomSheet(context);
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              playbackSpeedValue,
                                              style: textStyle9.copyWith(
                                                  color: Colors.white),
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
                                                volume =
                                                    _controller.value.volume;
                                                _controller.setVolume(0);
                                              } else {
                                                _controller.setVolume(volume);
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              isMute
                                                  ? Icons.volume_off_sharp
                                                  : Icons.volume_up,
                                              color: Colors.white,
                                              size: Get.height * 0.06,
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
                                            if (isVideoLoaded) {
                                              setState(() {
                                                SystemChrome
                                                    .setPreferredOrientations([
                                                  DeviceOrientation.portraitUp
                                                ]);
                                              });

                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000), () {
                                                _enableRotation();
                                              });
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.fullscreen,
                                              color: Colors.white,
                                              size: Get.height * 0.06,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: margin8),
                              child: Material(
                                color: Colors.transparent,
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.portraitUp]);
                                    });
                                    Future.delayed(
                                        const Duration(milliseconds: 2000), () {
                                      _enableRotation();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Image.asset(
                                      ASSETS_ICONS_PATH + 'ic_back.png',
                                      height: iconHeightWidth,
                                      width: iconHeightWidth,
                                      fit: BoxFit.fitWidth,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: Padding(
                          //     padding:
                          //         EdgeInsets.only(top: margin8),
                          //     child: Material(
                          //       color: Colors.transparent,
                          //       type: MaterialType.circle,
                          //       clipBehavior:
                          //           Clip.antiAliasWithSaveLayer,
                          //       child: InkWell(
                          //         onTap: () {
                          //           _showQualityBottomSheet(
                          //               context);
                          //         },
                          //         child: Padding(
                          //           padding:
                          //               EdgeInsets.all(margin8),
                          //           child: Icon(
                          //             Icons
                          //                 .video_settings_outlined,
                          //             color: Colors.white,
                          //             size: Get.width * 0.06,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      )
                    : SizedBox.shrink(),
                isVideoEnded
                    ? Stack(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Center(
                              child: Material(
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVideoEnded = false;
                                    });
                                    _controller.seekTo(Duration(seconds: 9));
                                    _controller.play();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                      size: Get.height * 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: margin8),
                              child: Material(
                                color: Colors.transparent,
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      rotation = 0;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Image.asset(
                                      ASSETS_ICONS_PATH + 'ic_back.png',
                                      height: iconHeightWidth,
                                      width: iconHeightWidth,
                                      fit: BoxFit.fitWidth,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox.shrink(),
                Visibility(
                  visible: isSkipVisible,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(margin8),
                      child: Material(
                        color: Colors.black,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSkipVisible = false;
                            });
                            _controller.seekTo(Duration(seconds: 10));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: margin10, vertical: margin4),
                            child: Text(
                              "SKIP INTRO " + _start.toString(),
                              style: textStyle10.copyWith(color: Colors.white),
                            ),
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
      ),
    );
  }

  Widget getPortraitView() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.black, // status bar color
    ));
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Container(
      color: _themeController.background.value,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                VideoPlayer(_controller),
                GestureDetector(
                  child: Container(
                    color:
                        controllerVisible ? Colors.black26 : Colors.transparent,
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (isVideoLoaded) {
                                            Duration currentDuration =
                                                _controller.value.position;
                                            Duration _nextDuration =
                                                Duration(milliseconds: 10000);
                                            _controller.seekTo(currentDuration -
                                                _nextDuration);
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (isVideoEnded) {
                                            _controller.initialize();
                                          } else if (isVideoLoaded) {
                                            if (_controller.value.isPlaying) {
                                              setState(() {
                                                controllerVisible = true;
                                              });
                                              _controller.pause();
                                            } else {
                                              _controller.play();
                                              setState(() {
                                                controllerVisible = false;
                                              });
                                            }
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            _controller.value.isPlaying
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
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          if (isVideoLoaded) {
                                            Duration currentDuration =
                                                _controller.value.position;
                                            Duration _nextDuration =
                                                Duration(milliseconds: 10000);
                                            _controller.seekTo(currentDuration +
                                                _nextDuration);
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
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
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: Get.height * 0.07,
                                maxHeight: Get.height * 0.07,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              margin: EdgeInsets.symmetric(
                                  horizontal: margin8, vertical: margin8),
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                      BorderRadius.circular(margin24)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              EdgeInsets.only(bottom: margin2),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  ValueListenableBuilder(
                                                    valueListenable:
                                                        _controller,
                                                    builder: (context,
                                                        VideoPlayerValue value,
                                                        child) {
                                                      Duration currentDuration =
                                                          _controller
                                                              .value.position;

                                                      return Row(
                                                        children: [
                                                          Text(
                                                            format(
                                                                currentDuration),
                                                            style: textStyle9
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  Spacer(),
                                                  ValueListenableBuilder(
                                                    valueListenable:
                                                        _controller,
                                                    builder: (context,
                                                        VideoPlayerValue value,
                                                        child) {
                                                      return Row(
                                                        children: [
                                                          Text(
                                                            format(_controller
                                                                .value
                                                                .duration),
                                                            style: textStyle9
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                              VideoProgressIndicator(
                                                _controller,
                                                padding:
                                                    EdgeInsets.all(margin4),
                                                allowScrubbing: true,
                                              )
                                            ],
                                          ),
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
                                            if (isVideoLoaded) {
                                              _showBottomSheet(context);
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              playbackSpeedValue,
                                              style: textStyle9.copyWith(
                                                  color: Colors.white),
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
                                                volume =
                                                    _controller.value.volume;
                                                _controller.setVolume(0);
                                              } else {
                                                _controller.setVolume(volume);
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              isMute
                                                  ? Icons.volume_off_sharp
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
                                            if (isVideoLoaded) {
                                              setState(() {
                                                SystemChrome
                                                    .setPreferredOrientations([
                                                  DeviceOrientation
                                                      .landscapeLeft
                                                ]);
                                              });

                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000), () {
                                                _enableRotation();
                                              });
                                            }
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
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: Row(
                          //     mainAxisAlignment:
                          //         MainAxisAlignment.end,
                          //     children: [
                          //
                          //       Padding(
                          //         padding: EdgeInsets.only(
                          //             right: margin8),
                          //         child: Material(
                          //           type: MaterialType.circle,
                          //           clipBehavior: Clip
                          //               .antiAliasWithSaveLayer,
                          //           color: Colors.transparent,
                          //           child: InkWell(
                          //             onTap: () {
                          //               if (isVideoLoaded) {
                          //                 _showQualityBottomSheet(
                          //                     context);
                          //               }
                          //             },
                          //             child: Padding(
                          //               padding: EdgeInsets
                          //                   .symmetric(
                          //                       horizontal:
                          //                           16,
                          //                       vertical: 8),
                          //               child: Icon(
                          //                 Icons
                          //                     .video_settings_outlined,
                          //                 color: Colors.white,
                          //                 size: Get.width *
                          //                     0.06,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     ],
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
                                padding: EdgeInsets.only(left: margin4),
                                child: Material(
                                  color: Colors.transparent,
                                  type: MaterialType.circle,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(margin8),
                                      child: Image.asset(
                                        ASSETS_ICONS_PATH + 'ic_back.png',
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
                isVideoEnded
                    ? Stack(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Center(
                              child: Material(
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVideoEnded = false;
                                    });
                                    _controller.seekTo(Duration(seconds: 9));
                                    _controller.play();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                      size: Get.width * 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: margin8),
                              child: Material(
                                color: Colors.transparent,
                                type: MaterialType.circle,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(margin8),
                                    child: Image.asset(
                                      ASSETS_ICONS_PATH + 'ic_back.png',
                                      height: iconHeightWidth,
                                      width: iconHeightWidth,
                                      fit: BoxFit.fitWidth,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox.shrink(),
                Visibility(
                  visible: isSkipVisible,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(margin8),
                      child: Material(
                        color: Colors.black,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isSkipVisible = false;
                            });
                            _controller.seekTo(Duration(seconds: 10));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: margin10, vertical: margin4),
                            child: Text(
                              "SKIP INTRO " + _start.toString(),
                              style: textStyle10.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: background,
              color: _themeController.background.value,
              padding: EdgeInsets.symmetric(horizontal: margin16),
              // color: Color(0xffF9F9FB),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Container(
                  color: _themeController.background.value,
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
                                    .arrOfNextFourVideo[0].name,
                                style: bodyMediumTestStyle.copyWith(
                                    color: _themeController.textColor.value),
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
                                          .arrOfNextFourVideo[0].isFavorite ==
                                      0) {
                                    _subjectController.setFavorite(
                                        _subjectController
                                            .arrOfNextFourVideo[0].id
                                            .toString());

                                    _subjectController
                                        .arrOfNextFourVideo[0].isFavorite = 1;
                                  } else {
                                    _subjectController.removeFavorite(
                                        _subjectController
                                            .arrOfNextFourVideo[0].isFavorite
                                            .toString(),
                                        false);

                                    _subjectController
                                        .arrOfNextFourVideo[0].isFavorite = 0;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(),
                                child: Icon(
                                  _subjectController.arrOfNextFourVideo[0]
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
                      _subjectController.arrOfNextFourVideo.isNotEmpty
                          ? RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Next",
                                    style: textStyle10Bold.copyWith(
                                        color:
                                            _themeController.textColor.value)),
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
                          itemCount:
                              _subjectController.arrOfNextFourVideo.length,
                          // itemCount: _subjectController.arrOfTopic.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(_subjectController
                                          .arrOfNextFourVideo[index].image),
                                      fit: BoxFit.cover)),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  splashColor: Colors.white,
                                  onTap: () {
                                    _subjectController.getUpNextFourVideo(
                                        context,
                                        _subjectController
                                            .arrOfNextFourVideo[index].id
                                            .toString());
                                    // Navigator.pop(context);
                                    // Get.to(CustomNextVideoPlayer(
                                    //     _subjectController
                                    //         .arrOfNextFourVideo[index]));
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
                                                      .arrOfNextFourVideo[index]
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
                                                    .arrOfNextFourVideo[index]
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
                                            color: _themeController
                                                .playIconBGColor.value,
                                            type: MaterialType.circle,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.pop(context);
                                                // Get.to(CustomNextVideoPlayer(
                                                //     _subjectController
                                                //             .arrOfNextFourVideo[
                                                //         index]));

                                                _subjectController
                                                    .getUpNextFourVideo(
                                                        context,
                                                        _subjectController
                                                            .arrOfNextFourVideo[
                                                                index]
                                                            .id
                                                            .toString());
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
                      Spacer(),
                      _subjectController
                              .arrOfNextFourVideo[0].content.question.isNotEmpty
                          ? Container(
                              margin: EdgeInsets.only(bottom: margin8),
                              child: Center(
                                child: Material(
                                  color: Color(0xff7FCB4F),
                                  borderRadius: BorderRadius.circular(24),
                                  child: InkWell(
                                    splashColor: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    onTap: () {
                                      _testController.isVideoPlaying.value =
                                          true;
                                      _controller.pause();
                                      Get.to(TopicTest(_subjectController
                                          .arrOfNextFourVideo[0]));
                                    },
                                    child: Container(
                                      width: Get.width * 0.40,
                                      height: Get.height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Start Quiz",
                                            style: textStyle10Bold.copyWith(
                                                color: Colors.white),
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
            ),
          )
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
                      color: _themeController.background.value,
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
                        Text(
                          "Playback Speed",
                          style: textStyle10Bold.copyWith(
                              color: _themeController.textColor.value),
                        ),
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
                                      onChanged: (value) async {
                                        setState(() {
                                          for (var i = 0;
                                              i < playbackSpeed.length;
                                              ++i) {
                                            playbackSpeed[i].isSelected = false;
                                          }
                                          playbackSpeed[index].isSelected =
                                              true;
                                          if (playbackSpeed[index].value == 1) {
                                            playbackSpeedValue = "1x";
                                          } else {
                                            playbackSpeedValue =
                                                playbackSpeed[index].name;
                                          }
                                          _controller.setPlaybackSpeed(
                                              playbackSpeed[index].value);
                                          _controller.play();
                                        });
                                        Navigator.pop(context);
                                      },
                                      title: Text(playbackSpeed[index].name,
                                          style: textStyle10.copyWith(
                                              color: _themeController
                                                  .textColor.value)),
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

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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
