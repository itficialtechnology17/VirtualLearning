import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/page/play_video.dart';

class TopicTab extends StatelessWidget {
  SubjectController _subjectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(16),
        child: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _subjectController.arrOfTopic.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white, spreadRadius: 1, blurRadius: 4)
                  ],
                  /*image: DecorationImage(
                        image: AssetImage("assets/images/ic_bg.png"),
                        fit: BoxFit.fill)*/
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      _subjectController.activeTopicPosition.value = index;
                      Get.to(PlayVideo());
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /* Text(
                                                      _subjectController
                                                              .arrOfTopic[index]
                                                              .id
                                                              .toString() +
                                                          ". ".toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),*/
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: _subjectController
                                                .arrOfTopic[index].name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Poppins",
                                                fontSize: 16)),
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        _subjectController
                                                .arrOfTopic[index].minutes +
                                            " Mins",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              SizedBox(
                                width: 8,
                              ),
                              Material(
                                color: Colors.grey[100],
                                type: MaterialType.circle,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    _subjectController
                                        .activeTopicPosition.value = index;
                                    Get.to(PlayVideo());
                                  },
                                  child: CircularPercentIndicator(
                                    radius: 30.0,
                                    lineWidth: 2.0,
                                    percent: 0.4,
                                    backgroundColor: Colors.white,
                                    center: Icon(
                                      Icons.play_arrow,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    progressColor: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          ),
        ),
      ),
    );
  }
}
