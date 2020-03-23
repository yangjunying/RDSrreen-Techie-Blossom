import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  DrawerItem({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}


class DrawerSubItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  DrawerSubItem({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
      ),
    );
  }
}