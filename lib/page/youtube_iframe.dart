import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/iframe/custom_youtube_player_iframe.dart';
import 'package:virtual_learning/model/model_watch_history.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeIframe extends StatefulWidget {
  final ModelWatchHistory modelWatchHistory;
  YoutubeIframe(this.modelWatchHistory);

  @override
  State<StatefulWidget> createState() {
    return _StateYoutubeIframe();
  }
}

class _StateYoutubeIframe extends State<YoutubeIframe> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.modelWatchHistory.videoId,
      params: YoutubePlayerParams(
        showControls: true,
        autoPlay: true,
        showFullscreenButton: true,
        desktopMode: false,
        showVideoAnnotations: false,
        origin: "",
        privacyEnhanced: true,
        enableCaption: false,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 3), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = CustomYoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (kIsWeb && constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: player),
                  const SizedBox(
                    width: 500,
                    child: SingleChildScrollView(
                      child: Controls(),
                    ),
                  ),
                ],
              );
            }
            return ListView(
              children: [
                player,
                const Controls(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _space,
          // MetaDataSection(),
          // _space,
          // SourceInputSection(),
          // _space,
          // PlayPauseButtonBar(),
          // _space,
          // VolumeSlider(),
          // _space,
          // PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
