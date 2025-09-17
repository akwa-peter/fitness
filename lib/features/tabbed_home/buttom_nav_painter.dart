import 'package:fitness/utilities/color_pallet.dart';
import 'package:flutter/material.dart';

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
    Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);

    // Start center curve
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 15);

    // dip for FAB
    path.arcToPoint(
      Offset(size.width * 0.60, 15),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    // curve back up
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Palette.black, 20, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}