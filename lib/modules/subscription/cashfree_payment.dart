import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CashfreePayment extends StatefulWidget {
  final String amount;
  final String paymentSource;
  final String moduleId;

  CashfreePayment(this.amount, this.paymentSource, this.moduleId);

  @override
  State<StatefulWidget> createState() {
    return _StateCashfreePayment();
  }
}

class _StateCashfreePayment extends State<CashfreePayment> {
  bool _loadingPayment = true;

  WebViewController _webController;

  @override
  void initState() {
    super.initState();
  }

  void getData() {
    _webController.evaluateJavascript("document.body.innerText").then((data) {
      // var decodedJSON = json.decode(data);

      Map<String, dynamic> responseJSON = jsonDecode(data);
      if (responseJSON["txStatus"] == "SUCCESS") {
        Navigator.pop(context, responseJSON);
      } else if (responseJSON["txStatus"] == "FAILED") {
        Navigator.pop(context, responseJSON);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("Pay Using Cashfree"),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                  Color(0xff14C269),
                  Color(0xff0A0A78),
                ])))),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: WebView(
                debuggingEnabled: false,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _webController = controller;
                  _webController.loadUrl(
                      "https://itficial.app/virtuale/api/generate-url-ios?type=API&amount=" +
                          widget.amount +
                          "&student_id=" +
                          studentId.toString() +
                          "&payment_source=" +
                          widget.paymentSource +
                          "&module_id=" +
                          widget.moduleId +
                          "");
                },
                onPageFinished: (page) {
                  if (page.contains("/request.php")) {
                    if (_loadingPayment) {
                      this.setState(() {
                        _loadingPayment = false;
                      });
                    }
                  }
                  if (page.contains("response.php")) {
                    getData();
                  }
                },
              ),
            ),
            (_loadingPayment)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(),
          ],
        ));
  }
}
