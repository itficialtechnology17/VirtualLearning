import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  Color mainBGColor = Color(0xFF652A78);
  Color redColor = Color(0xFFDE3C10);
  Color purpleColor = Color(0xFF8132AD);
  Color cyan = Color(0xFF99D5E5);
  Color orange = Color(0xFFE97A4D);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height * 0.40));
    paint.color = mainBGColor;
    mainBGPath.quadraticBezierTo(
        size.width * .25, size.height * .3, 0, size.height * 0.40);
    canvas.drawPath(mainBGPath, paint);

    Path bgPathWhite = Path();
    bgPathWhite.addRect(
        Rect.fromLTWH(0.0, size.height * 0.35, size.width, size.height * 0.70));
    paint.color = Colors.white;

//    canvas.drawPath(bgPathWhite, paint);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              0.0, size.height * 0.30, size.width, size.height * 0.70),
          Radius.circular(16),
        ),
        paint);

    /*  Path purplePath = Path();
    purplePath.lineTo(size.width * .45, 0);
    purplePath.quadraticBezierTo(
        size.width * .25, size.height * .3, 0, size.height * 0.55);
    purplePath.close();
    paint.color = purpleColor;
    canvas.drawPath(purplePath, paint);
*/
    /* Path redPath = Path();
    redPath.moveTo(size.width * 0.9, 0.0);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.1, 0, size.height * 0.85);
    redPath.lineTo(0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.7, size.width, size.height * 0.6);
    redPath.lineTo(size.width, 0.0);
    redPath.close();
    paint.color = redColor;
    canvas.drawPath(redPath, paint);*/

    /* Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.75);
    orangePath.quadraticBezierTo(
        size.width * .25, size.height * 0.85, size.width * .40, size.height);
    orangePath.lineTo(0, size.height);
    orangePath.close();
    paint.color = orange;
    canvas.drawPath(orangePath, paint);*/

    /*Path trianglePath = Path();
    trianglePath.lineTo(size.width * .25, 0);
    trianglePath.lineTo(0, size.height * .25);
    trianglePath.close();
    paint.color = cyan;
    canvas.drawPath(trianglePath, paint);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
