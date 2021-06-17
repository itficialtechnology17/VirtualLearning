import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/model/model_search_note.dart';
import 'package:virtual_learning/shimmer/shimmer_dummy_page.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class SearchNotesView extends StatefulWidget {
  final ModelSearchNote modelSearchNote;

  SearchNotesView(this.modelSearchNote);

  @override
  State<StatefulWidget> createState() {
    return _StateSearchNotesView();
  }
}

class _StateSearchNotesView extends State<SearchNotesView> {
  bool loaded = false;
  String urlPDFPath = "";
  bool exists = true;
  int _currentPage = 0;
  int _totalPages = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  ThemeController _themeController = Get.find();
  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    getFileFromUrl(storageUrl + widget.modelSearchNote.file).then(
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
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Stack(
            children: [
              /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
              Scaffold(
                backgroundColor: _themeController.background.value,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: margin8,
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
                                    color: _themeController.iconColor.value,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: margin8,
                            ),
                            Expanded(
                              child: Text(
                                widget.modelSearchNote.title,
                                style: textStyle10Bold.copyWith(
                                    color: _themeController.textColor.value),
                                textScaleFactor: 1.0,
                              ),
                            ),
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
                      )
                    ],
                  ),
                ),
                body: !loaded
                    ? Container(
                        padding: EdgeInsets.all(margin16),
                        child: ShimmerDummyPage(),
                        height: Get.height - (AppBar().preferredSize.height),
                      )
                    : PDFView(
                        filePath: urlPDFPath,
                        autoSpacing: false,
                        fitPolicy: FitPolicy.HEIGHT,
                        onError: (e) {},
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
        ));
  }
}
