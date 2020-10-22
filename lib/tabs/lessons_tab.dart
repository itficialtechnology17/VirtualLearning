import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/utils/custom_color.dart';

class LessonsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLessonsTab();
  }
}

class _StateLessonsTab extends State<LessonsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, position) {
            return Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 2,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 2,
                      offset: Offset(-1, -1)),
                  BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: Offset(1, 1)),
                  BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 2,
                      offset: Offset(-1, 1))
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: 0.7,
                          center: Icon(
                            Icons.play_arrow,
                            color: Color(CustomColor.colorThemeDark),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color(CustomColor.colorThemeLight),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          "Algebra",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.width *
                                        0.15,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: double.infinity,
                                            width: 2,
                                            color: Colors.grey[200],
                                          ),
                                        ),
                                        Center(
                                          child: index >= 3
                                              ? Container(
                                                  height: 5,
                                                  width: 5,
                                                  margin: EdgeInsets.only(
                                                      bottom: 15),
                                                  decoration: BoxDecoration(
                                                      color: Color(CustomColor
                                                          .colorThemeDark),
                                                      shape: BoxShape.circle),
                                                )
                                              : Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                      color: Color(CustomColor
                                                          .colorThemeDark),
                                                      shape: BoxShape.circle),
                                                  margin: EdgeInsets.only(
                                                      bottom: 15),
                                                  child: Image(
                                                    image: AssetImage(
                                                        "assets/images/ic_done.png"),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        RichText(
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: "Introduction to Algebra",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                        RichText(
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          text: TextSpan(
                                              text: "Chapter Details",
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }))
                ],
              ),
            );
          }),
    );
  }
}
