import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading, trailing, child;
  final String title;
  final double childHeight, height;
  final bool isBig;

  CustomAppBar(
      {Key key,
      this.title,
      this.leading,
      this.trailing,
      this.childHeight,
      this.height,
      this.isBig,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: _AppBarClipper(isBig: isBig, childHeight: childHeight),
          child: Container(
            padding: const EdgeInsets.only(top: 48),
            color: Theme.of(context).primaryColor,
            // color: Colors.green,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (leading != null) leading,
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: childHeight/2,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        )
      ],
    );
  }
}

class _AppBarClipper extends CustomClipper<Path> {
  final bool isBig;
  final double childHeight;

  _AppBarClipper({@required this.isBig, @required this.childHeight});

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double height = isBig ? size.height - childHeight : size.height;

    Path path = Path();
    path.moveTo(0, height - 40);
    path.quadraticBezierTo(size.width / 2, height, size.width, height - 40);
    // path.lineTo(size.width/2, size.height);
    // path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
