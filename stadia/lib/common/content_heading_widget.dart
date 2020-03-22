import 'package:flutter/material.dart';
import '../config_index.dart';

class ContentHeadingWidget extends StatelessWidget {
  final String heading;

  ContentHeadingWidget({Key key,@required this.heading}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(heading,style: headingOneTextStyle,),
    );
  }
}
