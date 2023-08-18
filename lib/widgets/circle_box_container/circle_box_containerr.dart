import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Draws a circle if placed into a square widget.
/// https://stackoverflow.com/a/61246388/1321917
class CirclePainter extends CustomPainter {
  final _paint = Paint()
    //..imageFilter = Image("jugu.jpg")
    ..color = Colors.red
    ..strokeWidth = 2
    // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
