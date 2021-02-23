import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class PdfView extends StatefulWidget {
  final String notesUrl;

  PdfView(this.notesUrl);

  @override
  State<StatefulWidget> createState() {
    return _StatePdfView();
  }
}

class _StatePdfView extends State<PdfView> {
  bool loaded = false;
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  SubjectController _subjectController = Get.find();

  @override
  void initState() {
    super.initState();
    getFileFromUrl(storageUrl + widget.notesUrl).then(
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _subjectController.selectedChapter.value.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                /*Color(0xff14C269),
                  Color(0xff0A0A78),*/
                HexColor.fromHex(
                    _subjectController.selectedSubject.value.color1),
                HexColor.fromHex(
                    _subjectController.selectedSubject.value.color2),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )),
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
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: false,
                nightMode: false,
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
              ));
  }
}
