import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';

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

  @override
  void initState() {
    super.initState();
    var modelColor = ModelColor();
    modelColor.color1 = Color(0xffff5e62);
    modelColor.color2 = Color(0xffff9966);
    arrOfColor.add(modelColor);

    var modelColor1 = ModelColor();
    modelColor1.color1 = Color(0xffE100FF);
    modelColor1.color2 = Color(0xff7F00FF);
    arrOfColor.add(modelColor1);

    var modelColor2 = ModelColor();
    modelColor2.color1 = Color(0xff20e3b2);
    modelColor2.color2 = Color(0xff0cebeb);
    arrOfColor.add(modelColor2);

    var modelColor3 = ModelColor();
    modelColor3.color1 = Color(0xff642B73);
    modelColor3.color2 = Color(0xffC6426E);
    arrOfColor.add(modelColor3);

    var modelColor4 = ModelColor();
    modelColor4.color1 = Color(0xff000000);
    modelColor4.color2 = Color(0xff0f9b0f);
    arrOfColor.add(modelColor4);

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
  int currentPage = 2;

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
            body: Container(
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
                                              bottomLeft: Radius.circular(16),
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
                                                  fontWeight: FontWeight.w600),
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
                                    Container(
                                      margin: EdgeInsets.all(16),
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      child: Center(
                                        child: Text("Subscribe"),
                                      ),
                                      decoration: BoxDecoration(
                                          color: colors[index],
                                          borderRadius:
                                              BorderRadius.circular(24)),
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
            ))
      ],
    );
  }
}
