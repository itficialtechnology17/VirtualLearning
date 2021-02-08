import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';

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

    if (_subscriptionController.arrOfSubscriptionPlan.isEmpty)
      _subscriptionController.getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              brightness: Brightness.light,
              expandedHeight: MediaQuery.of(context).size.height * 0.20 - 16,
              elevation: 0,
              pinned: true,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              leading: Container(
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Color(0xffD0E6EE),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            )),
                        width: double.infinity,
                        height: AppBar().preferredSize.height -
                            AppBar().preferredSize.height * 0.30,
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.20 +
                    MediaQuery.of(context).padding.top +
                    20,
                color: Colors.black,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Subscription Plan",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Choose your best plan",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Poppins"),
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body:
            /*Container(
          height: MediaQuery.of(context).size.height * 0.70,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.10,
              ),
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
                itemCount: _subscriptionController.arrOfSubscriptionPlan.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          // currentPosition = index;
//                          _pageViewController.jumpToPage(currentPosition);
                          */ /* _pageViewController.animateToPage(currentPosition,
                              duration: Duration(seconds: 1),
                              curve: Curves.ease);*/ /*
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: _subscriptionController
                                          .arrOfSubscriptionPlan[index]
                                          .isSubscribe ==
                                      1
                                  ? Border.all(
                                      color: Color(0xff02AAB0), width: 5)
                                  : Border.all(
                                      color: Colors.transparent, width: 0),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Center(
                                        child: Text(
                                          _subscriptionController
                                              .arrOfSubscriptionPlan[index]
                                              .title
                                              .toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 34,
                                            color: Colors.black,
                                            letterSpacing: 0.9995999870300293,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              arrOfColor[index].color1,
                                              arrOfColor[index].color2
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            _subscriptionController
                                                .arrOfSubscriptionPlan[index]
                                                .amount
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              color: Colors.white,
                                              letterSpacing: 0.9995999870300293,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      */ /*Html(
                                        data: arrOfSubscriptionPlan[index]
                                            .description
                                            .toUpperCase(),
                                      ),*/ /*
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            arrOfColor[index].color1,
                                            arrOfColor[index].color2
                                          ],
                                        )),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(24),
                                        splashColor: Colors.white,
                                        onTap: () {
                                          if (isSubscribe) {
                                            showSnackBar(
                                                "Message",
                                                "You have already subscribe this plan",
                                                Colors.deepOrangeAccent);
                                          } else {
                                            setState(() {
                                              // position = index;
                                              _subscriptionController
                                                  .arrOfSubscriptionPlan[index]
                                                  .isLoading = true;
                                            });
                                            // getToken(index);
                                            // _subScribePlan(index);
                                          }
                                        },
                                        child: Container(
                                          child: Center(
                                            child: _subscriptionController
                                                    .arrOfSubscriptionPlan[
                                                        index]
                                                    .isLoading
                                                ? SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 3,
                                                      backgroundColor:
                                                          Colors.yellow,
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.black),
                                                    ),
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _subscriptionController
                                                                    .arrOfSubscriptionPlan[
                                                                        index]
                                                                    .isSubscribe ==
                                                                1
                                                            ? "Subscribed"
                                                            : "Subscribe",
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          letterSpacing:
                                                              0.9995999870300293,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      _subscriptionController
                                                                  .arrOfSubscriptionPlan[
                                                                      index]
                                                                  .isSubscribe ==
                                                              1
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : Container()
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _subscriptionController.arrOfSubscriptionPlan[index]
                                          .isSubscribe !=
                                      1 &&
                                  isSubscribe
                              ? Container(
                                  margin: EdgeInsets.only(right: 32),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(16),
                                  ))
                              : Container()
                        ],
                      ));
                },
              ),
            ),
          ),
        )*/
            Container(
          height: MediaQuery.of(context).size.height * 0.70,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.10,
              ),
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
                itemCount: _subscriptionController.arrOfSubscriptionPlan.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          // currentPosition = index;
//                          _pageViewController.jumpToPage(currentPosition);
                          /* _pageViewController.animateToPage(currentPosition,
                              duration: Duration(seconds: 1),
                              curve: Curves.ease);*/
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 32),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: _subscriptionController
                                          .arrOfSubscriptionPlan[index]
                                          .isSubscribe ==
                                      1
                                  ? Border.all(
                                      color: Color(0xff02AAB0), width: 5)
                                  : Border.all(
                                      color: Colors.transparent, width: 0),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Center(
                                        child: Text(
                                          _subscriptionController
                                              .arrOfSubscriptionPlan[index]
                                              .title
                                              .toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 34,
                                            color: Colors.black,
                                            letterSpacing: 0.9995999870300293,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              arrOfColor[index].color1,
                                              arrOfColor[index].color2
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            _subscriptionController
                                                .arrOfSubscriptionPlan[index]
                                                .amount
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              color: Colors.white,
                                              letterSpacing: 0.9995999870300293,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Html(
                                        data: _subscriptionController
                                            .arrOfSubscriptionPlan[index]
                                            .description
                                            .toUpperCase(),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            arrOfColor[index].color1,
                                            arrOfColor[index].color2
                                          ],
                                        )),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(24),
                                        splashColor: Colors.white,
                                        onTap: () {
                                          if (isSubscribe) {
                                            showSnackBar(
                                                "Message",
                                                "You have already subscribe this plan",
                                                Colors.deepOrangeAccent);
                                          } else {
                                            setState(() {
                                              // position = index;
                                              _subscriptionController
                                                  .arrOfSubscriptionPlan[index]
                                                  .isLoading = true;
                                            });
                                            // getToken(index);
                                            // _subScribePlan(index);
                                          }
                                        },
                                        child: Container(
                                          child: Center(
                                            child: _subscriptionController
                                                    .arrOfSubscriptionPlan[
                                                        index]
                                                    .isLoading
                                                ? SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 3,
                                                      backgroundColor:
                                                          Colors.yellow,
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.black),
                                                    ),
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _subscriptionController
                                                                    .arrOfSubscriptionPlan[
                                                                        index]
                                                                    .isSubscribe ==
                                                                1
                                                            ? "Subscribed"
                                                            : "Subscribe",
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          letterSpacing:
                                                              0.9995999870300293,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      _subscriptionController
                                                                  .arrOfSubscriptionPlan[
                                                                      index]
                                                                  .isSubscribe ==
                                                              1
                                                          ? Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : Container()
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _subscriptionController.arrOfSubscriptionPlan[index]
                                          .isSubscribe !=
                                      1 &&
                                  isSubscribe
                              ? Container(
                                  margin: EdgeInsets.only(right: 32),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(16),
                                  ))
                              : Container()
                        ],
                      ));
                },
              ),
            ),
          ),
        ),
      ),
      /*bottomNavigationBar: Container(
        height: Get.height * 0.06,
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "Download Parent App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}
