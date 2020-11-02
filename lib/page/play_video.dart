import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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

  @override
  void initState() {
    super.initState();
    setVideo("VzgNRdco5Eo");
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
          progressIndicatorColor: Colors.blueAccent,
          onReady: () {},
          onEnded: (data) {},
        ),
        builder: (context, player) => Scaffold(
          key: _scaffoldKey,
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
                          padding: EdgeInsets.all(8),
                          child: Icon(
                              Platform.isAndroid
                                  ? Icons.keyboard_backspace
                                  : Icons.arrow_back_ios,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                      "What is Periodising? | Class 8 | Learn With VirtualE",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text("More videos of this chapter",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Material(
                        color: index % 2 == 0
                            ? Color(0xffFEF6F4)
                            : Color(0xffF5FAF5),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          splashColor: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            setVideo("L5MJCll5cnk");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    index % 2 == 0
                                        ? "https://image.freepik.com/free-vector/geography-tool-diploma_24911-9910.jpg"
                                        : "https://image.freepik.com/free-vector/colorful-illustration-about-geography-modern-flat-style_1040-3200.jpg",
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: "Basic What is Virtual E ?",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Poppins",
                                                fontSize: 14)),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "2 hours, 40 Min",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 3.0,
                                  percent: 0.7,
                                  backgroundColor: Colors.white,
                                  center: Icon(
                                    Icons.play_arrow,
                                    color: Colors.green[300],
                                  ),
                                  progressColor: Colors.green[300],
                                ),
                                SizedBox(
                                  width: 8,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setVideo(String videoId) {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          mute: true,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          startAt: 25,
          forceHD: false,
          hideControls: false,
          enableCaption: false,
        ),
      );
    });
  }
}
