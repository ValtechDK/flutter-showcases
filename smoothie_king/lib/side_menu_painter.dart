import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMenuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint mainFigurePaint = new Paint()
      ..style = PaintingStyle.fill
      ..color = Color.fromARGB(255, 171, 84, 152);
    Paint circlesPaint = new Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    Paint curvePaint = new Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green;

    Paint linesPaint = new Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 4;

    final path = Path();
    final circlesPath = Path();
    final curvePath = Path();
    final linesPath = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * .2);

    path.cubicTo(size.width, size.height * .35, size.width * 0.8, size.height * .3, size.width * 0.8, size.height * .4);
    path.cubicTo(size.width * 0.8, size.height * .5, size.width, size.height * .45, size.width, size.height * .6);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    curvePath.addOval(Rect.fromCircle(center: Offset(size.width, size.height * .35), radius: 10));
    curvePath.addOval(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * .3), radius: 10));

    circlesPath.addOval(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * .4), radius: 10));

    curvePath.addOval(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * .5), radius: 10));
    curvePath.addOval(Rect.fromCircle(center: Offset(size.width, size.height * .45), radius: 10));

    circlesPath.addOval(Rect.fromCircle(center: Offset(size.width, size.height * .2), radius: 10));
    circlesPath.addOval(Rect.fromCircle(center: Offset(size.width, size.height * .6), radius: 10));

    linesPath.moveTo(0, size.height * .4);
    linesPath.lineTo(size.width, size.height * .4);

    // canvas.drawShadow(mainFigurePath, Colors.black45, 10, true);
    canvas.drawPath(path, mainFigurePaint);
    canvas.drawPath(circlesPath, circlesPaint);
    canvas.drawPath(curvePath, curvePaint);
    canvas.drawPath(linesPath, linesPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
