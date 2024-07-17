import 'package:flutter/material.dart';

class clipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    Path path = Path();
    path.moveTo(0, 0);

    // path.quadraticBezierTo(0, height * 0.4, width * 0.35, height * 0.4);

    path.quadraticBezierTo(width * 0.5, height * 0.2, width, 0);
    // path.quadraticBezierTo(width, height, width, 0);

    path.lineTo(width, height);
    path.lineTo(0, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
