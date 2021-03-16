import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/payment_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/modules/subscription/select_subject.dart';

class Subscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateSubscription();
  }
}

class ModelColor {
  Color color1;
  Color color2;
}

class StateSubscription extends State<Subscription> {
  var arrOfColor = List<ModelColor>();
  SubscriptionController _subscriptionController = Get.find();
  PaymentController _paymentController = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();

    if (_subscriptionController.arrOfSubscription.isEmpty)
      _subscriptionController.getPlans();

    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
  }

  static const SCALE_FRACTION = 0.7;
  static const FULL_SCALE = 1.0;
  static const PAGER_HEIGHT = 200.0;
  double viewPortFraction = 0.9;

  PageController pageController;

  double page = 2.0;
  int currentPage = 0;

  List<Color> colors = [
    Color(0xffCDD5E0),
    Color(0xffAF9500),
    Color(0xffD7D7D7)
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF14C269), Color(0xFF0A0A78)])),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new PreferredSize(
              child: new Container(
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  title: Text(
                    'Subscribe Now',
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  centerTitle: true,
                ),
                /*decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [Color(0xFF14C269), Color(0xFF0A0A78)]),
                ),*/
              ),
              preferredSize: new Size(MediaQuery.of(context).size.width,
                  AppBar().preferredSize.height),
            ),
            body: Obx(() => Container(
                  // color: Colors.white,
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount:
                              _subscriptionController.arrOfSubscription.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 16, bottom: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.080),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 3,
                                    decoration: BoxDecoration(
                                        color: colors[index],
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            bottomLeft: Radius.circular(4))),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: colors[index],
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(4),
                                                  bottomLeft:
                                                      Radius.circular(16),
                                                  bottomRight:
                                                      Radius.circular(16))),
                                          padding: EdgeInsets.all(10),
                                          width: double.infinity,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  _subscriptionController
                                                      .arrOfSubscription[index]
                                                      .title
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Html(
                                            data: _subscriptionController
                                                .arrOfSubscription[index]
                                                .description,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            _subscriptionController.getPrice(
                                                _subscriptionController
                                                    .arrOfSubscription[index].id
                                                    .toString());
                                            Map<String, String> result =
                                                await Navigator.of(context)
                                                    .push(
                                              PageRouteBuilder(
                                                opaque: false, // set to false
                                                pageBuilder: (_, __, ___) =>
                                                    SelectSubject(
                                                        _subscriptionController
                                                                .arrOfSubscription[
                                                            index]),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  var begin = Offset(0.0, 1.0);
                                                  var end = Offset.zero;
                                                  var curve = Curves.ease;

                                                  var tween = Tween(
                                                          begin: begin,
                                                          end: end)
                                                      .chain(CurveTween(
                                                          curve: curve));

                                                  return SlideTransition(
                                                    position:
                                                        animation.drive(tween),
                                                    child: child,
                                                  );
                                                },
                                              ),
                                            );

                                            if (result != null) {
                                              _paymentController
                                                  .checkCredentials(
                                                      result['amount'],
                                                      result['subscription_id'],
                                                      result['subject_ids'],
                                                      index);
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(16),
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 8),
                                            child: _subscriptionController
                                                    .arrOfSubscription[index]
                                                    .isLoading
                                                ? SizedBox(
                                                    height: Get.width * 0.05,
                                                    width: Get.width * 0.05,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  )
                                                : Center(
                                                    child: Text(
                                                        _subscriptionController
                                                                    .arrOfSubscription[
                                                                        index]
                                                                    .subscribed ==
                                                                1
                                                            ? "Paid"
                                                            : "Pay Now"),
                                                  ),
                                            decoration: BoxDecoration(
                                                color: colors[index],
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.20,
                      ),
                    ],
                  ),
                )))
      ],
    );
  }
}
