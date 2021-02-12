import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100],
                highlightColor: Colors.grey[200],
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16)),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
