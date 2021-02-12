import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: 100,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      subtitle: Container(
                        width: 30,
                        height: 10.0,
                        color: Colors.white,
                      ),
                      trailing: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    );
                  },
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
