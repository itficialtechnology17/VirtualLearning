import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/page/notes_view.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class NotesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateNotesTab();
  }
}

class _StateNotesTab extends State<NotesTab> {
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
    if (_subjectController.selectedChapter.value.note != null) {
      // requestPermission();
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

/*  void requestPermission() async {
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }*/

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
        backgroundColor: Colors.white,
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
                    height: Get.height - (AppBar().preferredSize.height + 10),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      boxShadow: [boxShadow],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    height: AppBar().preferredSize.height,
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Get.to(NotesView(urlPDFPath));
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  overflow: TextOverflow.fade,
                                  text: TextSpan(
                                      text: _subjectController
                                          .selectedChapter.value.name,
                                      style: bodyMediumTestStyle.copyWith(
                                          color: Colors.black)),
                                  maxLines: 2,
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Get.to(NotesView(urlPDFPath));
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "View".toUpperCase(),
                                        style: bodyMediumTestStyle.copyWith(
                                            color: Colors.green),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(4),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
  }
}
