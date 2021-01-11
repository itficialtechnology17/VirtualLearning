import 'package:flutter/material.dart';

class SquareTabIndicator extends Decoration {
  final BoxPainter _painter;

  SquareTabIndicator({@required Color color, @required double radius})
      : _painter = _SquarePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _SquarePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _SquarePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width/2, cfg.size.height);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
