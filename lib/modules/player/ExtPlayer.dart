// import 'dart:async';
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:youtube_explode_dart/youtube_explode_dart.dart';
//
// class ExtPlayer extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _YoutubeVideoState();
//   }
// }
//
// class _YoutubeVideoState extends State<ExtPlayer> {
//   VideoPlayerController _controller;
//   bool controllerVisible = true;
//   bool isMute = false;
//   double volume = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // getUrl();
//     _controller = VideoPlayerController.network(
//       'https://www.youtube.com/watch?v=KBIq11mNB0I',
//       // 'https://www.youtube.com/watch?v=TROCWpIWP4E',
//       // 'https://itficial.app/virtuale/test_video.mp4',
//       // 'https://www.youtube.com/download_my_video?v=Ld09km3rnUQ&t=QUFFLUhqa0JaZUVYdHlqcE4wRm53NlVHNXpKU0ttSXV6d3xBQ3Jtc0tuTk1BUVdyeTk1T2FtZ1hrME8zdmJtdE1SeTFheXQtdFBjV3FPREhrVTFFbzA3c1RuYlpCa19aMlZkR3JyMnYtdGNYbi1welRxdjFDdkpXdXJMVXRsSm1Scmo5S1BUdTVKbFRFTVdUem1McnFEam5JOA%3D%3D',
//       // 'https://www.youtube.com/watch?v=TROCWpIWP4E',
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//
//     _controller.initialize();
//     _controller.play();
//
//     var _duration = new Duration(seconds: 4);
//     Timer(_duration, hideController);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   hideController() {
//     setState(() {
//       if (_controller.value.isPlaying) controllerVisible = false;
//     });
//   }
//
//   int rotation = 0;
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.black,
//     ));
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           rotation == 0
//               ? Expanded(
//                   child: Container(
//                     color: Colors.white,
//                   ),
//                 )
//               : SizedBox(
//                   height: 0,
//                 ),
//           rotation != 0
//               ? Center(
//                   child: RotatedBox(
//                     child: Container(
//                       // color: Colors.black,
//                       child: AspectRatio(
//                         // aspectRatio: _controller.value.aspectRatio,
//                         aspectRatio: 16 / 9,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: <Widget>[
//                             VideoPlayer(_controller),
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
//                                     var _duration = new Duration(seconds: 4);
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
//                                                   type: MaterialType.circle,
//                                                   clipBehavior: Clip
//                                                       .antiAliasWithSaveLayer,
//                                                   color: Colors.transparent,
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Duration currentDuration =
//                                                           _controller
//                                                               .value.position;
//                                                       Duration _nextDuration =
//                                                           Duration(
//                                                               milliseconds:
//                                                                   10000);
//                                                       _controller.seekTo(
//                                                           currentDuration -
//                                                               _nextDuration);
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsets.all(4),
//                                                       child: Icon(
//                                                         Icons.replay_10,
//                                                         color: Colors.white,
//                                                         size: Get.width * 0.10,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Center(
//                                                 child: Material(
//                                                   type: MaterialType.circle,
//                                                   clipBehavior: Clip
//                                                       .antiAliasWithSaveLayer,
//                                                   color: Colors.transparent,
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       if (_controller
//                                                           .value.isPlaying) {
//                                                         setState(() {
//                                                           controllerVisible =
//                                                               true;
//                                                         });
//                                                         _controller.pause();
//                                                       } else {
//                                                         _controller.play();
//                                                         setState(() {
//                                                           controllerVisible =
//                                                               false;
//                                                         });
//                                                       }
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsets.all(4),
//                                                       child: Icon(
//                                                         _controller
//                                                                 .value.isPlaying
//                                                             ? Icons.pause
//                                                             : Icons.play_arrow,
//                                                         color: Colors.white,
//                                                         size: Get.width * 0.10,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Center(
//                                                 child: Material(
//                                                   type: MaterialType.circle,
//                                                   clipBehavior: Clip
//                                                       .antiAliasWithSaveLayer,
//                                                   color: Colors.transparent,
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Duration currentDuration =
//                                                           _controller
//                                                               .value.position;
//                                                       Duration _nextDuration =
//                                                           Duration(
//                                                               milliseconds:
//                                                                   10000);
//                                                       _controller.seekTo(
//                                                           currentDuration +
//                                                               _nextDuration);
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsets.all(4),
//                                                       child: Icon(
//                                                         Icons.forward_10,
//                                                         color: Colors.white,
//                                                         size: Get.width * 0.10,
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
//                                               horizontal: 16, vertical: 4),
//                                           child: Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: VideoProgressIndicator(
//                                                   _controller,
//                                                   allowScrubbing: true,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 16,
//                                               ),
//                                               /*Material(
//                                           type: MaterialType.circle,
//                                           clipBehavior:
//                                               Clip.antiAliasWithSaveLayer,
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             onTap: () {
//                                               _showBottomSheet(context);
//                                             },
//                                             child: Padding(
//                                               padding: EdgeInsets.all(8),
//                                               child: Text(
//                                                 "1x",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16),
//                                               ),
//                                             ),
//                                           ),
//                                         ),*/
//                                               Material(
//                                                 type: MaterialType.circle,
//                                                 clipBehavior:
//                                                     Clip.antiAliasWithSaveLayer,
//                                                 color: Colors.transparent,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     setState(() {
//                                                       isMute = !isMute;
//                                                       if (isMute) {
//                                                         volume = _controller
//                                                             .value.volume;
//                                                         _controller
//                                                             .setVolume(0);
//                                                       } else {
//                                                         _controller
//                                                             .setVolume(volume);
//                                                       }
//                                                     });
//                                                   },
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(4),
//                                                     child: Icon(
//                                                       isMute
//                                                           ? Icons
//                                                               .volume_off_sharp
//                                                           : Icons.volume_up,
//                                                       color: Colors.white,
//                                                       size: Get.width * 0.06,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 4,
//                                               ),
//                                               Material(
//                                                 type: MaterialType.circle,
//                                                 clipBehavior:
//                                                     Clip.antiAliasWithSaveLayer,
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
//                                                     padding: EdgeInsets.all(4),
//                                                     child: Icon(
//                                                       Icons.fullscreen,
//                                                       color: Colors.white,
//                                                       size: Get.width * 0.06,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.topRight,
//                                         child: Material(
//                                           type: MaterialType.circle,
//                                           clipBehavior:
//                                               Clip.antiAliasWithSaveLayer,
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             onTap: () {},
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 16, vertical: 8),
//                                               child: Icon(
//                                                 Icons.more_vert,
//                                                 color: Colors.white,
//                                                 size: Get.width * 0.06,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 : SizedBox.shrink(),
//                           ],
//                         ),
//                       ),
//                     ),
//                     quarterTurns: rotation,
//                   ),
//                 )
//               : RotatedBox(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                         top: MediaQuery.of(context).padding.top),
//                     child: AspectRatio(
//                       // aspectRatio: _controller.value.aspectRatio,
//                       aspectRatio: 16 / 9,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: <Widget>[
//                           VideoPlayer(_controller),
//                           GestureDetector(
//                             child: Container(
//                               color: controllerVisible
//                                   ? Colors.black26
//                                   : Colors.transparent,
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 controllerVisible = !controllerVisible;
//                                 if (controllerVisible) {
//                                   var _duration = new Duration(seconds: 4);
//                                   Timer(_duration, hideController);
//                                 }
//                               });
//                             },
//                           ),
//                           controllerVisible
//                               ? Stack(
//                                   children: [
//                                     Center(
//                                       child: Row(
//                                         children: [
//                                           Expanded(
//                                             child: Center(
//                                               child: Material(
//                                                 type: MaterialType.circle,
//                                                 clipBehavior:
//                                                     Clip.antiAliasWithSaveLayer,
//                                                 color: Colors.transparent,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     Duration currentDuration =
//                                                         _controller
//                                                             .value.position;
//                                                     Duration _nextDuration =
//                                                         Duration(
//                                                             milliseconds:
//                                                                 10000);
//                                                     _controller.seekTo(
//                                                         currentDuration -
//                                                             _nextDuration);
//                                                   },
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(4),
//                                                     child: Icon(
//                                                       Icons.replay_10,
//                                                       color: Colors.white,
//                                                       size: Get.width * 0.10,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Center(
//                                               child: Material(
//                                                 type: MaterialType.circle,
//                                                 clipBehavior:
//                                                     Clip.antiAliasWithSaveLayer,
//                                                 color: Colors.transparent,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     if (_controller
//                                                         .value.isPlaying) {
//                                                       setState(() {
//                                                         controllerVisible =
//                                                             true;
//                                                       });
//                                                       _controller.pause();
//                                                     } else {
//                                                       _controller.play();
//                                                       setState(() {
//                                                         controllerVisible =
//                                                             false;
//                                                       });
//                                                     }
//                                                   },
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(4),
//                                                     child: Icon(
//                                                       _controller
//                                                               .value.isPlaying
//                                                           ? Icons.pause
//                                                           : Icons.play_arrow,
//                                                       color: Colors.white,
//                                                       size: Get.width * 0.10,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Center(
//                                               child: Material(
//                                                 type: MaterialType.circle,
//                                                 clipBehavior:
//                                                     Clip.antiAliasWithSaveLayer,
//                                                 color: Colors.transparent,
//                                                 child: InkWell(
//                                                   onTap: () {
//                                                     Duration currentDuration =
//                                                         _controller
//                                                             .value.position;
//                                                     Duration _nextDuration =
//                                                         Duration(
//                                                             milliseconds:
//                                                                 10000);
//                                                     _controller.seekTo(
//                                                         currentDuration +
//                                                             _nextDuration);
//                                                   },
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(4),
//                                                     child: Icon(
//                                                       Icons.forward_10,
//                                                       color: Colors.white,
//                                                       size: Get.width * 0.10,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 16, vertical: 4),
//                                         child: Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Expanded(
//                                               child: VideoProgressIndicator(
//                                                 _controller,
//                                                 allowScrubbing: true,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 16,
//                                             ),
//                                             /*Material(
//                                           type: MaterialType.circle,
//                                           clipBehavior:
//                                               Clip.antiAliasWithSaveLayer,
//                                           color: Colors.transparent,
//                                           child: InkWell(
//                                             onTap: () {
//                                               _showBottomSheet(context);
//                                             },
//                                             child: Padding(
//                                               padding: EdgeInsets.all(8),
//                                               child: Text(
//                                                 "1x",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 16),
//                                               ),
//                                             ),
//                                           ),
//                                         ),*/
//                                             Material(
//                                               type: MaterialType.circle,
//                                               clipBehavior:
//                                                   Clip.antiAliasWithSaveLayer,
//                                               color: Colors.transparent,
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     isMute = !isMute;
//                                                     if (isMute) {
//                                                       volume = _controller
//                                                           .value.volume;
//                                                       _controller.setVolume(0);
//                                                     } else {
//                                                       _controller
//                                                           .setVolume(volume);
//                                                     }
//                                                   });
//                                                 },
//                                                 child: Padding(
//                                                   padding: EdgeInsets.all(4),
//                                                   child: Icon(
//                                                     isMute
//                                                         ? Icons.volume_off_sharp
//                                                         : Icons.volume_up,
//                                                     color: Colors.white,
//                                                     size: Get.width * 0.06,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 4,
//                                             ),
//                                             Material(
//                                               type: MaterialType.circle,
//                                               clipBehavior:
//                                                   Clip.antiAliasWithSaveLayer,
//                                               color: Colors.transparent,
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     if (rotation == 0) {
//                                                       rotation = 45;
//                                                     } else {
//                                                       rotation = 0;
//                                                     }
//                                                   });
//                                                 },
//                                                 child: Padding(
//                                                   padding: EdgeInsets.all(4),
//                                                   child: Icon(
//                                                     Icons.fullscreen,
//                                                     color: Colors.white,
//                                                     size: Get.width * 0.06,
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Material(
//                                         type: MaterialType.circle,
//                                         clipBehavior:
//                                             Clip.antiAliasWithSaveLayer,
//                                         color: Colors.transparent,
//                                         child: InkWell(
//                                           onTap: () {},
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 16, vertical: 8),
//                                             child: Icon(
//                                               Icons.more_vert,
//                                               color: Colors.white,
//                                               size: Get.width * 0.06,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               : SizedBox.shrink(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   quarterTurns: rotation,
//                 ),
//         ],
//       ),
//     );
//   }
//
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return GestureDetector(
//           onTap: () => Navigator.of(context).pop(),
//           child: Container(
//             color: Color.fromRGBO(0, 0, 0, 0.001),
//             child: GestureDetector(
//               onTap: () {},
//               child: DraggableScrollableSheet(
//                 initialChildSize: 0.4,
//                 minChildSize: 0.2,
//                 maxChildSize: 0.75,
//                 builder: (_, controller) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: const Radius.circular(16.0),
//                         topRight: const Radius.circular(16.0),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Icon(
//                           Icons.remove,
//                           color: Colors.grey[600],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text("Playback Speed"),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                             controller: controller,
//                             itemCount: playbackSpeed.length,
//                             itemBuilder: (_, index) {
//                               return Material(
//                                 color: Colors.transparent,
//                                 child: InkWell(
//                                   onTap: () {},
//                                   child: Container(
//                                     child: RadioListTile(
//                                       value: playbackSpeed[index].isSelected,
//                                       groupValue: 1,
//                                       selected: playbackSpeed[index].isSelected,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           for (var i = 0;
//                                               i < playbackSpeed.length;
//                                               ++i) {
//                                             playbackSpeed[i].isSelected = false;
//                                           }
//                                           playbackSpeed[index].isSelected =
//                                               true;
//                                         });
//                                         Navigator.pop(context);
//                                       },
//                                       title: Text(playbackSpeed[index].name),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> getUrl() async {
//     var yt = YoutubeExplode();
//     var streamManifest =
//         await yt.videos.streamsClient.getManifest("KBIq11mNB0I");
//     var videoUrl = streamManifest.muxed.first.url.toString();
//     print("Youtube Video :" + videoUrl);
//   }
// }
//
// var playbackSpeed = [
//   ModelPlaybackSpeed("0.5x", false),
//   ModelPlaybackSpeed("0.75x", false),
//   ModelPlaybackSpeed("Normal", false),
//   ModelPlaybackSpeed("1.25x", false),
//   ModelPlaybackSpeed("1.5x", false),
//   ModelPlaybackSpeed("2x", false)
// ];
//
// class ModelPlaybackSpeed {
//   String name;
//   bool isSelected = false;
//
//   ModelPlaybackSpeed(this.name, this.isSelected);
// }
//
// class _PlayPauseOverlay extends StatelessWidget {
//   const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 100.0,
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//       ],
//     );
//   }
// }
