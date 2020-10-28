import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/page/subject_details.dart';
import 'package:virtual_learning/utils/SABT.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}

class _StateHomePage extends State<HomePage> {
  var arrOfSubject = List<ModelSubject>();

  final List<String> numbers = [
    "https://www.classcentral.com/report/wp-content/uploads/2020/04/learn-for-free-coronavirus-1024x512.png",
    "https://www.classcentral.com/report/wp-content/uploads/2020/04/covid-19-learning.png",
    "https://mailer-ssc.s3-ap-southeast-1.amazonaws.com/FutureSkills/May+22+2020/header-banner.jpg",
  ];

  @override
  void initState() {
    super.initState();
    var modelSubject = ModelSubject();
    modelSubject.subjectName = "Science";
    modelSubject.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501392.svg";
    arrOfSubject.add(modelSubject);

    var modelSubject1 = ModelSubject();
    modelSubject1.subjectName = "Computer";
    modelSubject1.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501428.svg";
    arrOfSubject.add(modelSubject1);

    var modelSubject2 = ModelSubject();
    modelSubject2.subjectName = "Maths";
    modelSubject2.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501434.svg";
    arrOfSubject.add(modelSubject2);

    var modelSubject3 = ModelSubject();
    modelSubject3.subjectName = "Statistics";
    modelSubject3.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501405.svg";
    arrOfSubject.add(modelSubject3);

    var modelSubject4 = ModelSubject();
    modelSubject4.subjectName = "Account";
    modelSubject4.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501396.svg";
    arrOfSubject.add(modelSubject4);

    var modelSubject5 = ModelSubject();
    modelSubject5.subjectName = "Economics";
    modelSubject5.subjectUrl =
        "https://www.flaticon.com/svg/static/icons/svg/501/501399.svg";
    arrOfSubject.add(modelSubject5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              floating: false,
              brightness: Brightness.dark,
              backgroundColor: Colors.white,
              pinned: true,
              elevation: 0,
              leading: Material(
                color: Colors.transparent,
                type: MaterialType.circle,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Ionicons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: SABT(
                    child: Text("HOME",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                  ),
                  background: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 50),
                      height: 180,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Hi Nens",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                  Text(
                                      "You have completed 6 lesson in this week.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Image(
                              image: AssetImage(
                                  "assets/images/ic_student_couple.jpeg"),
                            ),
                          )
                        ],
                      ))),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: [
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              childAspectRatio: 1.5 / 1.8,
              children: List.generate(arrOfSubject.length, (position) {
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () => _onTapSubject(position),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[100],
                                blurRadius: 2,
                                offset: Offset(-1, -1)),
                            BoxShadow(
                                color: Colors.grey[100],
                                blurRadius: 2,
                                offset: Offset(1, -1)),
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 2,
                                offset: Offset(1, 1)),
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 8,
                                offset: Offset(-1, 1))
                          ]),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.network(
                              arrOfSubject[position].subjectUrl,
                              height: MediaQuery.of(context).size.width * 0.18,
                              width: MediaQuery.of(context).size.width * 0.18,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(arrOfSubject[position].subjectName)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 24),
              child: Text(
                "Recent Watch",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numbers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(numbers[index]),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }

  _onTapSubject(int position) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SubjectDetails()));
  }
}
