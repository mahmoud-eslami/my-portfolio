import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Constants.creamColor
      ..strokeWidth = 15;

    var downerPath = Path();
    var upperPath = Path();

    downerPath.moveTo(0, size.height * 0.8);
    downerPath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      // destination
      size.width * 0.5,
      size.height * 0.8,
    );
    downerPath.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      // destination
      size.width * 1.0,
      size.height * 0.8,
    );
    downerPath.lineTo(size.width, size.height);
    downerPath.lineTo(0, size.height);

    upperPath.moveTo(0, size.height * 0.1);
    upperPath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.1,
      // destination
      size.width * 0.5,
      size.height * 0.2,
    );
    upperPath.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.3,
      // destination
      size.width * 1.0,
      size.height * 0.2,
    );
    upperPath.lineTo(size.width, 0);
    upperPath.lineTo(0, 0);

    canvas.drawPath(downerPath, paint);
    canvas.drawPath(upperPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
