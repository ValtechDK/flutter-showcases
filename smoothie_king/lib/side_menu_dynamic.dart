import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DynamicSideMenuPainter extends CustomPainter {
  final Point mainPoint;
  final Color fillColor;
  final Color dotColor;

  DynamicSideMenuPainter({
    @required this.fillColor,
    @required this.dotColor,
    @required this.mainPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final totalHeight = size.height / 4.0;
    final dotRadius = 5.0;

    final midPoint = Point(size.width - 20, mainPoint.y);

    final startPoint = Point(size.width, mainPoint.y - totalHeight / 2);
    final endPoint = Point(size.width, mainPoint.y + totalHeight / 2);

    final firstCubicToTarget = Point(midPoint.x, mainPoint.y);
    final firstCubicToX1 = Point(mainPoint.x, mainPoint.y - totalHeight / 10);
    final firstCubicToX2 = Point(midPoint.x, mainPoint.y - totalHeight / 5);

    final secondCubicToX1 = Point(midPoint.x, mainPoint.y + totalHeight / 5);
    final secondCubicToX2 = Point(mainPoint.x, mainPoint.y + totalHeight / 10);

    Paint mainFigurePaint = new Paint()
      ..style = PaintingStyle.fill
      ..color = this.fillColor;

    Paint dotPaint = new Paint()..color = this.dotColor;

    final linesPath = Path();
    final dotPath = Path();

    linesPath.lineTo(size.width, 0);
    linesPath.lineTo(startPoint.x, startPoint.y);

    linesPath.cubicTo(firstCubicToX1.x, firstCubicToX1.y, firstCubicToX2.x,
        firstCubicToX2.y, firstCubicToTarget.x, firstCubicToTarget.y);
    linesPath.cubicTo(secondCubicToX1.x, secondCubicToX1.y, secondCubicToX2.x,
        secondCubicToX2.y, endPoint.x, endPoint.y);

    dotPath.addOval(Rect.fromCircle(
        center: Offset(mainPoint.x - dotRadius, mainPoint.y),
        radius: dotRadius));

    linesPath.lineTo(size.width, size.height);
    linesPath.lineTo(0, size.height);
    linesPath.lineTo(0, 0);

    canvas.drawPath(linesPath, mainFigurePaint);
    canvas.drawPath(dotPath, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
