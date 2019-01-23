import 'package:flutter/material.dart';

class BorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final padding = 40.0;
    final space = size.width / 4;
    final heightBorder = size.height - padding;
    final path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, heightBorder);
    path.quadraticBezierTo(space / 2, size.height * 1.06, space, heightBorder);
    path.quadraticBezierTo(space + (space / 2), size.height * 1.03, space * 2, heightBorder);
    path.quadraticBezierTo((space * 2) + (space / 2), size.height * 1.04, space * 3, heightBorder);
    path.quadraticBezierTo((space * 3) + (space / 2), size.height * 1.07, space * 4, heightBorder);
    path.lineTo(size.width, heightBorder);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}