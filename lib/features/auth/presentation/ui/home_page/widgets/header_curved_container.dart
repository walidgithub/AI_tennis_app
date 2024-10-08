import 'package:flutter/material.dart';
import 'package:weather_app/core/imports/features_imports.dart';

class HeaderCurvedContainer extends CustomPainter {
  BuildContext context;
  HeaderCurvedContainer({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.cOrange;
    double height = MediaQuery.sizeOf(context).height * 0.5.h;
    Path path = Path()
      ..relativeLineTo(0, 300.h)
      ..quadraticBezierTo(size.width / 2.w, height, size.width, 300.h)
      ..relativeLineTo(0, -300.h)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}