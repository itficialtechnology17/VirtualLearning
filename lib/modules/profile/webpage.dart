import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class WebPage extends StatefulWidget {
  String title = "";
  String url = "";

  WebPage.titleUrl(_, __) {
    title = _;
    url = __;
  }

  @override
  State<StatefulWidget> createState() {
    return _StateBotBaba();
  }
}

class _StateBotBaba extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
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
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Material(
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
                          ),
                          Center(
                            child: Text(
                              widget.title.toUpperCase(),
                              style: textStyle10Bold,
                              textScaleFactor: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: InAppWebView(
              initialUrl: widget.url,
            ),
          )
        ],
      ),
    );
  }
}
