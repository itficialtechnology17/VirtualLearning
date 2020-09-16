import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Intro11 extends StatelessWidget {
  Intro11({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/ic_slide_01.svg",
          ),
          SizedBox(
            width: 127.0,
            child: Text(
              'Your Path to Pinnacle',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff106433),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                height: 1.5833333333333333,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 228.0,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: const Color(0xff3aa59b),
                  height: 1.5384615384615385,
                ),
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: TextStyle(
                      color: const Color(0xff106433),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: const Color(0xff205072),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 50.0,
            height: 8.0,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(21.0, 0.0, 8.0, 8.0),
                  size: Size(50.0, 8.0),
                  fixedWidth: true,
                  fixedHeight: true,
                  child:
                      // Adobe XD layer: 'Atoms/ Pagination N…' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 8.0, 8.0),
                        size: Size(8.0, 8.0),
                        fixedWidth: true,
                        fixedHeight: true,
                        child:
                            // Adobe XD layer: 'Dot 1' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xff205072),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 8.0, 8.0),
                  size: Size(50.0, 8.0),
                  child:
                      // Adobe XD layer: 'Atoms/ Pagination N…' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 8.0, 8.0),
                        size: Size(8.0, 8.0),
                        child:
                            // Adobe XD layer: 'Dot 2' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xff3aa59b),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(42.0, 0.0, 8.0, 8.0),
                  size: Size(50.0, 8.0),
                  child:
                      // Adobe XD layer: 'Atoms/ Pagination N…' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 8.0, 8.0),
                        size: Size(8.0, 8.0),
                        child:
                            // Adobe XD layer: 'Dot 2' (shape)
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xff205072),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 312.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              border: Border.all(width: 1.0, color: const Color(0xff3aa59b)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x2632822d),
                  offset: Offset(15, 15),
                  blurRadius: 40,
                ),
              ],
            ),
          ),
          Text(
            'GET STARTED',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: const Color(0xff205072),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            width: 134.0,
            height: 5.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color(0x21106433),
            ),
          ),
          Container(),
          Container(
            width: 133.0,
            height: 27.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.43),
              color: const Color(0x1aaaea15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.43),
              color: const Color(0x1aaaea15),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(131.2, 63.9, 30.2, 9.1),
            size: Size(332.8, 266.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(68.0, 31.9, 30.2, 9.1),
            size: Size(332.8, 266.0),
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(99.6, 41.1, 30.2, 9.1),
            size: Size(332.8, 266.0),
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(131.2, 50.2, 30.2, 9.1),
            size: Size(332.8, 266.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(166.3, 45.6, 30.2, 9.1),
            size: Size(332.8, 266.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(197.9, 54.7, 30.2, 9.1),
            size: Size(332.8, 266.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.43),
                color: const Color(0x1aaaea15),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 63.9, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 31.9, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 41.1, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 50.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 13.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 22.8, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 31.9, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 0.0, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 9.1, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 18.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 13.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 22.8, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 31.9, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 0.0, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 9.1, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 18.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 208.1, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 217.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 226.3, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 194.4, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 203.5, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 212.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 208.1, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 217.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 226.3, 30.2, 9.1),
                size: Size(332.8, 266.0),
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 194.4, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 203.5, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 212.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 176.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 185.3, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 194.4, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(68.0, 162.5, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(99.6, 171.6, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(131.2, 180.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 176.2, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 185.3, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 194.4, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(166.3, 162.5, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.9, 171.6, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(229.5, 180.7, 30.2, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.43),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(15.4, 240.7, 307.8, 25.3),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinRight: true,
                pinBottom: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0x0a487212),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(0.0, 61.4, 52.6, 24.0),
                size: Size(332.8, 266.0),
                pinLeft: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_33b75i,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(70.1, 30.5, 16.3, 26.6),
                size: Size(332.8, 266.0),
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_h13p5v,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(39.9, 26.8, 15.1, 41.5),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinTop: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_vxr0ue,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(41.7, 48.8, 255.8, 128.1),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinRight: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.21),
                    color: const Color(0xfffefefe),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x52000000),
                        offset: Offset(0, 3),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(41.7, 169.1, 255.8, 7.7),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinRight: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_qrtb53,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(66.6, 159.7, 18.9, 9.5),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5),
                    color: const Color(0xffaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(90.8, 167.7, 13.0, 1.4),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: const Color(0xffaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(58.5, 67.8, 81.5, 78.2),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_pu8lxp,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(67.6, 81.7, 71.1, 4.5),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_o32np,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(89.3, 74.2, 26.2, 6.4),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_v7dfyf,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(85.7, 91.7, 25.2, 21.2),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_v3xjas,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(95.6, 96.8, 4.6, 6.6),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_rozs25,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(91.3, 101.6, 6.4, 9.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_6yu6yq,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(92.7, 101.5, 7.4, 9.3),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_tkemxz,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(93.2, 102.5, 6.4, 8.0),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_haudv6,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(140.3, 79.5, 51.2, 37.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_2b5jkp,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(190.7, 64.2, 22.0, 22.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_lqyb1m,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.7, 104.9, 22.0, 22.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_wqfeer,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(197.8, 56.5, 14.7, 21.9),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_104502,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(142.2, 119.1, 55.3, 1.6),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_g4yuyp,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(200.5, 109.2, 18.9, 10.1),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_3zwxhb,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(201.8, 105.4, 11.2, 26.8),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_1njqjj,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(71.2, 115.2, 49.7, 8.3),
                size: Size(332.8, 266.0),
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_8l52gz,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(225.3, 78.8, 50.9, 174.5),
                size: Size(332.8, 266.0),
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child:
                    // Adobe XD layer: 'Michel' (group)
                    Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 159.6, 22.2, 14.0),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_qk1w2g,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(30.6, 159.4, 11.7, 15.1),
                      size: Size(50.9, 174.5),
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_71t23o,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(1.2, 91.8, 7.0, 11.1),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_hgw22a,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(1.8, 88.9, 5.6, 5.7),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xaocid,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.2, 44.5, 10.8, 46.7),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_mofm1f,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(4.7, 79.1, 39.2, 84.3),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      pinRight: true,
                      pinBottom: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_fm1idl,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(11.4, 18.7, 18.2, 16.7),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_tm51hv,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(11.4, 18.7, 18.2, 16.7),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_42mni3,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(8.2, 5.3, 18.6, 18.6),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          color: const Color(0xfffbb3b2),
                        ),
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(9.2, 23.3, 19.5, 14.0),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_7bosix,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(3.6, 78.0, 27.7, 8.9),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_nia39b,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(1.1, 26.6, 46.5, 55.7),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      pinRight: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_r5aqts,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(34.2, 41.5, 16.8, 38.0),
                      size: Size(50.9, 174.5),
                      pinRight: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_2ji3ha,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(32.1, 73.3, 9.6, 9.0),
                      size: Size(50.9, 174.5),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_xvz6p3,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(24.0, 75.2, 15.6, 8.2),
                      size: Size(50.9, 174.5),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_qwvfbt,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(18.2, 10.7, 5.7, 4.8),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_z4uad9,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(10.6, 11.6, 5.7, 4.8),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_dtg6rj,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(7.3, 12.3, 3.5, 1.6),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_z19xd0,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(23.2, 10.0, 3.4, 2.3),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_jl9yxr,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(15.9, 12.5, 2.4, 1.0),
                      size: Size(50.9, 174.5),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_98xifa,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(5.5, 0.0, 21.9, 13.6),
                      size: Size(50.9, 174.5),
                      pinLeft: true,
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: SvgPicture.string(
                        _svg_sz97o0,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(276.2, 214.4, 24.7, 31.9),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_ezkppa,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(300.9, 214.1, 27.6, 32.3),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_zff21i,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(285.1, 216.0, 15.8, 30.3),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_dk3pn6,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(300.9, 205.1, 31.9, 41.2),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_g715e3,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(293.7, 250.3, 12.3, 2.1),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(295.7, 244.6, 13.0, 6.6),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_nsqpa2,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(295.7, 246.5, 13.0, 4.7),
                size: Size(332.8, 266.0),
                pinRight: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_kbr982,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(7.9, 224.7, 19.7, 25.4),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_564so9,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(27.6, 224.4, 22.0, 25.7),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_fklb7d,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(15.0, 226.0, 12.5, 24.1),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_czcaxw,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(27.6, 217.3, 25.4, 32.8),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_2qxvft,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(21.8, 253.3, 9.8, 1.7),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0x1aaaea15),
                  ),
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(23.4, 248.7, 10.4, 5.3),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_idkae4,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(23.4, 250.3, 10.4, 3.8),
                size: Size(332.8, 266.0),
                pinLeft: true,
                pinBottom: true,
                fixedWidth: true,
                fixedHeight: true,
                child: SvgPicture.string(
                  _svg_ly9oyt,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const String _svg_33b75i =
    '<svg viewBox="0.0 61.4 52.6 24.0" ><path transform="translate(-125.82, -184.66)" d="M 155.5256958007813 250.2093200683594 C 170.036376953125 256.4978637695313 178.3743286132813 269.5101318359375 178.3743286132813 269.5101318359375 C 178.3743286132813 269.5101318359375 163.1828308105469 272.3175048828125 148.6686553955078 266.032470703125 C 134.1544647216797 259.7474365234375 125.8200225830078 246.7316741943359 125.8200225830078 246.7316741943359 C 125.8200225830078 246.7316741943359 141.0114898681641 243.9207763671875 155.5256958007813 250.2093200683594 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h13p5v =
    '<svg viewBox="70.1 30.5 16.3 26.6" ><path transform="translate(-255.49, -127.47)" d="M 329.7236328125 168.8786315917969 C 334.2119750976563 161.5092315673828 341.8550720214844 158 341.8550720214844 158 C 341.8550720214844 158 342.2059936523438 166.4011077880859 337.7317199707031 173.7494506835938 C 333.2574462890625 181.0977783203125 325.5968017578125 184.603515625 325.5968017578125 184.603515625 C 325.5968017578125 184.603515625 325.2318420410156 176.2059173583984 329.7236328125 168.8786315917969 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vxr0ue =
    '<svg viewBox="39.9 26.8 15.1 41.5" ><path transform="translate(-199.66, -120.54)" d="M 240.8997497558594 169.8382263183594 C 244.1106872558594 181.2993927001953 252.9609832763672 188.84423828125 252.9609832763672 188.84423828125 C 252.9609832763672 188.84423828125 256.6070861816406 177.8006896972656 253.3961181640625 166.3360137939453 C 250.1851806640625 154.871337890625 241.3313751220703 147.3300018310547 241.3313751220703 147.3300018310547 C 241.3313751220703 147.3300018310547 237.6852874755859 158.3735656738281 240.8997497558594 169.8382263183594 Z" fill="#46455b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qrtb53 =
    '<svg viewBox="41.7 169.1 255.8 7.7" ><path transform="translate(-77.16, -312.85)" d="M 118.8699951171875 482 L 374.6932067871094 482 L 374.6932067871094 487.190185546875 C 374.6932067871094 488.5875244140625 373.5604248046875 489.7203063964844 372.1630859375 489.7203063964844 L 121.4001617431641 489.7203369140625 C 120.0027923583984 489.7203063964844 118.8700103759766 488.5875244140625 118.8699951171875 487.190185546875 L 118.8699951171875 482 Z" fill="#000000" fill-opacity="0.1" stroke="none" stroke-width="1" stroke-opacity="0.1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pu8lxp =
    '<svg viewBox="58.5 67.8 81.5 78.2" ><path transform="translate(-234.05, -196.41)" d="M 313.3630065917969 270.2369384765625 C 322.6238708496094 271.9459228515625 332.0707397460938 270.2369384765625 341.2929992675781 269.0788879394531 L 369.3212585449219 265.5696411132813 C 370.4547424316406 265.42578125 372.1040649414063 264.7484741210938 372.7708435058594 266.1346435546875 C 373.1463317871094 266.91015625 372.8936767578125 268.5910949707031 372.9217529296875 269.4824523925781 C 372.9954223632813 271.9389038085938 372.9884033203125 274.3953857421875 372.9217529296875 276.8518371582031 C 372.79541015625 281.5471801757813 372.4514770507813 286.2320251464844 372.0128173828125 290.9063110351563 C 371.1600952148438 300.0549011230469 369.9529113769531 309.1543579101563 369.3493347167969 318.3380126953125 C 369.04052734375 323.0123291015625 368.8861083984375 327.7006530761719 369.02294921875 332.3749389648438 C 369.0545654296875 333.4909057617188 369.1001586914063 334.6068115234375 369.1668701171875 335.71923828125 C 369.2405395507813 336.9650268554688 369.7985229492188 338.8143920898438 368.4404296875 339.6460876464844 C 367.6649169921875 340.1233520507813 366.1383666992188 340.0987854003906 365.2505493164063 340.2391357421875 C 363.8468627929688 340.4602355957031 362.4431762695313 340.6356811523438 361.0114135742188 340.7795715332031 C 351.5750732421875 341.7235717773438 342.0158996582031 341.3305053710938 332.5444946289063 341.2743835449219 L 303.9442138671875 341.1269836425781 L 296.9678649902344 341.08837890625 C 296.3362121582031 341.08837890625 294.0587158203125 341.4673767089844 293.669189453125 340.7164306640625 C 293.5042419433594 340.3970642089844 293.9429016113281 338.9021301269531 294.0201110839844 338.5020751953125 C 294.1277160644531 337.8423461914063 294.2446899414063 337.1837768554688 294.3710327148438 336.5263671875 C 295.1851806640625 331.9117431640625 296.1466979980469 327.3251647949219 297.115234375 322.7421264648438 C 299.1962280273438 312.916259765625 301.3263244628906 303.041259765625 302.1825866699219 293.0048522949219 C 302.6072082519531 287.9691162109375 302.3264770507813 282.8877563476563 302.8458251953125 277.8625183105469 C 303.0879821777344 275.5288696289063 303.375732421875 270.3211669921875 306.4813842773438 270.1141357421875 C 309.1133422851563 269.9386596679688 311.8224487304688 270.1141357421875 314.4613952636719 270.1141357421875 C 314.7521057128906 270.1141357421875 314.98779296875 269.8784484863281 314.98779296875 269.5877380371094 C 314.98779296875 269.2970275878906 314.7521057128906 269.0613403320313 314.4613952636719 269.0613403320313 C 311.9698486328125 269.0613403320313 309.4747924804688 268.9946899414063 306.9832153320313 269.0438232421875 C 305.3268432617188 269.0753784179688 304.1758422851563 269.4684448242188 303.3862609863281 270.9914245605469 C 301.3684387207031 274.9007263183594 301.5755004882813 280.1154479980469 301.5123291015625 284.3826904296875 C 301.3614196777344 294.5980529785156 299.7927856445313 304.5958862304688 297.7504272460938 314.586669921875 C 296.7222290039063 319.6153869628906 295.61328125 324.6265869140625 294.5921020507813 329.6588134765625 C 294.1113586425781 332.0626525878906 293.6516418457031 334.4735107421875 293.2305297851563 336.891357421875 C 293.0339965820313 338.0423889160156 292.0408935546875 340.5795593261719 292.9147033691406 341.6358337402344 C 293.7885131835938 342.6921081542969 296.4765625 342.1236267089844 297.6802368164063 342.1306457519531 L 306.0532836914063 342.1797790527344 L 322.0974731445313 342.2710266113281 C 332.4637756347656 342.3306884765625 342.8651428222656 342.6219482421875 353.2279052734375 342.316650390625 C 358.1759338378906 342.1692504882813 363.4046936035156 341.9656982421875 368.222900390625 340.7831115722656 C 369.6581420898438 340.4321899414063 370.3494873046875 339.7724609375 370.4056396484375 338.242431640625 C 370.4898376464844 335.8701782226563 370.1038208007813 333.4242553710938 370.0546875 331.0414733886719 C 369.7037963867188 310.65283203125 374.493896484375 290.5484313964844 374.0025939941406 270.1527709960938 C 373.9710083007813 268.7666015625 374.493896484375 265.2714233398438 372.9779052734375 264.4327087402344 C 372.297119140625 264.0537109375 371.4127807617188 264.2607421875 370.6968994140625 264.344970703125 C 369.3283081054688 264.5028991699219 367.9631958007813 264.6958923339844 366.5946044921875 264.8573303222656 L 348.8203125 267.0751647949219 C 343.1388549804688 267.7770080566406 337.4609375 268.5350036621094 331.7689514160156 269.1806945800781 C 325.7435913085938 269.8825378417969 319.6585693359375 270.3001403808594 313.654296875 269.1806945800781 C 312.9910278320313 269.057861328125 312.706787109375 270.0720520019531 313.37353515625 270.1948852539063 L 313.3630065917969 270.2369384765625 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o32np =
    '<svg viewBox="67.6 81.7 71.1 4.5" ><path transform="translate(-250.92, -222.19)" d="M 319.0628967285156 308.4202575683594 L 389.1844177246094 304.981201171875 C 389.8616943359375 304.9461059570313 389.865234375 303.8933410644531 389.1844177246094 303.9284362792969 L 319.0628967285156 307.3674926757813 C 318.3890991210938 307.3990783691406 318.3856201171875 308.4518432617188 319.0628967285156 308.4202575683594 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v7dfyf =
    '<svg viewBox="89.3 74.2 26.2 6.4" ><path transform="translate(-290.93, -208.17)" d="M 380.6749877929688 285.7255859375 C 380.27685546875 286.1475219726563 380.1129760742188 286.739013671875 380.2372741699219 287.3056640625 C 380.361572265625 287.8723449707031 380.7579345703125 288.3409423828125 381.2961120605469 288.5575256347656 C 382.2401123046875 288.9891662597656 383.3490295410156 288.6277160644531 384.2859802246094 288.392578125 C 385.689697265625 288.0416870117188 387.0933837890625 287.7293395996094 388.53564453125 287.4731750488281 C 391.6748046875 286.9174499511719 394.8544311523438 286.6216735839844 398.0421752929688 286.5888671875 C 399.4949951171875 286.5713195800781 400.9373168945313 286.6380004882813 402.39013671875 286.701171875 C 403.4429016113281 286.7432556152344 404.5763854980469 286.8274841308594 405.4677124023438 286.1747741699219 C 406.4854125976563 285.4308166503906 406.8152465820313 283.9779663085938 405.8186645507813 283.0726013183594 C 404.4149475097656 281.791748046875 401.3899841308594 282.5357055664063 399.7687377929688 282.6690368652344 C 393.8858032226563 283.1577453613281 388.041015625 284.0299072265625 382.2716674804688 285.2799072265625 C 381.6119384765625 285.4202880859375 381.88916015625 286.4379577636719 382.5524291992188 286.2940979003906 C 386.3587646484375 285.4729309082031 390.1943664550781 284.8132019042969 394.0592041015625 284.3148803710938 C 395.9588623046875 284.0809326171875 397.862060546875 283.8832397460938 399.7687377929688 283.7218017578125 C 400.6670837402344 283.6481323242188 401.5654296875 283.5814514160156 402.4638061523438 283.52880859375 C 402.8147583007813 283.5077514648438 403.1867065429688 283.4691467285156 403.5446472167969 283.4796752929688 C 404.6571044921875 283.5042419433594 404.7869262695313 283.30419921875 404.1201782226563 284.6482543945313 C 403.527099609375 285.837890625 403.7166137695313 285.7010192871094 402.6884155273438 285.6624145507813 C 402.2532653808594 285.6624145507813 401.818115234375 285.61328125 401.3829956054688 285.5922241210938 C 400.4916381835938 285.5548095703125 399.6002807617188 285.534912109375 398.7089233398438 285.5325622558594 C 396.8116149902344 285.5325622558594 394.9189758300781 285.6238098144531 393.031005859375 285.8062744140625 C 391.4307861328125 285.960693359375 389.8341064453125 286.1782836914063 388.2514038085938 286.4590148925781 C 387.2618408203125 286.6344604492188 386.2792358398438 286.8380126953125 385.3001708984375 287.0625915527344 C 384.8685302734375 287.1643676757813 384.4333801269531 287.2696533203125 384.0017395019531 287.37841796875 C 383.794677734375 287.4345703125 383.5841369628906 287.4837036132813 383.3770751953125 287.5363464355469 C 382.6097412109375 287.8030395507813 381.9558715820313 287.4521179199219 381.4154357910156 286.4835815429688 C 381.8856811523438 285.9957885742188 381.1452026367188 285.2483215332031 380.6714782714844 285.7396240234375 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v3xjas =
    '<svg viewBox="85.7 91.7 25.2 21.2" ><path transform="translate(-284.38, -240.65)" d="M 386.8363647460938 333.1806335449219 C 381.7584838867188 332.984130859375 376.2735595703125 334.3562316894531 372.9292602539063 338.4444885253906 C 370.3113708496094 341.6413879394531 368.8199462890625 347.1263427734375 371.5922241210938 350.726806640625 C 374.5715637207031 354.5869750976563 381.1057739257813 353.9061889648438 385.046630859375 352.2603454589844 C 389.2156066894531 350.5057373046875 393.7776184082031 346.8876953125 395.0303955078125 342.3607788085938 C 396.592041015625 336.7073974609375 391.5211791992188 332.4331665039063 386.2398071289063 332.3699951171875 C 385.5625 332.3699951171875 385.5625 333.4227905273438 386.2398071289063 333.4227905273438 C 389.2507019042969 333.4578552246094 392.2055053710938 334.749267578125 393.6091918945313 337.5531311035156 C 395.0795288085938 340.5079345703125 393.8127136230469 343.6100769042969 391.8545532226563 345.9752807617188 C 388.71728515625 349.74072265625 383.8114013671875 352.5796813964844 378.8142395019531 352.4989624023438 C 375.8138427734375 352.4533386230469 372.4976196289063 351.4251403808594 371.5676879882813 348.2598266601563 C 370.8026733398438 345.694580078125 371.3851928710938 342.8906860351563 372.7186889648438 340.61669921875 C 375.6033020019531 335.7037658691406 381.4742431640625 334.0404052734375 386.857421875 334.2509460449219 C 387.5346984863281 334.2755126953125 387.5346984863281 333.2227478027344 386.857421875 333.1981811523438 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rozs25 =
    '<svg viewBox="95.6 96.8 4.6 6.6" ><path transform="translate(-302.59, -250.07)" d="M 399.9990234375 350.3973388671875 C 399.5589599609375 350.2342529296875 399.0660705566406 350.3080444335938 398.6930541992188 350.5927734375 C 398.3200378417969 350.8775329589844 398.118896484375 351.3335571289063 398.1601867675781 351.801025390625 C 398.2654418945313 353.1696166992188 399.7744445800781 353.5556335449219 400.9078979492188 353.4749145507813 C 401.8869934082031 353.3906860351563 403.031005859375 353.0292358398438 402.6871032714844 351.8045349121094 C 402.55908203125 351.3659057617188 402.2465209960938 351.0046691894531 401.8308410644531 350.8149108886719 C 401.5168151855469 350.6903076171875 401.1761779785156 350.6480407714844 400.8412475585938 350.6920776367188 C 400.7113952636719 350.6920776367188 399.5217590332031 351.1272277832031 400.027099609375 350.6043701171875 L 399.1989135742188 350.4955749511719 C 399.3850708007813 350.67919921875 399.47802734375 350.9372863769531 399.4515991210938 351.1974487304688 C 399.454833984375 351.3840026855469 399.5559692382813 351.5551452636719 399.7178344726563 351.64794921875 C 399.8797302246094 351.7407836914063 400.0784912109375 351.7415771484375 400.2411499023438 351.6501159667969 C 400.4867553710938 351.5473022460938 400.7693481445313 351.5923156738281 400.9708557128906 351.7662963867188 C 401.17236328125 351.9403076171875 401.258056640625 352.2133178710938 401.1921691894531 352.4712829589844 C 401.1337890625 352.7222290039063 401.264404296875 352.9788208007813 401.501708984375 353.0792846679688 C 401.7389526367188 353.1797485351563 402.0140991210938 353.0949401855469 402.1536865234375 352.8783569335938 C 402.5046081542969 352.2467041015625 402.9292297363281 350.9903869628906 402.40283203125 350.3306274414063 C 402.0519409179688 349.8849792480469 401.3746337890625 350.018310546875 400.9535217285156 350.2780151367188 C 400.693603515625 350.4619445800781 400.4515991210938 350.6698913574219 400.2306518554688 350.8991394042969 C 399.8060302734375 351.2746276855469 399.5287780761719 351.4500732421875 399.6867065429688 350.7306823730469 C 399.9498901367188 349.4217529296875 401.1991577148438 348.3794860839844 402.3396606445313 347.8566284179688 L 401.567626953125 347.2635498046875 C 401.1629028320313 348.7846069335938 400.439208984375 350.2021179199219 399.444580078125 351.4220275878906 L 400.3429260253906 351.7939758300781 C 400.2907104492188 350.8067626953125 400.8634338378906 349.8928833007813 401.774658203125 349.5094604492188 L 401.2588500976563 349.5094604492188 L 401.5325622558594 349.9586486816406 C 401.4307861328125 350.6218872070313 402.4449462890625 350.9061584472656 402.5467529296875 350.2359008789063 C 402.6800842285156 349.3691101074219 402.1326293945313 348.2426452636719 401.1184692382813 348.6672668457031 C 399.9077758789063 349.1725769042969 399.2796325683594 350.5587463378906 399.30419921875 351.7939758300781 C 399.30419921875 352.215087890625 399.9007568359375 352.5414428710938 400.2060546875 352.1694946289063 C 401.3220825195313 350.8136596679688 402.13671875 349.2357788085938 402.5958557128906 347.5408020019531 C 402.6456909179688 347.3352966308594 402.5694580078125 347.1197814941406 402.4014892578125 346.9913330078125 C 402.2335205078125 346.8629150390625 402.0055541992188 346.8457946777344 401.8203125 346.94775390625 C 400.7691040039063 347.4229125976563 399.8806762695313 348.1965942382813 399.2655944824219 349.1725769042969 C 398.8374633789063 349.8744506835938 398.300537109375 350.9692993164063 398.7357177734375 351.7764282226563 C 398.8797607421875 352.0372924804688 399.1221618652344 352.2296752929688 399.4089050292969 352.3107604980469 C 399.6956176757813 352.391845703125 400.0028686523438 352.3548583984375 400.26220703125 352.2080688476563 C 400.586669921875 352.0156860351563 400.883056640625 351.779541015625 401.1430358886719 351.5062255859375 C 401.2728881835938 351.3904418945313 401.416748046875 351.1903991699219 401.5887145996094 351.1553039550781 C 401.7431030273438 351.050048828125 401.736083984375 351.1096801757813 401.5641479492188 351.34130859375 C 401.5618286132813 351.7049560546875 401.4559326171875 352.0603942871094 401.2588500976563 352.3659973144531 L 402.2203674316406 352.7695617675781 C 402.3973388671875 352.1001892089844 402.1641845703125 351.3893432617188 401.6250610351563 350.9548645019531 C 401.0859680175781 350.5203857421875 400.341796875 350.443603515625 399.7253112792969 350.7587585449219 L 400.5184020996094 351.2149658203125 C 400.5349731445313 350.7683715820313 400.3947143554688 350.330078125 400.121826171875 349.9761962890625 C 400.0379638671875 349.8379516601563 399.8958740234375 349.7452392578125 399.735595703125 349.7240905761719 C 399.5752563476563 349.7029418945313 399.4140319824219 349.7556762695313 399.2971801757813 349.867431640625 C 398.7637939453125 350.4253845214844 398.6619873046875 351.3904418945313 399.332275390625 351.9062805175781 C 399.8341064453125 352.2887878417969 400.0797424316406 351.9062805175781 400.6306762695313 351.8185424804688 C 402.5010986328125 351.576416015625 401.4097290039063 352.4186401367188 400.75 352.4467163085938 C 400.4549865722656 352.4783325195313 400.1566772460938 352.4569396972656 399.8692016601563 352.383544921875 C 399.1369018554688 352.1355590820313 399.09130859375 351.8162231445313 399.7322998046875 351.425537109375 C 400.3604736328125 351.6817016601563 400.6306762695313 350.6640014648438 400.0130615234375 350.4113464355469 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6yu6yq =
    '<svg viewBox="91.3 101.6 6.4 9.1" ><path transform="translate(-294.75, -258.93)" d="M 391.3194580078125 361.1817016601563 C 391.7510986328125 362.5854187011719 389.9683837890625 363.0486450195313 389.1226501464844 363.5328979492188 C 388.5291748046875 363.8657531738281 388.0116577148438 364.3187255859375 387.6031494140625 364.8629150390625 C 386.7188415527344 366.0490417480469 386.3889770507813 367.5579833984375 386.0976867675781 368.979248046875 C 385.96435546875 369.6425170898438 386.978515625 369.9232177734375 387.1153564453125 369.2599792480469 C 387.2759399414063 368.2156372070313 387.574462890625 367.1972351074219 388.0032348632813 366.2315063476563 C 388.6348571777344 364.9752197265625 389.5402526855469 364.5541076660156 390.7193603515625 363.9083862304688 C 391.8984375 363.2626953125 392.751220703125 362.2625732421875 392.3336181640625 360.9010009765625 C 392.1370849609375 360.2552795410156 391.119384765625 360.5325317382813 391.3194274902344 361.1817016601563 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tkemxz =
    '<svg viewBox="92.7 101.5 7.4 9.3" ><path transform="translate(-297.3, -258.82)" d="M 395.619384765625 360.3699951171875 C 395.0990905761719 360.4419555664063 394.7190246582031 360.8980102539063 394.7420654296875 361.4227600097656 C 394.7420654296875 361.8403625488281 395.0193176269531 362.1070556640625 395.2088012695313 362.4404296875 C 395.6586303710938 363.1224975585938 396.0018005371094 363.8692016601563 396.2265014648438 364.65478515625 C 396.3949279785156 365.4092407226563 396.5598754882813 366.7603149414063 396.1668090820313 367.462158203125 C 395.4403991699219 368.7640686035156 394.1279296875 368.5149230957031 393.0084838867188 368.5149230957031 C 391.9557495117188 368.5149230957031 391.1416015625 368.8658447265625 391.1766967773438 367.3989868164063 C 391.19775390625 366.5743103027344 391.7732543945313 365.7391357421875 392.2294616699219 365.0899047851563 L 391.2679443359375 364.9635925292969 C 391.4707641601563 366.03515625 391.57763671875 367.1226196289063 391.5872802734375 368.213134765625 C 391.5872802734375 368.700927734375 392.334716796875 368.9711303710938 392.5663452148438 368.476318359375 C 393.1305236816406 367.28955078125 393.5782775878906 366.0508422851563 393.9033813476563 364.777587890625 L 392.8681335449219 364.6372375488281 L 393.0505981445313 367.3042602539063 C 393.0568542480469 367.5379638671875 393.2154846191406 367.7399597167969 393.4410400390625 367.8013916015625 C 393.6666259765625 367.8628540039063 393.9058227539063 367.7692260742188 394.0297241210938 367.5709533691406 C 394.152587890625 367.435302734375 394.24267578125 367.2732238769531 394.2929077148438 367.0972290039063 C 394.3280029296875 366.9322814941406 394.005126953125 365.81982421875 393.8753051757813 366.2163696289063 L 394.906982421875 366.3567504882813 L 394.980712890625 363.8230895996094 L 393.9279174804688 363.9634399414063 C 394.1504516601563 364.6779174804688 394.2174682617188 365.4317626953125 394.1244506835938 366.1742553710938 C 394.0577697753906 366.7603149414063 395.0438537597656 366.8936767578125 395.1772155761719 366.3146362304688 L 395.8369445800781 362.9106750488281 L 394.8754272460938 363.0335083007813 C 395.1038818359375 363.5043334960938 395.1669311523438 364.0383911132813 395.0543823242188 364.5494995117188 C 394.9771728515625 365.2232666015625 396.0299682617188 365.2162475585938 396.107177734375 364.5494995117188 C 396.1965942382813 363.8507080078125 396.0845947265625 363.1409301757813 395.7843017578125 362.5036010742188 C 395.67529296875 362.3240966796875 395.4705810546875 362.2258911132813 395.2623596191406 362.2532653808594 C 395.0541381835938 362.2806091308594 394.8817138671875 362.4283447265625 394.8227844238281 362.6299438476563 L 394.1595458984375 366.0339050292969 L 395.1947631835938 366.1742553710938 C 395.300048828125 365.3377380371094 395.2197875976563 364.4882507324219 394.9596557617188 363.6862182617188 C 394.8870239257813 363.4364624023438 394.6428527832031 363.2771606445313 394.3849792480469 363.3113708496094 C 394.1271362304688 363.3455810546875 393.9329223632813 363.5630187988281 393.9279174804688 363.8230895996094 L 393.854248046875 366.3567504882813 C 393.854248046875 366.9708862304688 394.7069702148438 367.05859375 394.8894653320313 366.4971313476563 L 394.9456176757813 366.3251953125 C 394.9950256347656 366.142822265625 394.9443359375 365.9479370117188 394.812255859375 365.8128051757813 C 393.7208862304688 364.626708984375 393.4998168945313 366.5146789550781 393.1207885742188 367.0375366210938 L 394.1033935546875 367.3042602539063 L 393.9208984375 364.6372375488281 C 393.88232421875 364.0687255859375 393.0401000976563 363.8932800292969 392.8856811523438 364.4968872070313 C 392.5890808105469 365.683837890625 392.177734375 366.839111328125 391.6574401855469 367.9464111328125 L 392.6400146484375 368.213134765625 C 392.6286926269531 367.0282592773438 392.5112609863281 365.8467712402344 392.2891235351563 364.682861328125 C 392.1978759765625 364.1985778808594 391.5626831054688 364.2196350097656 391.3275756835938 364.5565185546875 C 390.625732421875 365.5671997070313 389.4115600585938 367.7745056152344 390.3485107421875 368.9851684570313 C 391.1661376953125 370.0379638671875 393.7384033203125 369.630859375 394.8367919921875 369.564208984375 C 396.5703735351563 369.4659423828125 397.1985473632813 368.3675537109375 397.3880004882813 366.7322387695313 C 397.4783020019531 365.9491577148438 397.4343872070313 365.1564331054688 397.2581787109375 364.3880615234375 C 397.1634521484375 363.9739990234375 396.2054138183594 361.3490905761719 395.9176635742188 361.4017333984375 C 396.5844116210938 361.2789001464844 396.3001708984375 360.26123046875 395.6369018554688 360.384033203125 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_haudv6 =
    '<svg viewBox="93.2 102.5 6.4 8.0" ><path transform="translate(-298.19, -260.52)" d="M 394.4696350097656 364.428955078125 L 391.5955810546875 368.222412109375 L 392.5044555664063 368.7523193359375 L 394.6099853515625 365.706298828125 L 393.6484985351563 365.2992553710938 L 392.5992126464844 369.3032836914063 C 392.5408325195313 369.5542297363281 392.6714477539063 369.810791015625 392.9087524414063 369.9112548828125 C 393.14599609375 370.01171875 393.421142578125 369.9269104003906 393.5607299804688 369.7103271484375 C 394.0382080078125 368.919189453125 394.5742797851563 368.1649169921875 395.1644592285156 367.4539184570313 L 394.2871704101563 366.9415588378906 C 394.0515441894531 367.84814453125 393.5972900390625 368.6831359863281 392.9641723632813 369.3734741210938 L 393.8450012207031 369.8858032226563 C 393.89892578125 369.40087890625 394.0279541015625 368.9273376464844 394.2274780273438 368.4821166992188 C 394.4977111816406 367.875 393.6414489746094 367.3381042480469 393.318603515625 367.94873046875 C 393.0216979980469 368.5048828125 392.6826477050781 369.0374755859375 392.304443359375 369.5419006347656 L 393.2659606933594 369.668212890625 L 393.4800415039063 368.6680908203125 L 392.5184936523438 368.5417785644531 L 392.6729125976563 369.4190673828125 C 392.7244567871094 369.5986328125 392.8667602539063 369.73779296875 393.0474548339844 369.7853088378906 C 393.2281494140625 369.8328247070313 393.4205017089844 369.7816772460938 393.5537109375 369.6506958007813 C 394.4437561035156 368.7296142578125 395.1574096679688 367.6532287597656 395.6592407226563 366.474853515625 L 394.75390625 366.474853515625 C 394.9918823242188 366.9136657714844 395.1589050292969 367.387451171875 395.2486572265625 367.8785400390625 C 395.375 368.5101928710938 396.2137451171875 368.2750854492188 396.2803955078125 367.7381591796875 C 396.43115234375 366.5626831054688 396.5084838867188 365.3789367675781 396.5120239257813 364.19384765625 L 395.459228515625 364.19384765625 L 395.459228515625 366.4011535644531 C 395.459228515625 366.97314453125 396.3962097167969 367.1416015625 396.4944763183594 366.54150390625 C 396.56396484375 366.0091552734375 396.7393798828125 365.4960632324219 397.0103454589844 365.0325622558594 L 396.08740234375 365.0325317382813 C 396.309814453125 365.391357421875 396.4310913085938 365.8035888671875 396.4383239746094 366.2257080078125 C 396.4382934570313 366.5164184570313 396.6739807128906 366.7520751953125 396.9646911621094 366.7520751953125 C 397.2554321289063 366.7520751953125 397.4910888671875 366.5164184570313 397.4910888671875 366.2257080078125 L 397.6244506835938 365.5238342285156 L 396.6102600097656 365.5238342285156 C 396.7120361328125 366.1449584960938 397.0980529785156 369.6436767578125 395.7259521484375 369.2330932617188 C 395.4943237304688 369.1769409179688 395.4276733398438 369.1909790039063 395.5259094238281 369.2716979980469 L 395.8382568359375 368.6049499511719 L 396.5716552734375 367.0503540039063 L 395.5890808105469 366.7836303710938 C 395.6522521972656 367.5065612792969 395.7189331054688 368.5382690429688 395.2837829589844 369.1558837890625 C 394.932861328125 369.65771484375 393.8520202636719 369.8577270507813 393.3010864257813 369.56298828125 C 392.9373779296875 369.3036499023438 392.6264953613281 368.977294921875 392.3851928710938 368.6014404296875 L 391.665771484375 369.3032836914063 C 392.248291015625 369.7279052734375 393.1922912597656 370.7701416015625 393.9432678222656 370.829833984375 C 394.5152587890625 370.8754272460938 394.9960327148438 370.4016723632813 395.3715209960938 370.022705078125 C 396.5354614257813 368.8199157714844 397.1556396484375 367.1926879882813 397.0875244140625 365.5203552246094 C 397.0875549316406 365.2296142578125 396.8518676757813 364.9939575195313 396.5611572265625 364.9939575195313 C 396.2704467773438 364.9939575195313 396.0347900390625 365.2296142578125 396.0347900390625 365.5203552246094 L 396.0347900390625 366.7205200195313 C 396.0347900390625 367.01123046875 396.2704467773438 367.2468872070313 396.5611572265625 367.2468872070313 C 396.8518676757813 367.2468872070313 397.0875549316406 367.01123046875 397.0875549316406 366.7205200195313 L 397.0875244140625 363.7762451171875 C 397.0875549316406 363.4855346679688 396.8518676757813 363.2498779296875 396.5611572265625 363.2498779296875 C 396.2704467773438 363.2498779296875 396.0347900390625 363.4855346679688 396.0347900390625 363.7762451171875 C 396.0328369140625 364.4819641113281 395.9718017578125 365.186279296875 395.852294921875 365.8818054199219 L 396.8875122070313 366.0221557617188 C 396.8051147460938 365.1837158203125 396.7664489746094 364.3415222167969 396.771728515625 363.4990234375 C 396.7683715820313 363.2383728027344 396.57470703125 363.0194396972656 396.3163452148438 362.9842834472656 C 396.0580444335938 362.9491271972656 395.8129272460938 363.1083679199219 395.739990234375 363.3586730957031 C 395.5820922851563 364.0289306640625 395.3890991210938 364.6886596679688 395.2030944824219 365.3448791503906 L 396.1646118164063 365.2185668945313 L 396.0909423828125 364.9378051757813 C 396.0418090820313 364.267578125 394.989013671875 364.2640380859375 395.0381469726563 364.9378051757813 C 395.0497131347656 365.221923828125 395.1240234375 365.4999694824219 395.2557373046875 365.751953125 C 395.4592590332031 366.1801147460938 396.0944519042969 366.0292053222656 396.2172546386719 365.6256408691406 C 396.4172973632813 364.9659118652344 396.5962524414063 364.30615234375 396.7541809082031 363.639404296875 L 395.7189331054688 363.4990539550781 C 395.7136840820313 364.3415222167969 395.7523193359375 365.1837158203125 395.8347473144531 366.0221862792969 C 395.8873901367188 366.5626220703125 396.7576904296875 366.7942199707031 396.866455078125 366.1625366210938 C 397.0066528320313 365.3699645996094 397.08056640625 364.5670776367188 397.0875244140625 363.76220703125 L 396.0347900390625 363.7622375488281 L 396.0347900390625 366.7064819335938 L 397.0875244140625 366.7064819335938 L 397.0875244140625 365.50634765625 L 396.0347900390625 365.50634765625 C 396.0966796875 366.8301391601563 395.6367797851563 368.1254272460938 394.75390625 369.11376953125 C 394.6171264648438 369.2692260742188 394.4693603515625 369.4146728515625 394.3117065429688 369.5488891601563 C 394.0625610351563 369.7875366210938 393.83447265625 369.75244140625 393.6344299316406 369.4401245117188 C 393.1361083984375 369.2330932617188 392.6202697753906 368.6996765136719 392.1851196289063 368.3873596191406 C 391.75 368.0750122070313 391.1534118652344 368.6926574707031 391.4622192382813 369.1067504882813 C 392.2693481445313 370.1805725097656 393.4730224609375 371.377197265625 394.971435546875 370.8613586425781 C 396.547119140625 370.3034057617188 396.7611694335938 368.1697692871094 396.641845703125 366.7660827636719 C 396.603271484375 366.2993774414063 395.9049072265625 365.9835205078125 395.6627807617188 366.5028686523438 C 395.3118286132813 367.2433471679688 394.9609375 367.9802856445313 394.6099853515625 368.7242431640625 C 394.4871826171875 368.98388671875 394.2590942382813 369.3418579101563 394.294189453125 369.6506652832031 C 394.4099731445313 370.4402465820313 395.3679809570313 370.3104248046875 395.9575500488281 370.2647705078125 C 398.2420654296875 370.0928344726563 397.880615234375 366.8538208007813 397.617431640625 365.2255249023438 C 397.5296936035156 364.6851196289063 396.7436218261719 364.7693481445313 396.6032409667969 365.2255249023438 C 396.4917297363281 365.5460815429688 396.4336547851563 365.8827514648438 396.4312744140625 366.22216796875 L 397.4840698242188 366.22216796875 C 397.4459228515625 365.6187133789063 397.277099609375 365.0308227539063 396.9892578125 364.4990844726563 C 396.8934936523438 364.3394470214844 396.7210083007813 364.2417602539063 396.5348205566406 364.2417602539063 C 396.3486328125 364.2417602539063 396.1761474609375 364.3394470214844 396.0803833007813 364.4990844726563 C 395.7665710449219 365.0408325195313 395.5548706054688 365.6355590820313 395.4557495117188 366.2537231445313 L 396.5084838867188 366.3941040039063 L 396.5084838867188 364.186767578125 C 396.5085144042969 363.8960571289063 396.2728271484375 363.660400390625 395.9821166992188 363.660400390625 C 395.69140625 363.660400390625 395.4557495117188 363.8960571289063 395.4557495117188 364.186767578125 C 395.4522094726563 365.3718872070313 395.3748474121094 366.5556335449219 395.22412109375 367.7311401367188 L 396.2593383789063 367.5907592773438 C 396.1402587890625 367.0170288085938 395.9381103515625 366.4637756347656 395.6592712402344 365.9484252929688 C 395.5635375976563 365.7887573242188 395.3909912109375 365.6910400390625 395.204833984375 365.6910400390625 C 395.0186462402344 365.6910400390625 394.8461303710938 365.7887573242188 394.7503662109375 365.9484252929688 C 394.292724609375 367.0474853515625 393.6346740722656 368.0518188476563 392.8097534179688 368.9102172851563 L 393.6906127929688 369.141845703125 L 393.5361938476563 368.2645263671875 C 393.4554748535156 367.7977905273438 392.7957458496094 367.7837524414063 392.5746459960938 368.13818359375 C 392.2221374511719 368.6715698242188 392.1065063476563 369.3272094726563 392.2553100585938 369.948974609375 C 392.3430480957031 370.447265625 392.9747314453125 370.3946533203125 393.2168579101563 370.0753173828125 C 393.5950317382813 369.5720825195313 393.93408203125 369.0406494140625 394.2310180664063 368.485595703125 L 393.3221435546875 367.9522094726563 C 393.0794677734375 368.4765625 392.9139709472656 369.0332641601563 392.830810546875 369.6050415039063 C 392.7677001953125 370.0682983398438 393.3186340332031 370.5525512695313 393.711669921875 370.1174011230469 C 394.466064453125 369.2919311523438 395.0122985839844 368.298095703125 395.3048706054688 367.2187805175781 C 395.4346923828125 366.7415161132813 394.7749633789063 366.288818359375 394.4240417480469 366.7064208984375 C 393.7784423828125 367.4801025390625 393.19189453125 368.30126953125 392.66943359375 369.1629028320313 L 393.6309509277344 369.5699462890625 L 394.7012634277344 365.5799560546875 C 394.7595825195313 365.3290100097656 394.6289672851563 365.0724487304688 394.3917236328125 364.9720153808594 C 394.1544799804688 364.87158203125 393.8793334960938 364.9563598632813 393.73974609375 365.1729125976563 L 391.6341857910156 368.222412109375 C 391.2411499023438 368.7874145507813 392.1430358886719 369.2752075195313 392.5430908203125 368.7523193359375 L 395.4066162109375 364.9623413085938 C 395.8136901855469 364.4219360351563 394.9013061523438 363.9095764160156 394.4977416992188 364.428955078125 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2b5jkp =
    '<svg viewBox="140.3 79.5 51.2 37.1" ><path transform="translate(-385.25, -218.12)" d="M 526.30078125 334.69775390625 C 530.5118408203125 332.1219787597656 533.8596801757813 328.2793579101563 537.5794677734375 325.0648803710938 C 541.6151123046875 321.5802307128906 545.8507690429688 318.3341674804688 550.2127075195313 315.2601013183594 C 558.6840209960938 309.2944030761719 567.5799560546875 303.9568481445313 576.4688110351563 298.6333312988281 C 576.708251953125 298.4819030761719 576.784912109375 298.1680908203125 576.6422119140625 297.92333984375 C 576.49951171875 297.6785583496094 576.1886596679688 297.5906677246094 575.9389038085938 297.7244262695313 C 567.050048828125 303.0479736328125 558.150634765625 308.3749694824219 549.6793212890625 314.3511962890625 C 545.6823120117188 317.1585998535156 541.780029296875 320.1344299316406 538.0391845703125 323.292724609375 C 533.968505859375 326.7317810058594 530.3434448242188 331.0130615234375 525.7568359375 333.7888793945313 C 525.1778564453125 334.1397705078125 525.707763671875 335.0521850585938 526.2867431640625 334.69775390625 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lqyb1m =
    '<svg viewBox="190.7 64.2 22.0 22.1" ><path transform="translate(-478.58, -189.68)" d="M 683.39306640625 253.8444061279297 C 678.8310546875 254.3076324462891 673.9180908203125 255.4691772460938 671.1107177734375 259.4591674804688 C 668.6858520507813 262.8912048339844 668.738525390625 268.8779602050781 671.0159912109375 272.4012451171875 C 673.602294921875 276.4052734375 678.88720703125 276.5491638183594 682.9929809570313 275.2542724609375 C 687.0988159179688 273.9593505859375 691.3485107421875 271.6888732910156 691.3099365234375 266.782958984375 C 691.288818359375 264.1510314941406 690.3378295898438 261.4103393554688 689.28857421875 259.0240478515625 C 688.3831787109375 256.9641418457031 686.7794799804688 255.1638946533203 684.35107421875 255.3919982910156 C 683.6807861328125 255.4551544189453 683.673828125 256.5079345703125 684.35107421875 256.4447631835938 C 687.6041259765625 256.1429748535156 688.64990234375 260.0066528320313 689.4219360351563 262.445556640625 C 690.123779296875 264.7230529785156 690.77294921875 267.4181518554688 689.6710815429688 269.6815795898438 C 688.5692138671875 271.9450378417969 685.9127197265625 273.0995788574219 683.6422119140625 273.9277648925781 C 681.185791015625 274.8191223144531 678.4871826171875 275.363037109375 675.921875 274.629638671875 C 670.840576171875 273.2083740234375 669.4368286132813 266.7689208984375 670.9002075195313 262.1998901367188 C 672.5845947265625 256.9360656738281 678.55029296875 255.3884887695313 683.41064453125 254.8971862792969 C 684.077392578125 254.8305053710938 684.0844116210938 253.7777404785156 683.41064453125 253.8444213867188 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wqfeer =
    '<svg viewBox="197.7 104.9 22.0 22.1" ><path transform="translate(-491.56, -264.97)" d="M 703.39306640625 369.8443908691406 C 698.8310546875 370.3076171875 693.9180908203125 371.4691772460938 691.1107177734375 375.4591674804688 C 688.6858520507813 378.8912048339844 688.7384643554688 384.8779602050781 691.0159912109375 388.4012451171875 C 693.602294921875 392.4052734375 698.8871459960938 392.5491333007813 702.9929809570313 391.2542419433594 C 707.0987548828125 389.9593505859375 711.3484497070313 387.6888427734375 711.3098754882813 382.782958984375 C 711.288818359375 380.1510314941406 710.3377685546875 377.4103088378906 709.28857421875 375.0240478515625 C 708.3831787109375 372.964111328125 706.7794189453125 371.1638793945313 704.35107421875 371.3919677734375 C 703.6807861328125 371.4551391601563 703.6737670898438 372.5079345703125 704.35107421875 372.4447631835938 C 707.6041259765625 372.1429443359375 708.64990234375 376.0066223144531 709.421875 378.445556640625 C 710.123779296875 380.7230224609375 710.77294921875 383.4181518554688 709.6710205078125 385.6815795898438 C 708.5692138671875 387.9450378417969 705.9126586914063 389.0995788574219 703.6422119140625 389.9277648925781 C 701.1857299804688 390.819091796875 698.4871215820313 391.363037109375 695.921875 390.6296081542969 C 690.8405151367188 389.2083740234375 689.4368286132813 382.7689208984375 690.900146484375 378.1998901367188 C 692.5845947265625 372.93603515625 698.55029296875 371.3884887695313 703.4105834960938 370.8971557617188 C 704.077392578125 370.8305053710938 704.0843505859375 369.7777099609375 703.4105834960938 369.8444213867188 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_104502 =
    '<svg viewBox="197.8 56.5 14.7 21.9" ><path transform="translate(-491.68, -175.44)" d="M 689.6148071289063 249.8604125976563 L 692.9380493164063 253.650390625 C 693.0718383789063 253.7795104980469 693.2635498046875 253.8290557861328 693.4431762695313 253.7809143066406 C 693.622802734375 253.7327880859375 693.7640380859375 253.5940093994141 693.8153076171875 253.4152526855469 C 694.5172119140625 251.5693969726563 694.3838500976563 249.6568756103516 694.5487670898438 247.7162628173828 C 694.7305908203125 245.7105102539063 695.2341918945313 243.7471313476563 696.0401611328125 241.9014587402344 C 697.6592407226563 238.1578979492188 700.404296875 235.0117492675781 703.8938598632813 232.9002685546875 C 704.472900390625 232.5493469238281 703.9429931640625 231.6369476318359 703.3639526367188 231.9913940429688 C 699.9232177734375 234.0632934570313 697.1629638671875 237.0955505371094 695.422607421875 240.71533203125 C 694.5706787109375 242.4767761230469 693.9796142578125 244.3528137207031 693.66796875 246.2844848632813 C 693.3170776367188 248.5619964599609 693.6363525390625 250.9482727050781 692.794189453125 253.134521484375 L 693.6749877929688 252.8993988037109 L 690.3692626953125 249.116455078125 C 689.9201049804688 248.6076049804688 689.1796875 249.3550872802734 689.6253662109375 249.8604125976563 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g4yuyp =
    '<svg viewBox="142.2 119.1 55.3 1.6" ><path transform="translate(-388.91, -291.29)" d="M 531.6580200195313 411.9649658203125 C 549.7586669921875 411.412841796875 567.8639526367188 411.2958679199219 585.9739379882813 411.614013671875 C 586.6512451171875 411.614013671875 586.6512451171875 410.5612487792969 585.9739379882813 410.5612487792969 C 567.86865234375 410.2384033203125 549.7633056640625 410.3553771972656 531.6580200195313 410.9121704101563 C 530.980712890625 410.9332275390625 530.9771728515625 411.9860229492188 531.6580200195313 411.9649658203125 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_3zwxhb =
    '<svg viewBox="200.5 109.2 18.9 10.1" ><path transform="translate(-496.69, -273.06)" d="M 697.5390625 383.3620910644531 C 703.726806640625 385.7906494140625 709.6787719726563 388.7813110351563 715.3203735351563 392.296630859375 C 715.8958740234375 392.6475219726563 716.42578125 391.7456665039063 715.8502807617188 391.3876953125 C 710.1343994140625 387.8289794921875 704.103515625 384.8030090332031 697.8338623046875 382.347900390625 C 697.2057495117188 382.0987548828125 696.9320068359375 383.116455078125 697.556640625 383.3621215820313 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_1njqjj =
    '<svg viewBox="201.8 105.4 11.2 26.8" ><path transform="translate(-499.01, -265.87)" d="M 711.089599609375 371.3984375 C 704.81494140625 378.7131958007813 701.1802368164063 387.9242553710938 700.7689819335938 397.5527648925781 C 700.7409057617188 398.2300415039063 701.793701171875 398.2300415039063 701.82177734375 397.5527954101563 C 702.2203979492188 388.20068359375 705.745849609375 379.2529296875 711.8336181640625 372.1423950195313 C 712.272216796875 371.6300659179688 711.5318603515625 370.882568359375 711.0896606445313 371.3984375 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qk1w2g =
    '<svg viewBox="0.0 159.6 22.2 14.0" ><path transform="translate(-767.76, -590.75)" d="M 772.691650390625 757.750732421875 C 771.807373046875 758.3052368164063 770.796630859375 758.6175537109375 769.88427734375 759.1053466796875 C 768.971923828125 759.5931396484375 768.0840454101563 760.3265380859375 767.8243408203125 761.337158203125 C 767.7274169921875 761.65087890625 767.74365234375 761.9886474609375 767.8699951171875 762.2916870117188 C 768.0970458984375 762.65771484375 768.4444580078125 762.9331665039063 768.8525390625 763.07080078125 C 772.5986328125 764.7344970703125 776.8643798828125 764.7826538085938 780.6470947265625 763.2041015625 C 781.3057250976563 762.8875732421875 781.98583984375 762.6177978515625 782.6824951171875 762.39697265625 C 783.5406494140625 762.2219848632813 784.4140625 762.1326293945313 785.289794921875 762.1302490234375 C 786.2103271484375 762.0764770507813 787.1260986328125 761.959228515625 788.030517578125 761.7793579101563 C 788.485107421875 761.728759765625 788.916015625 761.5498046875 789.2727661132813 761.2634887695313 C 789.5982666015625 760.888427734375 789.7940063476563 760.418212890625 789.830810546875 759.9229736328125 C 790.24609375 757.18896484375 789.619873046875 754.398681640625 788.076171875 752.1043701171875 C 787.8817138671875 751.7828369140625 787.620849609375 751.5064697265625 787.3111572265625 751.293701171875 C 786.9334716796875 751.0985107421875 786.51806640625 750.9871826171875 786.0934448242188 750.9674072265625 C 784.3388061523438 750.7532958984375 782.5 750.3602905273438 780.727783203125 750.3181762695313 C 779.45751953125 750.2901000976563 778.8187866210938 750.8936767578125 777.92041015625 751.7675170898438 C 776.0640258789063 753.6239013671875 774.979736328125 756.322509765625 772.691650390625 757.750732421875 Z" fill="#323444" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_71t23o =
    '<svg viewBox="30.6 159.4 11.7 15.1" ><path transform="translate(-824.33, -590.44)" d="M 855.11767578125 757.1813354492188 C 855.11767578125 758.90087890625 855.32470703125 760.72216796875 856.366943359375 762.09423828125 C 856.8436279296875 762.6875610351563 857.4208984375 763.1923828125 858.0724487304688 763.585693359375 C 860.2762451171875 764.9893798828125 863.1959228515625 765.5052490234375 865.51904296875 764.3156127929688 C 865.894287109375 764.147216796875 866.2151489257813 763.8773803710938 866.4454345703125 763.53662109375 C 866.79638671875 762.9259643554688 866.6104125976563 762.1644897460938 866.4138793945313 761.49072265625 L 863.052001953125 749.8400268554688 C 860.8798217773438 750.1734008789063 857.6864013671875 750.4085083007813 855.75634765625 751.5104370117188 C 854.356201171875 752.3070068359375 855.11767578125 755.644287109375 855.11767578125 757.1813354492188 Z" fill="#323444" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hgw22a =
    '<svg viewBox="1.2 91.8 7.0 11.1" ><path transform="translate(-770.05, -465.47)" d="M 773.010986328125 560.4728393554688 C 772.8074340820313 561.1150512695313 772.0704956054688 561.413330078125 771.6669311523438 561.9537353515625 C 771.1932373046875 562.5888671875 771.2423095703125 563.4697265625 771.414306640625 564.2417602539063 C 771.626708984375 565.3801879882813 772.161376953125 566.4337158203125 772.954833984375 567.2772216796875 C 773.7719116210938 568.1250610351563 774.9486083984375 568.525146484375 776.1131591796875 568.35107421875 C 777.2431030273438 568.1370239257813 778.2186889648438 567.1368408203125 778.25732421875 565.9893798828125 C 778.2369384765625 565.4674682617188 778.125244140625 564.9532470703125 777.9274291992188 564.4698486328125 L 775.5341186523438 557.5496826171875 C 775.514404296875 557.45068359375 775.4530029296875 557.3650512695313 775.36572265625 557.3145141601563 C 775.275390625 557.29443359375 775.1807861328125 557.3108520507813 775.1024780273438 557.3601684570313 C 774.5374755859375 557.6268310546875 773.404052734375 557.9075927734375 773.0741577148438 558.49365234375 C 772.7442626953125 559.0796508789063 773.2496337890625 559.837646484375 773.010986328125 560.4728393554688 Z" fill="#fbb3b2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xaocid =
    '<svg viewBox="1.8 88.9 5.6 5.7" ><path transform="translate(-771.16, -460.09)" d="M 773 554.73876953125 C 773.873779296875 554.6018676757813 774.6387939453125 554.0895385742188 775.4564208984375 553.752685546875 C 776.2741088867188 553.415771484375 777.298828125 553.285888671875 777.9866333007813 553.847412109375 C 778.18310546875 554.0088500976563 778.3726196289063 554.2299194335938 778.6287841796875 554.2264404296875 C 778.2803955078125 552.510498046875 777.75341796875 550.8356323242188 777.0567016601563 549.229248046875 C 777.0322265625 549.15234375 776.984375 549.0848388671875 776.9197998046875 549.0362548828125 C 776.82421875 548.9974365234375 776.7171630859375 548.9974365234375 776.62158203125 549.0362548828125 L 774.2598266601563 549.6538696289063 C 773.3860473632813 549.8820190429688 773.2843017578125 549.8118286132813 773.3509521484375 550.6715698242188 C 773.3684692382813 551.0540771484375 773.56494140625 554.73876953125 773 554.73876953125 Z" fill="#106433" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mofm1f =
    '<svg viewBox="0.2 44.5 10.8 46.7" ><path transform="translate(-768.07, -378.0)" d="M 769.649169921875 422.6832275390625 C 769.2982788085938 423.2236328125 769.2982788085938 423.8973999023438 769.2982788085938 424.5325927734375 C 769.2982788085938 427.6382446289063 769.329833984375 430.761474609375 769.78955078125 433.8355712890625 C 769.8983154296875 434.572509765625 770.0352172851563 435.3094482421875 770.1054077148438 436.0534057617188 C 770.1849365234375 437.0889892578125 770.2013549804688 438.1284790039063 770.154541015625 439.1660766601563 L 769.8035888671875 452.6766357421875 C 769.761474609375 454.3294982910156 769.67724609375 456.1051635742188 768.6561279296875 457.4035949707031 C 768.346435546875 457.8388671875 768.2009887695313 458.3697204589844 768.2454833984375 458.9020385742188 C 768.51220703125 462.2919311523438 769.07373046875 465.65380859375 769.6316528320313 469.005126953125 C 771.4539794921875 468.1831665039063 773.5597534179688 468.2836303710938 775.2955932617188 469.2753601074219 C 777.0661010742188 463.7081909179688 778.04541015625 457.9197998046875 778.2047119140625 452.080078125 C 778.285400390625 449.2060241699219 778.16259765625 446.3143920898438 778.6047973632813 443.4754638671875 C 779.34521484375 438.6958618164063 779.04345703125 433.79345703125 778.49951171875 428.9858093261719 C 778.3275756835938 427.4627990722656 777.9625854492188 425.8941650390625 776.987060546875 424.715087890625 C 776.0635375976563 423.6833801269531 774.8336181640625 422.9749450683594 773.477783203125 422.6937255859375 C 772.1793212890625 422.3533325195313 771.017822265625 422.7042846679688 769.649169921875 422.6832275390625 Z" fill="#106433" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fm1idl =
    '<svg viewBox="4.7 79.1 39.2 84.3" ><path transform="translate(-776.49, -441.99)" d="M 782.3577880859375 525.8477783203125 C 780.004150390625 537.9088134765625 781.2891845703125 550.397216796875 786.0494384765625 561.7262573242188 C 786.460693359375 562.5648803710938 786.7490844726563 563.4583740234375 786.9057006835938 564.3792114257813 C 787.0987548828125 566.0987548828125 786.3056640625 567.7515869140625 785.8529663085938 569.4149169921875 C 784.8001708984375 573.1978759765625 785.4072875976563 577.2265014648438 786.0810546875 581.09716796875 C 786.36181640625 582.71142578125 786.6507568359375 584.3245239257813 786.9478759765625 585.9364013671875 C 787.2391357421875 587.508544921875 787.5198364257813 589.217529296875 786.7899169921875 590.6422729492188 C 787.4180908203125 593.2601928710938 787.7900390625 595.853515625 788.418212890625 598.4713745117188 C 788.4848022460938 598.678466796875 788.505126953125 598.897705078125 788.4778442382813 599.1135864257813 C 788.351318359375 599.4561767578125 788.1282348632813 599.7547607421875 787.835693359375 599.9733276367188 C 786.8831176757813 600.9390869140625 786.5109252929688 602.3358154296875 786.8565673828125 603.6475219726563 C 788.4603271484375 602.4964599609375 790.6956787109375 602.9000244140625 792.5274658203125 603.6475219726563 C 794.3593139648438 604.39501953125 796.1630859375 605.402099609375 798.1422729492188 605.402099609375 C 797.8544921875 603.0789794921875 797.5772705078125 600.64013671875 798.43359375 598.4608154296875 C 798.931884765625 597.197509765625 799.8092041015625 596.00439453125 799.7846069335938 594.6533203125 C 799.760009765625 593.442626953125 799.0195922851563 592.36181640625 798.840576171875 591.1651611328125 C 798.7740478515625 590.420654296875 798.8023681640625 589.670654296875 798.9248046875 588.9332885742188 C 799.3950805664063 584.6380004882813 798.8616943359375 580.3005981445313 798.3282470703125 576.0122680664063 C 798.2679443359375 575.1666259765625 798.0687866210938 574.3367309570313 797.7387084960938 573.5558471679688 C 797.4895629882813 573.0504760742188 797.1175537109375 572.5662231445313 797.1246337890625 572.001220703125 C 797.1246337890625 571.344970703125 797.6544799804688 570.8115844726563 797.8510131835938 570.1869506835938 C 798.201904296875 569.035888671875 797.5562133789063 567.4708251953125 798.5283203125 566.7584228515625 C 801.0900268554688 564.8775024414063 800.107421875 560.3856811523438 800.05126953125 557.2097778320313 C 800.0068359375 554.47021484375 799.889892578125 551.7330322265625 799.7003784179688 548.9981689453125 C 801.313232421875 553.5333862304688 801.9727172851563 558.3526611328125 801.637451171875 563.1544189453125 C 801.525146484375 564.7265625 801.318115234375 566.37939453125 801.9322509765625 567.832275390625 C 802.4025268554688 568.9481811523438 803.3359375 569.8676147460938 803.588623046875 571.0502319335938 C 803.74658203125 571.7801513671875 803.63427734375 572.5346069335938 803.6693115234375 573.278564453125 C 803.7044067382813 574.0225219726563 803.9570922851563 574.8331298828125 804.5992431640625 575.2086181640625 C 804.6484375 578.591552734375 804.9501953125 582.2095947265625 805.0028686523438 585.5924682617188 C 804.9686889648438 587.3218383789063 805.1097412109375 589.0501708984375 805.4239501953125 590.7510986328125 C 805.5814208984375 591.2921142578125 805.668701171875 591.8511352539063 805.68359375 592.4144287109375 C 805.6044921875 593.1207275390625 805.41748046875 593.8107299804688 805.129150390625 594.4603271484375 C 803.887451171875 598.1370849609375 804.5443115234375 602.1900024414063 806.8837890625 605.2863159179688 C 807.7119750976563 603.81591796875 809.4385375976563 603.036865234375 811.1229248046875 602.9140625 C 812.807373046875 602.791259765625 814.4707641601563 603.2158203125 816.1025390625 603.6439819335938 C 815.8530883789063 601.5936279296875 816.260986328125 599.5169677734375 817.2676391601563 597.71337890625 C 817.5374755859375 597.3069458007813 817.7445068359375 596.8621215820313 817.8817138671875 596.3939208984375 C 818.0712280273438 595.5025634765625 817.6290893554688 594.61474609375 817.3904418945313 593.73388671875 C 817.0009155273438 592.3302001953125 817.1378173828125 590.8177490234375 817.22900390625 589.350830078125 C 817.5352172851563 584.4381713867188 817.317626953125 579.5068359375 816.579833984375 574.6401977539063 C 816.4658813476563 573.681640625 816.240966796875 572.739501953125 815.9095458984375 571.8328247070313 C 815.783203125 571.510009765625 815.6287841796875 571.201171875 815.5235595703125 570.8748168945313 C 815.35791015625 570.2893676757813 815.263671875 569.6860961914063 815.2427978515625 569.0780639648438 L 814.8392333984375 563.4633178710938 C 814.5549926757813 559.5294189453125 815.846435546875 555.6447143554688 816.748291015625 551.8056640625 C 817.15185546875 550.0861206054688 817.5904541015625 548.3701171875 817.8607177734375 546.6224975585938 C 818.2291259765625 544.2432250976563 818.288818359375 541.811279296875 818.8292236328125 539.463623046875 C 819.3135375976563 537.3580932617188 820.1873168945313 535.30517578125 820.3698120117188 533.1470336914063 C 820.6505126953125 529.802734375 819.2608642578125 526.5706787109375 817.913330078125 523.503662109375 C 817.3518676757813 522.2403564453125 815.228759765625 522.3666381835938 813.8636474609375 522.14208984375 C 804.1817016601563 520.5523681640625 793.98388671875 520.5418701171875 784.8528442382813 524.124755859375 C 783.9085693359375 524.5159912109375 783.05810546875 525.1033325195313 782.3577880859375 525.8478393554688 Z" fill="#2b2833" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tm51hv =
    '<svg viewBox="11.4 18.7 18.2 16.7" ><path transform="translate(-788.88, -330.17)" d="M 801.728271484375 351.7451171875 L 802.8020629882813 355.9211120605469 C 803.093994140625 356.8788452148438 803.2557373046875 357.8715209960938 803.2828369140625 358.8723754882813 C 803.2939453125 359.2374572753906 803.2130737304688 359.5994567871094 803.0477294921875 359.9251403808594 C 802.8709716796875 360.1925659179688 802.6446533203125 360.4236755371094 802.3809814453125 360.60595703125 C 801.6475219726563 361.1639099121094 801.138671875 362.4658203125 800.2999877929688 362.8518676757813 C 800.7316284179688 363.6028442382813 801.3281860351563 363.1150512695313 802.1072387695313 363.4905395507813 C 803.4793701171875 364.1572875976563 804.7356567382813 365.1152954101563 806.2235717773438 365.4451904296875 C 807.6272583007813 365.7539672851563 809.1011962890625 365.4627075195313 810.4943237304688 365.09423828125 C 812.469970703125 364.5573425292969 814.4351806640625 363.81689453125 816.02490234375 362.52197265625 C 817.6145629882813 361.2271118164063 818.5198974609375 360.0830688476563 818.512939453125 358.0371704101563 C 816.75830078125 358.2442321777344 815.1966552734375 356.4720764160156 814.421142578125 354.8788757324219 C 814.1522827148438 354.2732543945313 813.9544677734375 353.6385192871094 813.8316040039063 352.9873962402344 L 812.89111328125 348.8500061035156 C 811.866455078125 349.0745849609375 811.03125 349.8080444335938 810.0521240234375 350.1905212402344 C 809.0731201171875 350.5730285644531 807.9150390625 350.6081237792969 806.8271484375 350.6572570800781 C 804.8961181640625 350.7450866699219 802.9757080078125 350.9939270019531 801.0860595703125 351.4012145996094 C 800.826416015625 351.453857421875 800.5 351.6187744140625 800.563232421875 351.8714599609375" fill="#fbb3b2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_42mni3 =
    '<svg viewBox="11.4 18.7 18.2 16.7" ><path transform="translate(-788.88, -330.17)" d="M 801.728271484375 351.7451171875 L 802.8020629882813 355.9211120605469 C 803.093994140625 356.8788452148438 803.2557373046875 357.8715209960938 803.2828369140625 358.8723754882813 C 803.2939453125 359.2374572753906 803.2130737304688 359.5994567871094 803.0477294921875 359.9251403808594 C 802.8709716796875 360.1925659179688 802.6446533203125 360.4236755371094 802.3809814453125 360.60595703125 C 801.6475219726563 361.1639099121094 801.138671875 362.4658203125 800.2999877929688 362.8518676757813 C 800.7316284179688 363.6028442382813 801.3281860351563 363.1150512695313 802.1072387695313 363.4905395507813 C 803.4793701171875 364.1572875976563 804.7356567382813 365.1152954101563 806.2235717773438 365.4451904296875 C 807.6272583007813 365.7539672851563 809.1011962890625 365.4627075195313 810.4943237304688 365.09423828125 C 812.469970703125 364.5573425292969 814.4351806640625 363.81689453125 816.02490234375 362.52197265625 C 817.6145629882813 361.2271118164063 818.5198974609375 360.0830688476563 818.512939453125 358.0371704101563 C 816.75830078125 358.2442321777344 815.1966552734375 356.4720764160156 814.421142578125 354.8788757324219 C 814.1522827148438 354.2732543945313 813.9544677734375 353.6385192871094 813.8316040039063 352.9873962402344 L 812.89111328125 348.8500061035156 C 811.866455078125 349.0745849609375 811.03125 349.8080444335938 810.0521240234375 350.1905212402344 C 809.0731201171875 350.5730285644531 807.9150390625 350.6081237792969 806.8271484375 350.6572570800781 C 804.8961181640625 350.7450866699219 802.9757080078125 350.9939270019531 801.0860595703125 351.4012145996094 C 800.826416015625 351.453857421875 800.5 351.6187744140625 800.563232421875 351.8714599609375" fill="#000000" fill-opacity="0.1" stroke="none" stroke-width="1" stroke-opacity="0.1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7bosix =
    '<svg viewBox="9.2 23.3 19.5 14.0" ><path transform="translate(-784.82, -338.73)" d="M 804.8409423828125 368.6273498535156 C 805.337890625 367.5541076660156 806.0552978515625 366.5975646972656 806.946533203125 365.8199768066406 C 808.25537109375 364.6724548339844 810.0451049804688 363.7424926757813 810.3538818359375 362.0299987792969 L 813.1893920898438 365.3321838378906 C 813.343505859375 365.4852905273438 813.463134765625 365.6695556640625 813.540283203125 365.8726196289063 C 813.6126708984375 366.2578125 813.5154418945313 366.655517578125 813.2736206054688 366.9639892578125 C 812.57177734375 368.0834350585938 811.46630859375 368.883544921875 810.4205932617188 369.6941528320313 C 808.023681640625 371.5927734375 805.7289428710938 373.616943359375 803.5460205078125 375.7581176757813 C 803.4498291015625 375.8698120117188 803.3209228515625 375.9483947753906 803.1775512695313 375.9827270507813 C 803.0418701171875 375.9864501953125 802.908447265625 375.948486328125 802.7950439453125 375.8739318847656 C 800.91162109375 374.885009765625 799.2448120117188 373.5296325683594 797.8926391601563 371.887451171875 C 797.7908935546875 371.7645874023438 797.66455078125 371.6242370605469 797.4996337890625 371.634765625 C 797.400146484375 371.6530151367188 797.3084716796875 371.70068359375 797.2363891601563 371.7716674804688 C 796.2924194335938 372.5436706542969 795.2607421875 373.4665832519531 794.050048828125 373.3472900390625 C 795.61865234375 372.2208251953125 796.5064697265625 370.33984375 796.8363037109375 368.434326171875 C 796.9015502929688 367.7821655273438 797.03564453125 367.1387329101563 797.2363891601563 366.5148010253906 C 797.4476318359375 365.880859375 797.9608764648438 365.3939208984375 798.6050415039063 365.2163696289063 C 797.8399658203125 366.3849487304688 798.3629150390625 368.0413208007813 799.39111328125 368.9852905273438 C 800.3900756835938 369.833251953125 801.5877685546875 370.4140014648438 802.8721923828125 370.6732177734375 C 804.0654296875 370.8978271484375 804.4163208007813 369.5467834472656 804.8409423828125 368.6273498535156 Z" fill="#106433" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nia39b =
    '<svg viewBox="3.6 78.0 27.7 8.9" ><path transform="translate(-774.34, -439.96)" d="M 782.2698974609375 524.7763671875 C 783.5928955078125 525.1026611328125 784.845703125 525.6571655273438 786.1300659179688 526.0677490234375 C 788.470947265625 526.80078125 790.9345092773438 527.0596923828125 793.3766479492188 526.8292236328125 C 794.1282958984375 526.812744140625 794.8593139648438 526.5800170898438 795.482177734375 526.158935546875 C 795.6470947265625 526.025634765625 795.7980346679688 525.86767578125 795.9735107421875 525.744873046875 C 796.2669677734375 525.5687866210938 796.5851440429688 525.4375 796.91748046875 525.3554077148438 C 800.1354370117188 524.3482055664063 802.8305053710938 522.176025390625 805.4449462890625 520.0494384765625 C 805.5291137695313 519.979248046875 805.6239013671875 519.8914794921875 805.6168212890625 519.7791748046875 C 805.604736328125 519.7027587890625 805.5677490234375 519.6324462890625 805.5115966796875 519.5791625976563 L 804.135986328125 518 C 800.5284423828125 518.6141357421875 796.833251953125 518.3825073242188 793.173095703125 518.291259765625 C 792.421630859375 518.2578735351563 791.6688232421875 518.27783203125 790.920166015625 518.3508911132813 C 790.197265625 518.4351806640625 789.48486328125 518.61767578125 788.7725219726563 518.7720336914063 C 786.06689453125 519.361572265625 783.3016357421875 519.586181640625 780.5609130859375 519.97216796875 C 780.369140625 519.986328125 780.1831665039063 520.0439453125 780.0169677734375 520.140625 C 779.9014282226563 520.22998046875 779.8027954101563 520.33935546875 779.7257080078125 520.4635009765625 L 778.76416015625 521.8145141601563 C 778.3909912109375 522.2689819335938 778.1161499023438 522.7959594726563 777.95703125 523.362060546875 C 777.732421875 524.4148559570313 778.2027587890625 524.7657470703125 779.0975341796875 524.62890625 C 780.1546630859375 524.4741821289063 781.231689453125 524.5242309570313 782.2698974609375 524.7763671875 Z" fill="#106433" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r5aqts =
    '<svg viewBox="1.1 26.6 46.5 55.7" ><path transform="translate(-769.74, -344.89)" d="M 788.4212646484375 380.3148803710938 C 787.3477172851563 379.21484375 786.1307373046875 378.2646179199219 784.80322265625 377.4899291992188 C 784.2669067382813 377.1492919921875 783.6719360351563 376.9112854003906 783.048583984375 376.7880859375 C 782.413818359375 376.6627807617188 781.7560424804688 376.8246459960938 781.2518310546875 377.230224609375 C 780.9395751953125 377.5075073242188 780.7430419921875 377.8934936523438 780.4412841796875 378.1847534179688 C 780.0614624023438 378.5038452148438 779.6260986328125 378.7501220703125 779.1568603515625 378.9111938476563 C 777.5594482421875 379.59375 776.0452880859375 380.456787109375 774.64404296875 381.4834594726563 C 773.880126953125 382.0177917480469 773.1919555664063 382.65283203125 772.59814453125 383.3713989257813 C 771.0084228515625 385.4067687988281 770.769775390625 388.1755676269531 770.8118896484375 390.7583618164063 C 770.843505859375 392.5550842285156 772.5665283203125 393.8886108398438 773.752685546875 395.2326049804688 C 774.8651123046875 396.5552368164063 775.871826171875 397.9632568359375 776.7635498046875 399.4437255859375 C 777.4022827148438 400.4543762207031 778.0689697265625 401.5492553710938 777.98828125 402.7529296875 C 777.921630859375 403.739013671875 777.3460693359375 404.6654663085938 777.4373779296875 405.6480102539063 C 777.4689331054688 405.9989624023438 777.5812377929688 406.3218078613281 777.61279296875 406.6622009277344 C 777.676025390625 407.3640747070313 777.3988037109375 408.06591796875 777.32861328125 408.7677612304688 C 777.2338256835938 409.7608642578125 777.556640625 410.7469482421875 777.57421875 411.7470703125 C 777.5613403320313 412.4317626953125 777.4742431640625 413.113037109375 777.3145751953125 413.7789306640625 C 776.6407470703125 416.9863891601563 775.7950439453125 420.2113647460938 775.9669799804688 423.4854736328125 L 774.0228881835938 423.8363952636719 C 774.3963623046875 424.2024536132813 774.5732421875 424.7244873046875 774.4990234375 425.2421875 C 774.4249267578125 425.7598876953125 774.108642578125 426.2113037109375 773.6473388671875 426.4577941894531 C 776.682861328125 427.4719848632813 779.9639892578125 426.9595947265625 783.1820068359375 426.9561157226563 C 785.845458984375 426.9561157226563 788.4984741210938 427.3070068359375 791.158447265625 427.2578735351563 C 793.8184814453125 427.208740234375 796.5626831054688 426.7279663085938 798.7559814453125 425.2225341796875 C 799.3525390625 424.8154907226563 799.8999633789063 424.3381958007813 800.528076171875 423.9837646484375 C 801.3695068359375 423.5477600097656 802.2762451171875 423.25146484375 803.212646484375 423.1064758300781 C 804.9473876953125 422.775634765625 806.710693359375 422.6181030273438 808.4765625 422.6361999511719 C 809.33984375 422.6361999511719 810.2802734375 422.6712951660156 810.9680786132813 422.1519165039063 C 811.72607421875 421.576416015625 811.9190673828125 420.5341796875 812.0208740234375 419.5902099609375 C 812.1226196289063 418.5935668945313 812.185791015625 417.5934448242188 812.203369140625 416.5933227539063 C 812.2327880859375 415.8144836425781 812.191650390625 415.0345764160156 812.0805053710938 414.2631530761719 C 811.9751586914063 413.6990966796875 811.838134765625 413.1414184570313 811.669921875 412.5927734375 L 810.346923828125 407.9324951171875 C 809.799560546875 406.0094604492188 810.56103515625 403.900390625 810.7224731445313 401.9071655273438 C 810.7610473632813 401.4368896484375 810.76806640625 400.8894653320313 810.4066162109375 400.587646484375 C 810.2767944335938 400.4788818359375 810.0977783203125 400.4052124023438 810.0556640625 400.2367553710938 C 810.0174560546875 400.0751037597656 810.0479736328125 399.9048461914063 810.139892578125 399.7665100097656 C 810.841796875 398.36279296875 811.89453125 397.1240539550781 812.8560791015625 395.8572387695313 C 814.4710083007813 393.6350708007813 815.9702758789063 391.3311157226563 817.347900390625 388.9545288085938 C 816.91650390625 383.9814147949219 814.8223266601563 379.2986145019531 811.4031982421875 375.6615600585938 C 810.701416015625 374.9000549316406 809.8977661132813 374.1701354980469 808.9151611328125 373.8262329101563 C 808.2730712890625 373.630126953125 807.607177734375 373.522705078125 806.9359741210938 373.5068969726563 C 804.1846923828125 373.3208923339844 801.3211669921875 373.1559448242188 798.9243774414063 371.7733154296875 C 798.7523193359375 371.6541748046875 798.5576171875 371.57177734375 798.3523559570313 371.5311889648438 C 797.822509765625 371.4715270996094 797.4364624023438 371.9944152832031 797.092529296875 372.4085083007813 C 796.2081909179688 373.4612731933594 794.90625 374.0648498535156 793.7622680664063 374.8403930664063 C 791.628662109375 376.289794921875 789.9617919921875 378.2830200195313 788.4212646484375 380.3148803710938 Z" fill="#106c36" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2ji3ha =
    '<svg viewBox="34.2 41.5 16.8 38.0" ><path transform="translate(-830.95, -372.38)" d="M 878.7958984375 417.8805541992188 C 879.3433837890625 419.6141052246094 879.290771484375 421.4669799804688 879.4697265625 423.2742309570313 C 879.5757446289063 424.3648681640625 879.7669677734375 425.4454956054688 880.041748046875 426.5062255859375 C 880.167236328125 427.0892639160156 880.392822265625 427.6461181640625 880.70849609375 428.1520385742188 C 881.0242919921875 428.6152954101563 881.4769897460938 428.9907836914063 881.677001953125 429.5136413574219 C 881.786376953125 429.8678894042969 881.8349609375 430.2380676269531 881.8209228515625 430.6085205078125 L 881.863037109375 433.0299072265625 C 881.9530639648438 434.3130493164063 881.7576904296875 435.6001892089844 881.291015625 436.7987976074219 L 879.778564453125 441.3994140625 C 878.9608764648438 443.8909912109375 878.1221923828125 446.421142578125 876.6483154296875 448.58984375 C 876.440673828125 448.9568786621094 876.1260375976563 449.2518920898438 875.7464599609375 449.435546875 C 875.44921875 449.5140991210938 875.14453125 449.5611572265625 874.8375244140625 449.575927734375 C 873.73388671875 449.7727661132813 872.925537109375 450.7254638671875 872.9109497070313 451.8463745117188 C 872.559814453125 451.333251953125 872.1215209960938 450.885498046875 871.6160278320313 450.5234069824219 L 868.5384521484375 448.0669555664063 C 867.4856567382813 447.210693359375 866.3872680664063 446.3403930664063 865.10986328125 445.8456115722656 C 868.6199951171875 444.7494506835938 871.1539306640625 441.6871948242188 871.5739135742188 438.0340576171875 C 871.57275390625 437.501708984375 871.6928100585938 436.9761047363281 871.9248657226563 436.4970092773438 C 872.1810302734375 436.0829162597656 872.65478515625 435.76708984375 872.6898193359375 435.279296875 C 872.73193359375 434.6651611328125 872.037109375 434.2019653320313 872.037109375 433.5878295898438 C 872.037109375 433.1807861328125 872.3389282226563 432.8438720703125 872.4722900390625 432.4613647460938 C 872.596923828125 431.9887084960938 872.596923828125 431.4917602539063 872.4722900390625 431.0191040039063 L 872.0477294921875 428.660888671875 C 872.0226440429688 428.4246215820313 871.9511108398438 428.1956176757813 871.837158203125 427.9871215820313 C 871.6782836914063 427.7872314453125 871.5020751953125 427.6017150878906 871.3107299804688 427.4326782226563 C 870.580810546875 426.6150207519531 870.9036865234375 425.3271484375 871.310791015625 424.3200073242188 C 872.24560546875 422.0844116210938 873.449951171875 419.9714050292969 874.897216796875 418.0279235839844 C 875.412353515625 417.3753051757813 875.8892822265625 416.693359375 876.325439453125 415.9855346679688 C 876.6973876953125 415.33984375 876.7816162109375 414.4450073242188 877.1746826171875 413.8800048828125 C 877.6800537109375 415.2064819335938 878.3643188476563 416.5154418945313 878.7958984375 417.8805541992188 Z" fill="#106c36" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xvz6p3 =
    '<svg viewBox="32.1 73.3 9.6 9.0" ><path transform="translate(-827.07, -431.18)" d="M 861.11962890625 504.7852172851563 C 860.9630126953125 504.9014892578125 860.82763671875 505.0439453125 860.7196044921875 505.2063293457031 C 860.30615234375 505.7254028320313 859.75537109375 506.1181030273438 859.1298828125 506.33984375 C 859.4808349609375 506.5924682617188 859.8001708984375 506.8416442871094 860.1300048828125 507.0978393554688 C 862.5706787109375 508.9827270507813 864.8056030273438 511.1199951171875 866.797607421875 513.47412109375 C 867.0186767578125 512.6845092773438 868.3416748046875 512.7406616210938 868.66455078125 511.9861755371094 C 868.740478515625 511.7702331542969 868.7645874023438 511.5394287109375 868.7346801757813 511.3124084472656 C 868.6676025390625 510.1302795410156 868.49853515625 508.9561767578125 868.2293701171875 507.8031616210938 C 868.1231079101563 507.2095642089844 867.883056640625 506.64794921875 867.5274658203125 506.1608581542969 C 867.0362548828125 505.5678100585938 866.271240234375 505.2835693359375 865.541259765625 505.0379028320313 C 864.4359130859375 504.65185546875 862.24267578125 504.1079406738281 861.11962890625 504.7852172851563 Z" fill="#106433" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qwvfbt =
    '<svg viewBox="24.0 75.2 15.6 8.2" ><path transform="translate(-812.14, -434.8)" d="M 841.804443359375 511.1639404296875 C 840.7516479492188 511.9429931640625 839.8287353515625 512.9185791015625 838.6461181640625 513.4520263671875 C 837.8109130859375 513.8309936523438 836.85986328125 513.9959106445313 836.1300048828125 514.5609130859375 C 836.5265502929688 515.4346923828125 837.5582275390625 515.8873901367188 838.5162353515625 515.852294921875 C 839.4751586914063 515.7581176757813 840.3942260742188 515.421142578125 841.186767578125 514.8732299804688 C 841.81494140625 514.4871826171875 842.5518798828125 514.0380249023438 843.2362060546875 514.3082275390625 C 843.3414306640625 514.8416748046875 842.88525390625 515.343505859375 842.88525390625 515.8839111328125 C 842.88525390625 516.42431640625 843.33447265625 516.8173217773438 843.776611328125 517.1015625 C 845.8821411132813 518.4596557617188 848.59130859375 518.3473510742188 851.100341796875 518.189453125 C 851.2443237304688 518.1947631835938 851.3860473632813 518.1528930664063 851.50390625 518.0701293945313 C 851.61376953125 517.94189453125 851.6680908203125 517.7752075195313 851.65478515625 517.6068725585938 C 851.6864013671875 517.0524291992188 851.700439453125 516.50146484375 851.7039794921875 515.947021484375 C 851.8488159179688 515.0343017578125 851.4520263671875 514.1202392578125 850.686279296875 513.602783203125 C 849.32470703125 512.432373046875 847.8560180664063 511.3926086425781 846.2996826171875 510.4971923828125 C 844.7557373046875 509.6023559570313 843.1905517578125 510.1322631835938 841.804443359375 511.1639404296875 Z" fill="#fbb3b2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z4uad9 =
    '<svg viewBox="18.2 10.7 5.7 4.8" ><path transform="translate(-801.38, -315.37)" d="M 822.0964965820313 326.0656127929688 C 820.5383911132813 326.2516174316406 819.4049072265625 327.4693298339844 819.5628662109375 328.7922973632813 C 819.7207641601563 330.1152648925781 821.1104125976563 331.0276794433594 822.6685180664063 330.8381958007813 C 824.2266235351563 330.648681640625 825.360107421875 329.4344787597656 825.2021484375 328.114990234375 C 825.0442504882813 326.7955322265625 823.6546020507813 325.879638671875 822.0964965820313 326.0656127929688 Z M 822.6264038085938 330.4732360839844 C 821.306884765625 330.6311340332031 820.13134765625 329.8555908203125 819.9945068359375 328.7396545410156 C 819.8576049804688 327.6237182617188 820.8226318359375 326.5920104980469 822.1386108398438 326.43408203125 C 823.45458984375 326.2761840820313 824.6336669921875 327.0517272949219 824.7705078125 328.1676635742188 C 824.9074096679688 329.2835998535156 823.9423828125 330.3153076171875 822.6264038085938 330.4732360839844 Z" fill="#3c354c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dtg6rj =
    '<svg viewBox="10.6 11.6 5.7 4.8" ><path transform="translate(-787.33, -317.05)" d="M 800.4564819335938 328.6653442382813 C 798.8984375 328.8513488769531 797.764892578125 330.0690612792969 797.9228515625 331.3885498046875 C 798.0807495117188 332.7080078125 799.4703979492188 333.6239013671875 801.0285034179688 333.4379272460938 C 802.5866088867188 333.251953125 803.7200927734375 332.0342407226563 803.5621337890625 330.7112426757813 C 803.4042358398438 329.3882751464844 802.0145874023438 328.4793701171875 800.4564819335938 328.6653442382813 Z M 800.9863891601563 333.0694580078125 C 799.6668701171875 333.2273559570313 798.4913330078125 332.4518127441406 798.3579711914063 331.3394165039063 C 798.224609375 330.2269897460938 799.1826171875 329.1917419433594 800.5020751953125 329.0303344726563 C 801.8215942382813 328.868896484375 802.9971923828125 329.64794921875 803.1304931640625 330.7638854980469 C 803.263916015625 331.8798217773438 802.3023681640625 332.9115295410156 800.9863891601563 333.0694580078125 Z" fill="#3c354c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z19xd0 =
    '<svg viewBox="7.3 12.3 3.5 1.6" ><path transform="translate(-655.53, -247.35)" d="M 663.0203857421875 259.6400146484375 L 666.4067993164063 260.3629150390625 L 666.0734252929688 261.2542419433594 L 662.8800048828125 260.3172912597656 L 663.0203857421875 259.6400146484375 Z" fill="#3c354c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jl9yxr =
    '<svg viewBox="23.2 10.0 3.4 2.3" ><path transform="translate(-684.93, -243.16)" d="M 711.293212890625 253.1799926757813 L 708.1699829101563 254.6854553222656 L 708.7069091796875 255.4715270996094 L 711.5879516601563 253.8046417236328 L 711.293212890625 253.1799926757813 Z" fill="#3c354c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_98xifa =
    '<svg viewBox="15.9 12.5 2.4 1.0" ><path transform="translate(-671.39, -247.75)" d="M 687.3099975585938 260.5342407226563 L 689.685791015625 260.25 L 689.5629272460938 260.8395385742188 L 687.5240478515625 260.9764099121094 L 687.3099975585938 260.5342407226563 Z" fill="#3c354c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sz97o0 =
    '<svg viewBox="5.5 0.0 21.9 13.6" ><path transform="translate(-778.02, -295.62)" d="M 789.3295288085938 307.6118469238281 C 789.5531005859375 307.1310424804688 789.672607421875 306.6084594726563 789.680419921875 306.0783081054688 C 789.688720703125 305.7609558105469 789.7431640625 305.446533203125 789.8419189453125 305.1448364257813 C 790.014404296875 304.7616882324219 790.27685546875 304.4258117675781 790.60693359375 304.165771484375 C 791.7017822265625 303.2393188476563 793.2703857421875 302.7620849609375 794.8179931640625 302.6954040527344 C 796.5054321289063 302.6177673339844 798.18408203125 302.9805908203125 799.6888427734375 303.7481689453125 C 800.1484375 303.9635009765625 800.5601806640625 304.2690124511719 800.8995361328125 304.6465148925781 C 801.3908081054688 305.2466125488281 801.49609375 306.0221557617188 801.9908447265625 306.6152038574219 C 802.677734375 307.3471069335938 803.697265625 307.6665649414063 804.678955078125 307.4574279785156 C 804.8508911132813 306.8468017578125 804.6262817382813 306.2011108398438 804.7139892578125 305.5764770507813 C 804.852294921875 305.041259765625 805.0390625 304.5197143554688 805.27197265625 304.0183715820313 C 805.81591796875 302.4146423339844 805.0228271484375 300.5547485351563 803.3875732421875 299.5967407226563 C 802.8155517578125 299.2458190917969 802.1382446289063 299.0177001953125 801.7100830078125 298.5439758300781 C 801.281982421875 298.0702209472656 801.18017578125 297.5789184570313 800.8854370117188 297.1051635742188 C 800.1029052734375 295.8523864746094 798.0780639648438 295.266357421875 796.5374755859375 295.8453674316406 C 796.05322265625 296.02783203125 795.6251220703125 296.3050842285156 795.1337890625 296.5015869140625 C 794.221435546875 296.8770751953125 793.1826782226563 296.9437561035156 792.1790771484375 297.070068359375 C 791.1898193359375 297.1615600585938 790.2223510742188 297.4152526855469 789.3155517578125 297.821044921875 C 788.44873046875 298.2492065429688 787.7222900390625 298.93701171875 787.5223388671875 299.7581787109375 C 787.4275512695313 300.1371459960938 787.4486083984375 300.5302124023438 787.3538818359375 300.9056701660156 C 786.86962890625 302.8111877441406 783.7428588867188 303.7376403808594 783.5673828125 305.6817321777344 C 783.5042724609375 306.3835754394531 783.88671875 307.057373046875 784.364013671875 307.6293640136719 C 784.69384765625 308.0188903808594 785.4834594726563 309.0611267089844 786.0414428710938 309.2120361328125 C 786.5994262695313 309.3629150390625 787.0240478515625 308.8330383300781 787.5574340820313 308.6505432128906 C 788.3995971679688 308.3873901367188 788.908447265625 308.3312377929688 789.3295288085938 307.6118469238281 Z" fill="#cbceda" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8l52gz =
    '<svg viewBox="71.2 115.2 49.7 8.3" ><path transform="translate(-257.53, -284.02)" d="M 329.2644958496094 400.8750610351563 L 368.4872131347656 400.3627319335938 L 372.99658203125 400.3030700683594 C 373.8071899414063 400.3030700683594 374.6178588867188 400.2749938964844 375.428466796875 400.271484375 C 376.5689697265625 400.271484375 377.3374938964844 401.218994140625 377.3164367675781 402.3770141601563 C 377.2637939453125 404.83349609375 375.7197265625 404.7457580566406 373.6984252929688 404.83349609375 L 368.8240966796875 405.0545654296875 L 348.9758605957031 405.9283752441406 C 345.4210205078125 406.0863037109375 341.8626403808594 406.279296875 338.3078002929688 406.402099609375 C 335.100341796875 406.5003662109375 329.0012817382813 405.4546203613281 330.4260559082031 400.787353515625 C 330.62255859375 400.1381225585938 329.6083984375 399.8609008789063 329.4083862304688 400.506591796875 C 328.70654296875 402.8016357421875 329.9487915039063 405.1317749023438 331.9490661621094 406.33544921875 C 334.7880249023438 408.0409240722656 338.5288696289063 407.4619140625 341.66259765625 407.321533203125 L 366.03076171875 406.2161254882813 L 371.9473266601563 405.9529418945313 C 373.4633178710938 405.8827514648438 375.5723266601563 406.1915588378906 376.9655151367188 405.4862060546875 C 378.600830078125 404.6615600585938 378.8885498046875 401.387451171875 377.8568725585938 400.00830078125 C 377.3269653320313 399.3064575195313 376.5830078125 399.2432861328125 375.7513122558594 399.2117309570313 C 373.5685729980469 399.1275024414063 371.3472290039063 399.2713623046875 369.1609802246094 399.2994384765625 L 357.0120239257813 399.4608764648438 L 329.2504577636719 399.811767578125 C 328.5731811523438 399.811767578125 328.5731811523438 400.8645629882813 329.2504577636719 400.8645629882813 Z" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezkppa =
    '<svg viewBox="276.2 214.4 24.7 31.9" ><path transform="translate(-636.64, -467.59)" d="M 912.8099365234375 682 C 912.8099365234375 699.63037109375 923.87109375 713.89892578125 937.53955078125 713.89892578125" fill="#46455b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zff21i =
    '<svg viewBox="300.9 214.1 27.6 32.3" ><path transform="translate(-682.38, -466.93)" d="M 983.280029296875 713.2468872070313 C 983.280029296875 695.4164428710938 995.62548828125 680.989990234375 1010.880187988281 680.989990234375" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dk3pn6 =
    '<svg viewBox="285.1 216.0 15.8 30.3" ><path transform="translate(-653.21, -470.55)" d="M 938.3499755859375 686.5599975585938 C 938.3499755859375 703.3095703125 945.4035034179688 716.8622436523438 954.116943359375 716.8622436523438" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g715e3 =
    '<svg viewBox="300.9 205.1 31.9 41.2" ><path transform="translate(-682.38, -450.35)" d="M 983.280029296875 696.66943359375 C 983.280029296875 673.887451171875 997.548583984375 655.449951171875 1015.178955078125 655.449951171875" fill="#46455b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nsqpa2 =
    '<svg viewBox="295.7 244.6 13.0 6.6" ><path transform="translate(-672.76, -523.5)" d="M 968.4600219726563 770.0452270507813 C 968.4600219726563 770.0452270507813 971.96923828125 769.9364013671875 973.0220336914063 769.1854248046875 C 974.0748291015625 768.4344482421875 978.415771484375 767.5325927734375 978.678955078125 768.73974609375 C 978.942138671875 769.9469604492188 983.9427490234375 774.7440795898438 979.9878540039063 774.775634765625 C 976.032958984375 774.8072509765625 970.78662109375 774.1580810546875 969.73388671875 773.515869140625 C 968.68115234375 772.8736572265625 968.4600219726563 770.0452270507813 968.4600219726563 770.0452270507813 Z" fill="#a8a8a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kbr982 =
    '<svg viewBox="295.7 246.5 13.0 4.7" ><path transform="translate(-672.76, -527.0)" d="M 980.0615234375 777.8528442382813 C 976.1031494140625 777.8843994140625 970.8638916015625 777.2352294921875 969.8076171875 776.593017578125 C 969.0040283203125 776.105224609375 968.6846313476563 774.3471069335938 968.5758056640625 773.5399780273438 L 968.4600219726563 773.5399780273438 C 968.4600219726563 773.5399780273438 968.68115234375 776.368408203125 969.7374267578125 777.0106201171875 C 970.793701171875 777.65283203125 976.032958984375 778.302001953125 979.9913330078125 778.2704467773438 C 981.1353759765625 778.2704467773438 981.5284423828125 777.8528442382813 981.50732421875 777.2527465820313 C 981.3494873046875 777.61767578125 980.931884765625 777.8458251953125 980.0615234375 777.8528442382813 Z" fill="#000000" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-opacity="0.2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_564so9 =
    '<svg viewBox="7.9 224.7 19.7 25.4" ><path transform="translate(-140.42, -486.64)" d="M 148.3099975585938 711.3599853515625 C 148.3099975585938 725.3969116210938 157.1076507568359 736.73876953125 167.9827575683594 736.73876953125" fill="#46455b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fklb7d =
    '<svg viewBox="27.6 224.4 22.0 25.7" ><path transform="translate(-176.8, -486.12)" d="M 204.3699951171875 736.2130126953125 C 204.3699951171875 722.0286865234375 214.1958618164063 710.5499877929688 226.3272705078125 710.5499877929688" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_czcaxw =
    '<svg viewBox="15.0 226.0 12.5 24.1" ><path transform="translate(-153.6, -489.01)" d="M 168.6199951171875 715 C 168.6199951171875 728.3350830078125 174.2347717285156 739.1084594726563 181.1655120849609 739.1084594726563" fill="#aaea15" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2qxvft =
    '<svg viewBox="27.6 217.3 25.4 32.8" ><path transform="translate(-176.8, -472.93)" d="M 204.3699951171875 723.0238037109375 C 204.3699951171875 704.8985595703125 215.7223815917969 690.22998046875 229.748779296875 690.22998046875" fill="#46455b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_idkae4 =
    '<svg viewBox="23.4 248.7 10.4 5.3" ><path transform="translate(-169.15, -531.09)" d="M 192.5799865722656 781.3621826171875 C 192.5799865722656 781.3621826171875 195.3698425292969 781.2745361328125 196.2085418701172 780.660400390625 C 197.0472412109375 780.0462646484375 200.5038452148438 779.3444213867188 200.7108917236328 780.3094482421875 C 200.9179382324219 781.2745361328125 204.9044189453125 785.0855102539063 201.763671875 785.110107421875 C 198.6228942871094 785.1346435546875 194.4433898925781 784.6187744140625 193.6046905517578 784.1099853515625 C 192.7659912109375 783.6011352539063 192.5799865722656 781.3621826171875 192.5799865722656 781.3621826171875 Z" fill="#a8a8a8" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ly9oyt =
    '<svg viewBox="23.4 250.3 10.4 3.8" ><path transform="translate(-169.15, -533.93)" d="M 201.8092956542969 787.6520385742188 C 198.6510009765625 787.6766357421875 194.4890441894531 787.1607666015625 193.6503295898438 786.6484375 C 193.0116577148438 786.2623901367188 192.7589874267578 784.8621826171875 192.6712646484375 784.2200317382813 L 192.5800170898438 784.2200317382813 C 192.5800170898438 784.2200317382813 192.7554779052734 786.4694213867188 193.5941772460938 786.9818115234375 C 194.4328918457031 787.494140625 198.6053771972656 788.0064697265625 201.7531585693359 787.98193359375 C 202.6620483398438 787.98193359375 202.9778747558594 787.6520385742188 202.9603271484375 787.1712646484375 C 202.8339996337891 787.4520263671875 202.486572265625 787.6309814453125 201.8092956542969 787.6520385742188 Z" fill="#000000" fill-opacity="0.2" stroke="none" stroke-width="1" stroke-opacity="0.2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
