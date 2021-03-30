import 'package:flutter/material.dart';

class NonSearchView extends StatelessWidget {
  var trending = [
    "Solve maths equation",
    "Economics",
    "The human eye",
    "Carbon"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Trending".toUpperCase(),
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            ListView.separated(
              itemCount: trending.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.trending_up),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: trending[index],
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Nunito")),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      RotatedBox(
                        child: Icon(
                          Icons.transit_enterexit_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        quarterTurns: 45,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
