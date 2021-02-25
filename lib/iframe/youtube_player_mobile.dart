// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:youtube_player_iframe/src/enums/youtube_error.dart';
import 'package:youtube_player_iframe/src/helpers/player_fragments.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// A youtube player widget which interacts with the underlying webview inorder to play YouTube videos.
///
/// Use [YoutubePlayerIFrame] instead.
class CustomRawYoutubePlayer extends StatefulWidget {
  /// The [YoutubePlayerController].
  final YoutubePlayerController controller;

  /// Which gestures should be consumed by the youtube player.
  ///
  /// It is possible for other gesture recognizers to be competing with the player on pointer
  /// events, e.g if the player is inside a [ListView] the [ListView] will want to handle
  /// vertical drags. The player will claim gestures that are recognized by any of the
  /// recognizers on this list.
  ///
  /// By default vertical and horizontal gestures are absorbed by the player.
  /// Passing an empty set will ignore the defaults.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  /// Creates a [CustomRawYoutubePlayer] widget.
  const CustomRawYoutubePlayer({
    Key key,
    this.controller,
    this.gestureRecognizers,
  }) : super(key: key);

  @override
  _MobileYoutubePlayerState createState() => _MobileYoutubePlayerState();
}

class _MobileYoutubePlayerState extends State<CustomRawYoutubePlayer>
    with WidgetsBindingObserver {
  YoutubePlayerController controller;
  Completer<InAppWebViewController> _webController;
  PlayerState _cachedPlayerState;
  bool _isPlayerReady = false;
  bool _onLoadStopCalled = false;

  @override
  void initState() {
    super.initState();
    _webController = Completer();
    controller = widget.controller;

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_cachedPlayerState != null &&
            _cachedPlayerState == PlayerState.playing) {
          controller?.play();
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _cachedPlayerState = controller.value.playerState;
        controller?.pause();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: ValueKey(controller.hashCode),
      initialData: InAppWebViewInitialData(
        data: player,
        baseUrl: controller.params.privacyEnhanced
            ? 'https://www.youtube.com'
            : 'https://www.youtube.com',
        encoding: 'utf-8',
        mimeType: 'text/html',
      ),
      gestureRecognizers: widget.gestureRecognizers ??
          {
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
            Factory<HorizontalDragGestureRecognizer>(
              () => HorizontalDragGestureRecognizer(),
            ),
          },
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          userAgent: userAgent,
          mediaPlaybackRequiresUserGesture: false,
          transparentBackground: true,
          disableContextMenu: true,
          supportZoom: false,
          disableHorizontalScroll: false,
          disableVerticalScroll: false,
          useShouldOverrideUrlLoading: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true,
          allowsPictureInPictureMediaPlayback: true,
        ),
        android: AndroidInAppWebViewOptions(useWideViewPort: false),
      ),
      shouldOverrideUrlLoading: (_, detail) async {
        final uri = Uri.parse(detail.url);
        final feature = uri.queryParameters['feature'];
        if (feature == 'emb_rel_pause') {
          controller.load(uri.queryParameters['v']);
        } else {
          url_launcher.launch(detail.url);
        }
        return ShouldOverrideUrlLoadingAction.CANCEL;
      },
      onWebViewCreated: (webController) {
        if (!_webController.isCompleted) {
          _webController.complete(webController);
        }
        controller.invokeJavascript = _callMethod;

        webController
          ..addJavaScriptHandler(
            handlerName: 'Ready',
            callback: (_) {
              _isPlayerReady = true;
              if (_onLoadStopCalled) {
                controller.add(
                  controller.value.copyWith(isReady: true),
                );
                controller.hideTopMenu();
              }
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'StateChange',
            callback: (args) {
              switch (args.first as int) {
                case -1:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.unStarted,
                      isReady: true,
                    ),
                  );
                  break;
                case 0:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.ended,
                    ),
                  );
                  break;
                case 1:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.playing,
                      hasPlayed: true,
                      error: YoutubeError.none,
                    ),
                  );
                  break;
                case 2:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.paused,
                    ),
                  );
                  break;
                case 3:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.buffering,
                    ),
                  );
                  break;
                case 5:
                  controller.add(
                    controller.value.copyWith(
                      playerState: PlayerState.cued,
                    ),
                  );
                  break;
                default:
                  throw Exception("Invalid player state obtained.");
              }
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'PlaybackQualityChange',
            callback: (args) {
              controller.add(
                controller.value
                    .copyWith(playbackQuality: args.first as String),
              );
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'PlaybackRateChange',
            callback: (args) {
              final num rate = args.first;
              controller.add(
                controller.value.copyWith(playbackRate: rate.toDouble()),
              );
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'Errors',
            callback: (args) {
              controller.add(
                controller.value.copyWith(error: errorEnum(args.first as int)),
              );
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'VideoData',
            callback: (args) {
              controller.add(
                controller.value.copyWith(
                    metaData: YoutubeMetaData.fromRawData(args.first)),
              );
            },
          )
          ..addJavaScriptHandler(
            handlerName: 'VideoTime',
            callback: (args) {
              final position = args.first * 1000;
              final num buffered = args.last;
              controller.add(
                controller.value.copyWith(
                  position: Duration(milliseconds: position.floor()),
                  buffered: buffered.toDouble(),
                ),
              );
            },
          );
      },
      onLoadStop: (_, __) {
        _onLoadStopCalled = true;
        if (_isPlayerReady) {
          controller.add(
            controller.value.copyWith(isReady: true),
          );
        }
      },
      onConsoleMessage: (_, message) {
        log(message.message);
      },
      onEnterFullscreen: (_) {
        if (controller.onEnterFullscreen != null) {
          controller.onEnterFullscreen();
        }
      },
      onExitFullscreen: (_) {
        if (controller.onExitFullscreen != null) {
          controller.onExitFullscreen();
        }
      },
    );
  }

  Future<void> _callMethod(String methodName) async {
    final webController = await _webController.future;
    webController.evaluateJavascript(source: methodName);
  }

  String get player => '''
    <!DOCTYPE html>
    <body>
         ${youtubeIFrameTag(controller)}
        <script>
            $initPlayerIFrame
            var player;
            var timerId;
            function onYouTubeIframeAPIReady() {
                player = new YT.Player('player', {
                    events: {
                        onReady: function(event) { window.flutter_inappwebview.callHandler('Ready'); },
                        onStateChange: function(event) { sendPlayerStateChange(event.data); },
                        onPlaybackQualityChange: function(event) { window.flutter_inappwebview.callHandler('PlaybackQualityChange', event.data); },
                        onPlaybackRateChange: function(event) { window.flutter_inappwebview.callHandler('PlaybackRateChange', event.data); },
                        onError: function(error) { window.flutter_inappwebview.callHandler('Errors', error.data); }
                    },
                });
            }

            function sendPlayerStateChange(playerState) {
                clearTimeout(timerId);
                window.flutter_inappwebview.callHandler('StateChange', playerState);
                if (playerState == 1) {
                    startSendCurrentTimeInterval();
                    sendVideoData(player);
                }
            }

            function sendVideoData(player) {
                var videoData = {
                    'duration': player.getDuration(),
                    'title': player.getVideoData().title,
                    'author': player.getVideoData().author,
                    'videoId': player.getVideoData().video_id
                };
                window.flutter_inappwebview.callHandler('VideoData', videoData);
            }

            function startSendCurrentTimeInterval() {
                timerId = setInterval(function () {
                    window.flutter_inappwebview.callHandler('VideoTime', player.getCurrentTime(), player.getVideoLoadedFraction());
                }, 100);
            }

            $youtubeIFrameFunctions
        </script>
    </body>
  ''';

  String get userAgent => controller.params.desktopMode
      ? 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'
      : null;
}

