import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends StatelessWidget {
  final double width;
  final double height;

  const MenuButton({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MenuButtonPainter(width: width),
      child: Container(
        width: width,
        height: height,
      ),
    );
  }
}

class MenuButtonPainter extends CustomPainter {
  final double width;

  MenuButtonPainter({@required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final spaceBetween = 12.0;

    Paint mainFigurePaint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..color = Colors.white;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(this.width, 0);

    path.moveTo(0, spaceBetween);
    path.lineTo(this.width, spaceBetween);

    canvas.drawPath(path, mainFigurePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
