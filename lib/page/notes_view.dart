import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class NotesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateNotesView();
  }
}

class _StateNotesView extends State<NotesView> {
  bool loaded = false;
  String urlPDFPath = "";
  bool exists = true;
  int _currentPage = 0;
  int _totalPages = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    if (_subjectController.selectedChapter.value.note != null) {
      getFileFromUrl(
              storageUrl + _subjectController.selectedChapter.value.note.file)
          .then(
        (value) => {
          setState(() {
            if (value != null) {
              urlPDFPath = value.path;
              loaded = true;
              exists = true;
            } else {
              exists = false;
            }
          })
        },
      );
    }
  }

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.lightGreenAccent,
                      child: Row(
                        children: [
                          SizedBox(
                            width: margin4,
                          ),
                          Material(
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
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            _subjectController.selectedSubject.value.name,
                            style: textStyle11Bold,
                          ),
                          Spacer(),
                          SizedBox(
                            width: margin8,
                          ),
                          /*Material(
                            color: Colors.transparent,
                            type: MaterialType.circle,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                Get.to(SearchPage());
                              },
                              child: Padding(
                                padding: EdgeInsets.all(margin8),
                                child: Image.asset(
                                  ASSETS_ICONS_PATH + 'ic_search.png',
                                  height: iconHeightWidth,
                                  width: iconHeightWidth,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: !loaded
                ? Container(
                    child: Center(
                      child: SizedBox(
                        height: Get.width * 0.10,
                        width: Get.width * 0.10,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    height: Get.height - (AppBar().preferredSize.height),
                  )
                : PDFView(
                    filePath: urlPDFPath,
                    autoSpacing: false,
                    enableSwipe: true,
                    pageSnap: true,
                    swipeHorizontal: false,
                    nightMode: false,
                    fitEachPage: true,
                    onError: (e) {
                      //Show some error message or UI
                    },
                    onRender: (_pages) {
                      setState(() {
                        _totalPages = _pages;
                        pdfReady = true;
                      });
                    },
                    onViewCreated: (PDFViewController vc) {
                      setState(() {
                        _pdfViewController = vc;
                      });
                    },
                    onPageChanged: (int page, int total) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    onPageError: (page, e) {},
                  ),
          )
        ],
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          // _subjectController.selectedChapter.value.name,
          "Notes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff14C269),
              Color(0xff0A0A78),
              // HexColor.fromHex(_subjectController.selectedSubject.value.color1),
              // HexColor.fromHex(_subjectController.selectedSubject.value.color2),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
        ),
      ),
      body: _subjectController.selectedChapter.value.note == null
          ? Container(
              child: Center(
                child: Text("Notes not available."),
              ),
              height: Get.height - (AppBar().preferredSize.height),
            )
          : !loaded
              ? Container(
                  child: Center(
                    child: SizedBox(
                      height: Get.width * 0.10,
                      width: Get.width * 0.10,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  height: Get.height - (AppBar().preferredSize.height),
                )
              : PDFView(
                  filePath: urlPDFPath,
                  autoSpacing: false,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: false,
                  nightMode: false,
                  fitEachPage: true,
                  onError: (e) {
                    //Show some error message or UI
                  },
                  onRender: (_pages) {
                    setState(() {
                      _totalPages = _pages;
                      pdfReady = true;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    setState(() {
                      _pdfViewController = vc;
                    });
                  },
                  onPageChanged: (int page, int total) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  onPageError: (page, e) {},
                ),
    );
  }*/
}
