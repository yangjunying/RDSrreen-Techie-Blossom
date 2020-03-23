import 'package:flutter/material.dart';
import '../bloc/drawer_bloc.dart';

class MyApplicationScreen extends StatelessWidget with DrawerStates {
  MyApplicationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue.shade600,
    );
  }
}
