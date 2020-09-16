import 'package:flutter/material.dart';
import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenVerification extends StatelessWidget {
  ScreenVerification({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(),
          Transform.translate(
            offset: Offset(95.4, 374.0),
            child:
                // Adobe XD layer: 'I didn’t receive the' (text)
                SizedBox(
              width: 223.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 13,
                    color: const Color(0x8c3aa59b),
                    height: 1.5384615384615385,
                  ),
                  children: [
                    TextSpan(
                      text: 'I didn’t receive the code,',
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: const Color(0xff68b2a0),
                      ),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: const Color(0xff205072),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(74.0, 505.0),
            child:
                // Adobe XD layer: 'Elements/ Buttons/ …' (group)
                SizedBox(
              width: 266.0,
              height: 55.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 266.0, 55.0),
                    size: Size(266.0, 55.0),
                    child:
                        // Adobe XD layer: 'Colour BG' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        gradient: RadialGradient(
                          center: Alignment(-0.88, -1.0),
                          radius: 1.35,
                          colors: [
                            const Color(0xffaaea15),
                            const Color(0xff106433)
                          ],
                          stops: [0.0, 1.0],
                          transform: GradientXDTransform(1.0, 0.0, 0.0, 1.0,
                              0.0, 0.0, Alignment(-0.88, -1.0)),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x36329d9c),
                            offset: Offset(15, 15),
                            blurRadius: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(51.2, 20.0, 163.6, 18.0),
                    size: Size(266.0, 55.0),
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Button' (text)
                        Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        height: 1.3846153846153846,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(39.0, 152.0),
            child:
                // Adobe XD layer: 'Enter your login det' (text)
                Text(
              'Verify your number and never stop learning',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff68b2a0),
                fontWeight: FontWeight.w500,
                height: 1.4285714285714286,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(39.0, 101.0),
            child:
                // Adobe XD layer: 'Login' (text)
                Text(
              'Verification',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 36,
                color: const Color(0xff205072),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
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
                      _svg_xkxrrr,
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
                      _svg_g7smak,
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

const String _svg_xkxrrr =
    '<svg viewBox="0.0 0.0 6.0 12.0" ><path  d="M 6 12 L 0 6 L 6 0" fill="none" stroke="#106433" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_g7smak =
    '<svg viewBox="0.0 6.0 13.0 1.0" ><path transform="translate(0.0, 5.5)" d="M 0 0.5 L 13 0.5" fill="none" stroke="#106433" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
