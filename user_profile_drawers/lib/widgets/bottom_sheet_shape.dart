import 'package:flutter/material.dart';

class BottomSheetShape extends ShapeBorder {
  // @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width/2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  // @override
  // bool shouldReclip(CustomClipper<Path> oldClipper) {
  //   // TODO: implement shouldReclip
  //   return true;
  // }

  @override 
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
    return null;
  }
  
}