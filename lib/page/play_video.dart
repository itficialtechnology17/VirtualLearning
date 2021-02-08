import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seekbar/seekbar.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
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
/*
    setVideo(_subjectController
        .arrOfTopic[_subjectController.activeTopicPosition.value]
        .content
        .videoId);

    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;*/

    // _resumeProgressTimer();
    _secondProgressTimer = Timer.periodic(const Duration(milliseconds: 5), (_) {
      setState(() {
        _secondValue += 0.001;
        if (_secondValue >= 1) {
          _secondProgressTimer.cancel();
        }
      });
    });

    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        hideControls: true,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  _resumeProgressTimer() {
    _progressTimer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _value += 0.0005;
        if (_value >= 1) {
          _progressTimer.cancel();
          _done = true;
        }
      });
    });
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

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  double _value = 0.0;
  double _secondValue = 0.0;

  Timer _progressTimer;
  Timer _secondProgressTimer;

  bool _done = false;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.white,
        liveUIColor: Colors.transparent,
        topActions: <Widget>[
          // const SizedBox(width: 8.0),
          /*Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),*/
          /* IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),*/
        ],
        aspectRatio: 16 / 9,
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          // _showSnackBar('Next Video Started!');
        },
        actionsPadding: EdgeInsets.all(0),
      ),
      builder: (context, player) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              'assets/ypf.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Video',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            player,
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: SeekBar(
                            value: _value,
                            secondValue: _secondValue,
                            progressColor: Colors.green,
                            progressWidth: 5,
                            secondProgressColor: Colors.white.withOpacity(0.5),
                            onStartTrackingTouch: () {
                              print('onStartTrackingTouch');
                              if (!_done) {
                                _progressTimer?.cancel();
                              }
                            },
                            onProgressChanged: (value) {
                              if (_controller.value.isPlaying) {
                                _value = value;
                              }
                              print('onProgressChanged:$value');
                            },
                            onStopTrackingTouch: () {
                              print('onStopTrackingTouch');
                              if (!_done) {
                                _resumeProgressTimer();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          icon: Icon(
                            _muted ? Icons.volume_off : Icons.volume_up,
                            color: Colors.white,
                          ),
                          onPressed: _isPlayerReady
                              ? () {
                                  _muted
                                      ? _controller.unMute()
                                      : _controller.mute();
                                  setState(() {
                                    _muted = !_muted;
                                  });
                                }
                              : null,
                        ),
                        FullScreenButton(
                          controller: _controller,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                              setState(() {});
                            }
                          : null,
                    ),
                  ),
                  /*Align(
                    child: SeekBar(
                      value: _value,
                      secondValue: _secondValue,
                      progressColor: Colors.blue,
                      secondProgressColor: Colors.blue.withOpacity(0.5),
                      onStartTrackingTouch: () {
                        print('onStartTrackingTouch');
                        if (!_done) {
                          _progressTimer?.cancel();
                        }
                      },
                      onProgressChanged: (value) {
                        print('onProgressChanged:$value');
                        _value = value;
                      },
                      onStopTrackingTouch: () {
                        print('onStopTrackingTouch');
                        if (!_done) {
                          _resumeProgressTimer();
                        }
                      },
                    ),
                  )*/
                ],
              ),
            ),

            /*Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  */ /*IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) -
                                        1) %
                                    _ids.length])
                            : null,
                      ),*/ /*
                  */ /*IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: _isPlayerReady
                            ? () {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                                setState(() {});
                              }
                            : null,
                      ),*/ /*
                  Spacer(),
                  IconButton(
                    icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                    onPressed: _isPlayerReady
                        ? () {
                            _muted ? _controller.unMute() : _controller.mute();
                            setState(() {
                              _muted = !_muted;
                            });
                          }
                        : null,
                  ),
                  FullScreenButton(
                    controller: _controller,
                    color: Colors.blueAccent,
                  ),
                  */ /*IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) +
                                        1) %
                                    _ids.length])
                            : null,
                      ),*/ /*
                ],
              ),
            ),*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  */ /*_space,
                  _text('Title', _videoMetaData.title),
                  _space,
                  _text('Channel', _videoMetaData.author),
                  _space,
                  _text('Video Id', _videoMetaData.videoId),
                  _space,
                  Row(
                    children: [
                      _text(
                        'Playback Quality',
                        _controller.value.playbackQuality,
                      ),
                      const Spacer(),
                      _text(
                        'Playback Rate',
                        '${_controller.value.playbackRate}x  ',
                      ),
                    ],
                  ),
                  _space,
                  TextField(
                    enabled: _isPlayerReady,
                    controller: _idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueAccent.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _idController.clear(),
                      ),
                    ),
                  ),
                  _space,
                  Row(
                    children: [
                      _loadCueButton('LOAD'),
                      const SizedBox(width: 10.0),
                      _loadCueButton('CUE'),
                    ],
                  ),
                  _space,*/ /*

                  _space,
                  Row(
                    children: <Widget>[
                      const Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: _isPlayerReady
                              ? (value) {
                                  setState(() {
                                    _volume = value;
                                  });
                                  _controller.setVolume(_volume.round());
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  _space,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }

/*
  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                    _idController.text,
                  );
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  // _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
*/

  // Widget get _space => const SizedBox(height: 10);

  /*Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }*/
}
