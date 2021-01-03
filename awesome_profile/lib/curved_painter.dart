import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint mainFigurePaint = new Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(colors: [
        Constants.mainFigureStartColor,
        Constants.mainFigureEndColor,
      ], begin: Alignment.bottomRight, end: Alignment.topLeft)
          .createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    Paint bottomLeftFigurePaint = new Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(colors: [
        Constants.bottomLeftFigureStartColor,
        Constants.bottomLeftFigureEndColor,
      ], center: Alignment.bottomLeft, radius: 1)
          .createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    Path mainFigurePath = Path();

    mainFigurePath.moveTo(size.width, size.height * 0.2);
    mainFigurePath.cubicTo(
        size.width * 0.7, size.height * 0.4, size.width * 0.3, size.height * 0.1, 0, size.height * 0.1);

    mainFigurePath.lineTo(0, size.height * 0.7);
    mainFigurePath.cubicTo(
        size.width * 0.5, size.height * 0.65, size.width * 0.7, size.height * 0.95, size.width, size.height * 0.85);

    mainFigurePath.lineTo(size.width, size.height * 0.2);
    canvas.drawPath(mainFigurePath, mainFigurePaint);

    Path bottomLeftFigurePath = Path();
    bottomLeftFigurePath.moveTo(0, size.height * 0.72);
    bottomLeftFigurePath.quadraticBezierTo(size.width * 0.3, size.height * 0.75, size.width * 0.5, size.height);
    bottomLeftFigurePath.lineTo(0, size.height);

    canvas.drawShadow(mainFigurePath, Colors.black45, 10, true);
    canvas.drawPath(mainFigurePath, mainFigurePaint);

    canvas.drawShadow(bottomLeftFigurePath.shift(Offset(10, -30)), Colors.black45, 20, true);
    canvas.drawPath(bottomLeftFigurePath, bottomLeftFigurePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
