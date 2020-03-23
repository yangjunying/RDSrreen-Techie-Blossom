import 'package:flutter/material.dart';
import '../bloc/drawer_bloc.dart';
import '../widgets/custom_switch.dart';

class UserProfileScreen extends StatelessWidget with DrawerStates {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CustomSwitch(
        isOn: false,
        activeBorderColor: Colors.white,
        inactiveBorderColor: Theme.of(context).primaryColor,
        borderWidth: 1,
        padding: 8,
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).scaffoldBackgroundColor,
        activeText: "ON",
        inactiveText: "OFF",
        activeTextStyle:
            TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        inactiveTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        activeThumbColor: Theme.of(context).scaffoldBackgroundColor,
        inactivThumbColor: Theme.of(context).scaffoldBackgroundColor,
        thumbHeight: 20,
      ),
    );
  }
}
