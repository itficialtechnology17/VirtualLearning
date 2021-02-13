import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_watch_history.dart';
import 'package:virtual_learning/modules/player/custom_youtube_player.dart';
import 'package:virtual_learning/modules/player/custom_youtube_player_builder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayRecentVideo extends StatefulWidget {
  final ModelWatchHistory modelWatchHistory;

  PlayRecentVideo(this.modelWatchHistory);

  @override
  State<StatefulWidget> createState() {
    return _StatePlayRecentVideo();
  }
}

class _StatePlayRecentVideo extends State<PlayRecentVideo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  SubjectController _subjectController = Get.find();

  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  TextEditingController _seekToController;

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.modelWatchHistory.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        hideControls: false,
        forceHD: true,
        enableCaption: true,
      ),
    )..addListener(listener);

    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  Widget build(BuildContext context) {
    return CustomYoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: CustomYoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.white,
          liveUIColor: Colors.transparent,
          aspectRatio: 16 / 9,
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {},
        ),
        builder: (context, player) => Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black,
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
                centerTitle: true,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  player,
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              text: widget.modelWatchHistory.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 14)),
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
                              if (widget.modelWatchHistory.isFavorite == 0) {
                                _subjectController.setFavorite(
                                    widget.modelWatchHistory.id.toString());

                                widget.modelWatchHistory.isFavorite = 1;
                              } else {
                                _subjectController.removeFavorite(widget
                                    .modelWatchHistory.isFavorite
                                    .toString());
                                widget.modelWatchHistory.isFavorite = 0;
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(),
                            child: Icon(
                              widget.modelWatchHistory.isFavorite == 0
                                  ? Icons.bookmark_border
                                  : Icons.bookmark_outlined,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  void dispose() {
    Duration lastPlayedSecond = _controller.value.position;
    _subjectController.setWatchHistory(
        lastPlayedSecond.inMinutes.toString(),
        _subjectController
            .arrOfTopic[_subjectController.activeTopicPosition.value].content.id
            .toString(),
        _subjectController
            .arrOfTopic[_subjectController.activeTopicPosition.value].id
            .toString());
    super.dispose();
  }
}
