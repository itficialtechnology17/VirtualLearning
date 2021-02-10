import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/modules/player/custom_youtube_player.dart';
import 'package:virtual_learning/modules/player/custom_youtube_player_builder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatePlayVideo();
  }
}

class _StatePlayVideo extends State<PlayVideo> {
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
      initialVideoId: _subjectController
          .arrOfTopic[_subjectController.activeTopicPosition.value]
          .content
          .videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        hideControls: false,
        forceHD: false,
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
        appBar: AppBar(
          leading: Container(
            child: Center(
              child: Material(
                color: Color(0xffD0E6EE),
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
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            _subjectController
                .arrOfTopic[_subjectController.activeTopicPosition.value].name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            player,
          ],
        ),
      ),
    );
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