String youtubeIFrameTag(YoutubePlayerController controller) {
  final params = <String, String>{
    'autoplay': _boolean(controller.params.autoPlay),
    'mute': _boolean(controller.params.mute),
    'controls': _boolean(controller.params.showControls),
    'playsinline': _boolean(controller.params.playsInline),
    'enablejsapi': _boolean(controller.params.enableJavaScript),
    'fs': _boolean(controller.params.showFullscreenButton),
    'rel': _boolean(!controller.params.strictRelatedVideos),
    'showinfo': '0',
    'iv_load_policy': '${controller.params.showVideoAnnotations ? 1 : 3}',
    'modestbranding': '1',
    'cc_load_policy': _boolean(controller.params.enableCaption),
    'cc_lang_pref': controller.params.captionLanguage,
    'start': '${controller.params.startAt.inSeconds}',
    'allow': 'accelerometer',
    if (controller.params.endAt != null)
      'end': '${controller.params.endAt.inSeconds}',
    'disablekb': _boolean(!controller.params.enableKeyboard),
    'color': controller.params.color,
    'hl': controller.params.interfaceLanguage,
    'loop': _boolean(controller.params.loop),
    if (controller.params.playlist.isNotEmpty)
      'playlist': '${controller.params.playlist.join(',')}'
  };
  final youtubeAuthority = controller.params.privacyEnhanced
      ? 'www.youtube-nocookie.com'
      : 'www.youtube.com';
  final sourceUri = Uri.https(
    youtubeAuthority,
    'embed/${controller.initialVideoId}',
    params,
  );
  return '<iframe id="player" type="text/html"'
      ' style="position:absolute; top:0px; left:0px; bottom:0px; right:10px;'
      ' width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;"'
      ' src="$sourceUri" frameborder="0"  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
}

String _boolean(bool value) => value ? '1' : '0';
