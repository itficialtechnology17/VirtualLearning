import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
        appBar: AppBar(
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Color(0xff14C269),
                  Color(0xff0A0A78),
                ])),
          ),
          leading: Material(
            color: Colors.transparent,
            type: MaterialType.circle,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Platform.isAndroid
                    ? Icons.keyboard_backspace
                    : Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.title.toUpperCase(),
            style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
          ),
        ),
        body: InAppWebView(
          initialUrl: widget.url,
        ) /*WebView(
          // initialUrl: 'https://app.botbaba.io/bot/2407DXlqfk/Surties',
          initialUrl: 'https://app.botbaba.io/bot/2407DXlqfk/Surties',
        )*/
        );
  }
}
