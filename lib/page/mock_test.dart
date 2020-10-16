import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class MockTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateMockTest();
  }
}

class _StateMockTest extends State<MockTest> {
  final List<String> offers = [
    "https://i.pinimg.com/originals/27/57/ad/2757add367002111adc3551bbfb511e5.png",
    "https://cdn.grabon.in/gograbon/images/web-images/uploads/1549616158296/swiggy-coupons.jpg",
    "https://cdn.grabon.in/gograbon/images/merchant/1583822192166.png",
    "https://www.shopickr.com/wp-content/uploads/2016/06/swiggy-mobikwik-discount-coupon.jpg",
    "https://images.freekaamaal.com/post_images/1574661089.png",
    "https://i.pinimg.com/originals/27/57/ad/2757add367002111adc3551bbfb511e5.png",
    "https://cdn.grabon.in/gograbon/images/web-images/uploads/1549616158296/swiggy-coupons.jpg",
    "https://cdn.grabon.in/gograbon/images/merchant/1583822192166.png",
    "https://www.shopickr.com/wp-content/uploads/2016/06/swiggy-mobikwik-discount-coupon.jpg",
    "https://images.freekaamaal.com/post_images/1574661089.png",
    "https://i.pinimg.com/originals/27/57/ad/2757add367002111adc3551bbfb511e5.png",
    "https://cdn.grabon.in/gograbon/images/web-images/uploads/1549616158296/swiggy-coupons.jpg",
  ];

  var arrOfColor = List<ModelColor>();

  CardController controller;

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
  }

  var selectedAns = 0;

  final dotController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(),
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Platform.isAndroid
                    ? Icons.keyboard_backspace
                    : Icons.arrow_back_ios,
                color: Colors.lightGreen,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Mock Test".toUpperCase(),
          style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TinderSwapCard(
              swipeUp: true,
              swipeDown: true,
              orientation: AmassOrientation.TOP,
              totalNum: arrOfColor.length,
              stackNum: 3,
              swipeEdge: 4.0,
              maxWidth: MediaQuery.of(context).size.height * 0.7,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minWidth: MediaQuery.of(context).size.height * 0.6,
              minHeight: MediaQuery.of(context).size.width * 0.8,
              cardBuilder: (context, index) => Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            arrOfColor[index].color1,
                            arrOfColor[index].color2,
                          ])),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        (index + 1).toString() + ".",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                            text:
                                "What will be the top priority in the developmental goal of a landless labourer?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontSize: 18)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedAns = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: selectedAns == 1
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "A.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Expansion of rural banking",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontSize: 14)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedAns = 2;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: selectedAns == 2
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "B.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            "More days of work and better wages",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontSize: 14)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedAns = 3;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: selectedAns == 3
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "C.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Metal roads for transportation",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontSize: 14)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedAns = 4;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: selectedAns == 4
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "D.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Establishment of a high school",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontSize: 14)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.greenAccent,
                        ),
                        value: 0.4,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                ),
              ),
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                if (align.x < 0) {
                } else if (align.x > 0) {}
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {},
            ),
          ),
        ],
      ),
    );
  }
}

class ModelColor {
  Color color1;
  Color color2;
}
