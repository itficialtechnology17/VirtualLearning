import 'package:flutter/material.dart';

class QuestionBankTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateQuestionBankTab();
  }
}

class _StateQuestionBankTab extends State<QuestionBankTab> {
  List<String> lessions = [
    'Agriculture',
    'Automobile Skill',
    'Bricks Skill',
    'Chemistry',
    'Civil Engineering Skill',
    'Computer Engineering',
    'Electrical Engineering',
    'Agriculture',
    'Automobile Skill',
    'Bricks Skill',
    'Chemistry',
    'Civil Engineering Skill',
    'Computer Engineering',
    'Electrical Engineering'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lessions.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                    decoration: BoxDecoration(
                        color: Color(0xffD7EDF5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            text: TextSpan(
                                text: lessions[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/download.png",
                          height: MediaQuery.of(context).size.width * 0.05,
                          width: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
