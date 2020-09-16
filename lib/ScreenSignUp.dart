import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(51.0, 274.0),
            child:
                // Adobe XD layer: 'Elements/ Input/ Lo…' (group)
                SizedBox(
              width: 312.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 312.0, 85.0),
                    size: Size(312.0, 85.0),
                    child:
                        // Adobe XD layer: 'Frame' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x33106433),
                            offset: Offset(0, 13),
                            blurRadius: 34,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(34.0, 32.0, 31.0, 20.0),
                    size: Size(312.0, 85.0),
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'alexis@myemail.com' (text)
                        Text(
                      'Amit',
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 15,
                        color: const Color(0xff205072),
                        height: 1.5333333333333334,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(254.0, 31.0, 24.0, 24.0),
                    size: Size(312.0, 85.0),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Atoms/ Selectors/ S…' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                          size: Size(24.0, 24.0),
                          child:
                              // Adobe XD layer: 'Oval' (shape)
                              Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xff205072),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(7.0, 8.5, 10.0, 7.1),
                          size: Size(24.0, 24.0),
                          child:
                              // Adobe XD layer: 'Tick Right' (shape)
                              SvgPicture.string(
                            _svg_rqywdn,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(51.0, 422.0),
            child:
                // Adobe XD layer: 'Elements/ Input/ Lo…' (group)
                SizedBox(
              width: 312.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 312.0, 85.0),
                    size: Size(312.0, 85.0),
                    child:
                        // Adobe XD layer: 'Frame' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3aa59b)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(51.0, 576.0),
            child:
                // Adobe XD layer: 'Elements/ Input/ Lo…' (group)
                SizedBox(
              width: 312.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 312.0, 85.0),
                    size: Size(312.0, 85.0),
                    child:
                        // Adobe XD layer: 'Frame' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3aa59b)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(51.0, 721.0),
            child:
                // Adobe XD layer: 'Elements/ Input/ Lo…' (group)
                SizedBox(
              width: 312.0,
              height: 85.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 312.0, 85.0),
                    size: Size(312.0, 85.0),
                    child:
                        // Adobe XD layer: 'Frame' (shape)
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3aa59b)),
                      ),
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
              'Let\'s know you better',
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
            offset: Offset(26.8, 101.0),
            child:
                // Adobe XD layer: 'Login' (text)
                SizedBox(
              width: 158.0,
              child: Text(
                'Sign Up',
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
          Transform.translate(
            offset: Offset(85.0, 454.0),
            child:
                // Adobe XD layer: 'alexis@myemail.com' (text)
                Text(
              'City',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 15,
                color: const Color(0x4d3aa59b),
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(85.0, 608.0),
            child:
                // Adobe XD layer: 'alexis@myemail.com' (text)
                Text(
              'Contact No.',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 15,
                color: const Color(0x4d3aa59b),
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(85.0, 753.0),
            child:
                // Adobe XD layer: 'alexis@myemail.com' (text)
                Text(
              'Email ID',
              style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 15,
                color: const Color(0x4d3aa59b),
                height: 1.5333333333333334,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(305.0, 455.0),
            child:
                // Adobe XD layer: 'Atoms/ Selectors/ S…' (group)
                SizedBox(
              width: 24.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                    size: Size(24.0, 24.0),
                    child:
                        // Adobe XD layer: 'Oval' (shape)
                        SvgPicture.string(
                      _svg_aur6kq,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(305.0, 606.0),
            child:
                // Adobe XD layer: 'Atoms/ Selectors/ S…' (group)
                SizedBox(
              width: 24.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                    size: Size(24.0, 24.0),
                    child:
                        // Adobe XD layer: 'Oval' (shape)
                        SvgPicture.string(
                      _svg_aur6kq,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(305.0, 752.0),
            child:
                // Adobe XD layer: 'Atoms/ Selectors/ S…' (group)
                SizedBox(
              width: 24.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 24.0, 24.0),
                    size: Size(24.0, 24.0),
                    child:
                        // Adobe XD layer: 'Oval' (shape)
                        SvgPicture.string(
                      _svg_aur6kq,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(124.5, 308.5),
            child: SvgPicture.string(
              _svg_u1d8wx,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_rqywdn =
    '<svg viewBox="7.0 8.5 10.0 7.1" ><path transform="translate(7.0, 8.5)" d="M 8.493729591369629 0.2584351897239685 C 8.838309288024902 -0.0861450657248497 9.396984100341797 -0.0861450657248497 9.741564750671387 0.2584351897239685 C 10.08614540100098 0.6030154228210449 10.08614540100098 1.161690473556519 9.741564750671387 1.50627064704895 L 4.447447299957275 6.800388336181641 C 4.102867126464844 7.144968509674072 3.544191837310791 7.144968509674072 3.199611663818359 6.800388336181641 L 0.2584351897239685 3.859211921691895 C -0.0861450657248497 3.514631509780884 -0.0861450657248497 2.955956697463989 0.2584351897239685 2.611376285552979 C 0.6030154228210449 2.266796112060547 1.161690473556519 2.266796112060547 1.50627064704895 2.611376285552979 L 3.823529481887817 4.928635120391846 L 8.493729591369629 0.2584351897239685 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_xkxrrr =
    '<svg viewBox="0.0 0.0 6.0 12.0" ><path  d="M 6 12 L 0 6 L 6 0" fill="none" stroke="#106433" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_g7smak =
    '<svg viewBox="0.0 6.0 13.0 1.0" ><path transform="translate(0.0, 5.5)" d="M 0 0.5 L 13 0.5" fill="none" stroke="#106433" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_aur6kq =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 12 0 C 18.62741661071777 0 24 5.372583389282227 24 12 C 24 18.62741661071777 18.62741661071777 24 12 24 C 5.372583389282227 24 0 18.62741661071777 0 12 C 0 5.372583389282227 5.372583389282227 0 12 0 Z" fill="none" stroke="#3aa59b" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u1d8wx =
    '<svg viewBox="124.5 308.5 1.0 15.9" ><path transform="translate(124.0, 307.99)" d="M 0.5 0.5 L 0.5 16.4122200012207" fill="none" stroke="#205072" stroke-width="1" stroke-miterlimit="10" stroke-linecap="square" /></svg>';
