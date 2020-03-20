import 'package:flutter/material.dart';
import '../../styleguide.dart';

class HomePageBackground extends StatelessWidget{
  final screnHeight;

  const HomePageBackground({Key key, @required this.screnHeight}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  final themeData = Theme.of(context);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: screnHeight * 0.5,
        color: themeData.primaryColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();
    Offset curveStartPoint = Offset(0,size.height*0.85);
    Offset curveEndPoint = Offset(size.width,size.height*0.85);

    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}