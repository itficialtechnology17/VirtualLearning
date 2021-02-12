import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_question.dart';
import 'package:virtual_learning/widgets/animated_progress_bar.dart';

class TopicTest extends StatefulWidget {
  List<ModelQuestion> arrOfQuestion;

  TopicTest(this.arrOfQuestion);

  @override
  State<StatefulWidget> createState() {
    return _StateTopicTest();
  }
}

class _StateTopicTest extends State<TopicTest> {
  /* final question = [
    "If the sum of three numbers in an A.P. is 9 and their product is 24, then numbers are ",
    "If the sum of three numbers in an A.P. is 9 and their product is 24, then numbers are ",
    "If the sum of three numbers in an A.P. is 9 and their product is 24, then numbers are ",
    "If the sum of three numbers in an A.P. is 9 and their product is 24, then numbers are "
  ];
  final options = ["Option A", "Option B", "Option C", "Option D"];*/

  final PageController controller = PageController();

  var animatedProgressValue = 0.0;
  var currentIndex = 0;

  List<ModelQuestion> arrOfQuestion;

  @override
  void initState() {
    // setAnimatedProgressValue();
    super.initState();
    arrOfQuestion = widget.arrOfQuestion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill))),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height * 3,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: AnimatedProgressbar(value: animatedProgressValue),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: arrOfQuestion.length,
                    controller: controller,
                    onPageChanged: (index) {
                      currentIndex = index;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Text(arrOfQuestion[index].question),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: arrOfQuestion[index].answers.map((opt) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: Get.height * 0.03),
                                  child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[300],
                                            blurRadius: 1,
                                            offset: Offset(0.5, 1),
                                            spreadRadius: 1)
                                      ]),
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        child: InkWell(
                                          onTap: () {
                                            // _bottomSheet(context);
                                            nextPage();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.crop_square,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 16),
                                                    child: Text(
                                                      opt.answer.toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .body2,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /*_bottomSheet(BuildContext context) {
    var isTrue = true;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(isTrue ? 'Good Job!' : 'Wrong'),
              Text(
                "Solution",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              FlatButton(
                color: isTrue ? Colors.green : Colors.red,
                child: Text(
                  isTrue ? 'Onward!' : 'Try Again',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (isTrue) {
                    nextPage();
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }*/

  void nextPage() async {
    if (currentIndex == arrOfQuestion.length - 1) {
      Get.back();
    } else {
      setAnimatedProgressValue();
      await controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  setAnimatedProgressValue() {
    setState(() {
      animatedProgressValue = (currentIndex + 1) / arrOfQuestion.length;
    });
  }
}
