import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenChooseCourse extends StatelessWidget {
  ScreenChooseCourse({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(322.0, 729.0),
            child: SvgPicture.string(
              _svg_s4kpy0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(81.5, 324.5),
            child:
                // Adobe XD layer: 'Frame' (shape)
                Container(
              width: 99.0,
              height: 99.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                border: Border.all(width: 1.0, color: const Color(0xff3aa59b)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(235.0, 324.0),
            child: SvgPicture.string(
              _svg_lyx1ly,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(83.3, 434.5),
            child:
                // Adobe XD layer: '5' (text)
                SizedBox(
              width: 19.0,
              child: Text(
                '5',
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  height: 1.3529411764705883,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(334.5, 742.5),
            child: Transform.rotate(
              angle: 3.1416,
              child:
                  // Adobe XD layer: 'Icons/ Arrows/ Prev…' (group)
                  SizedBox(
                width: 26.0,
                height: 24.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 11.8, 23.5),
                      size: Size(25.5, 23.5),
                      child:
                          // Adobe XD layer: 'Path' (shape)
                          SvgPicture.string(
                        _svg_xcib9l,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 11.8, 25.5, 1.0),
                      size: Size(25.5, 23.5),
                      child:
                          // Adobe XD layer: 'Path' (shape)
                          SvgPicture.string(
                        _svg_twuq3c,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(31.8, 153.0),
            child:
                // Adobe XD layer: 'Enter your login det' (text)
                SizedBox(
              width: 218.0,
              child: Text(
                'Select course you are interested in',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: const Color(0xff3aa59b),
                  fontWeight: FontWeight.w500,
                  height: 1.6666666666666667,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(81.0, 473.0),
            child:
                // Adobe XD layer: 'Frame' (shape)
                Container(
              width: 99.0,
              height: 99.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                border: Border.all(width: 1.0, color: const Color(0xff3aa59b)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(235.0, 473.0),
            child:
                // Adobe XD layer: 'Frame' (shape)
                Container(
              width: 99.0,
              height: 99.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                border: Border.all(width: 1.0, color: const Color(0xff3aa59b)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(113.0, 328.0),
            child: SizedBox(
              width: 47.0,
              height: 84.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 34.0, 84.0),
                    size: Size(47.0, 84.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      '9',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 63,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(35.0, 11.0, 12.0, 20.0),
                    size: Size(47.0, 84.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'th',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(250.0, 328.0),
            child: SizedBox(
              width: 75.0,
              height: 84.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 68.0, 84.0),
                    size: Size(75.0, 84.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Text(
                      '10',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 63,
                        color: const Color(0xff205072),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(63.0, 11.0, 12.0, 20.0),
                    size: Size(75.0, 84.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'th',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xff205072),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 477.0),
            child: SizedBox(
              width: 68.0,
              height: 84.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 68.0, 84.0),
                    size: Size(68.0, 84.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Text(
                      '11',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 63,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(56.0, 11.0, 12.0, 20.0),
                    size: Size(68.0, 84.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'th',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(248.0, 477.0),
            child: SizedBox(
              width: 73.0,
              height: 84.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 68.0, 84.0),
                    size: Size(73.0, 84.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Text(
                      '12',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 63,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(61.0, 11.0, 12.0, 20.0),
                    size: Size(73.0, 84.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Text(
                      'th',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xff3aa59b),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(21.0, 101.0),
            child:
                // Adobe XD layer: 'Login' (text)
                SizedBox(
              width: 300.0,
              child: Text(
                'Choose Course',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  color: const Color(0xff205072),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 70.0),
            child:
                // Adobe XD layer: 'Icons/ Arrows/ Prev…' (group)
                SizedBox(
              width: 13.0,
              height: 12.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 6.0, 12.0),
                    size: Size(13.0, 12.0),
                    child:
                        // Adobe XD layer: 'Path' (shape)
                        SvgPicture.string(
                      _svg_wgubs0,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 6.0, 13.0, 1.0),
                    size: Size(13.0, 12.0),
                    child:
                        // Adobe XD layer: 'Path' (shape)
                        SvgPicture.string(
                      _svg_b8gnv7,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_s4kpy0 =
    '<svg viewBox="322.0 729.0 50.0 50.0" ><path transform="translate(322.0, 729.0)" d="M 25 0 C 38.8071174621582 0 50 11.1928825378418 50 25 C 50 38.8071174621582 38.8071174621582 50 25 50 C 16.43964767456055 50 8.884193420410156 45.69751739501953 4.211332321166992 38.89109039306641 C 1.616289615631104 35.11602783203125 0 30.24676513671875 0 25 C 0 11.1928825378418 11.1928825378418 0 25 0 Z" fill="#ffffff" stroke="#205072" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lyx1ly =
    '<svg viewBox="235.0 324.0 99.0 99.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="13" stdDeviation="34"/></filter></defs><path transform="translate(235.0, 324.0)" d="M 30.13043212890625 0 L 68.86956024169922 0 C 85.51014709472656 0 99 13.48985290527344 99 30.13043212890625 L 99 68.86956024169922 C 99 85.51014709472656 85.51014709472656 99 68.86956024169922 99 L 30.13043212890625 99 C 13.48985290527344 99 0 85.51014709472656 0 68.86956024169922 L 0 30.13043212890625 C 0 13.48985290527344 13.48985290527344 0 30.13043212890625 0 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_xcib9l =
    '<svg viewBox="0.0 0.0 11.8 23.5" ><path  d="M 11.76937866210938 23.53875732421875 L 0 11.76937866210938 L 11.76937866210938 0" fill="none" stroke="#205072" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_twuq3c =
    '<svg viewBox="0.0 11.8 25.5 1.0" ><path transform="translate(0.0, 11.27)" d="M 0 0.5 L 25.50032043457031 0.5" fill="none" stroke="#205072" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_wgubs0 =
    '<svg viewBox="0.0 0.0 6.0 12.0" ><path  d="M 6 12 L 0 6 L 6 0" fill="none" stroke="#205072" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_b8gnv7 =
    '<svg viewBox="0.0 6.0 13.0 1.0" ><path transform="translate(0.0, 5.5)" d="M 0 0.5 L 13 0.5" fill="none" stroke="#205072" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
