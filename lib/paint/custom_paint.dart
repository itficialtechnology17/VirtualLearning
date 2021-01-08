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

    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              0.0, size.height * 0.30, size.width, size.height * 0.70),
          Radius.circular(16),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
