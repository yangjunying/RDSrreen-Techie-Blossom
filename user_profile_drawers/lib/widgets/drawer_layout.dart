import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_drawers/pages/notification_screen.dart';
import 'package:user_profile_drawers/pages/user_profile_screen.dart';
import '../bloc/drawer_bloc.dart';
import './drawer_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_sheet_shape.dart';

class DrawerLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          key: _scaffoldKey,
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<DrawerBloc, DrawerStates>(
                builder: (context, DrawerStates state) {
                  return CustomAppBar(
                    isBig: (state is UserProfileScreen),
                    height: (state is UserProfileScreen) ? 250 : 150,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Container(
                        child: Center(
                          child: Icon(Icons.menu),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                      ),
                    ),
                    title: findeSelectedTitle(state),
                    trailing: IconButton(
                      icon: Container(
                        child: Center(
                          child: Icon(Icons.settings),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                    childHeight: 100,
                    child: (state is UserProfileScreen)
                        ? ClipOval(
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              // padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Icon(Icons.person,
                                    color: Theme.of(context).primaryColor),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2)),
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<DrawerBloc, DrawerStates>(
                  builder: (context, DrawerStates state) {
                    return state as Widget;
                  },
                ),
              ),
            ],
          ),
          endDrawer: _right_menu_drawer(context, orientation),
        );
      },
    );
  }

  String findeSelectedTitle(DrawerStates state) {
    if (state is UserProfileScreen) {
      return "User Profile";
    } else {
      assert(state is NotificationScreen);
      return "Notifications";
    }
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.only(top: 24, bottom: 16, left: 48, right: 38),
            height: 180,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Laura, are you sure you want to sign out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Text(
                          'Sign out',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 1),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Stay logged in',
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget _right_menu_drawer(BuildContext context, Orientation orientation) {
    return ClipPath(
      clipper: _DrawerClipper(),
      child: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: (orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.width),
            padding: const EdgeInsets.only(top: 48, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                DrawerItem(
                  text: 'Profile',
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<DrawerBloc>(context)
                        .add(DrawerEvents.ProfileEvent);
                  },
                ),
                DrawerItem(
                  text: 'My Devices',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'My Applications',
                  onPressed: () {},
                ),
                DrawerSubItem(
                  text: 'Music & Podcast',
                  onPressed: () {},
                ),
                DrawerSubItem(
                  text: 'Navigation',
                  onPressed: () {},
                ),
                DrawerSubItem(
                  text: 'Radio',
                  onPressed: () {},
                ),
                DrawerSubItem(
                  text: 'Tv & Video',
                  onPressed: () {},
                ),
                DrawerSubItem(
                  text: 'Productivity',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'My Location',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Launguage',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Privacy',
                  onPressed: () {},
                ),
                DrawerItem(
                  text: 'Nodifications',
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<DrawerBloc>(context)
                        .add(DrawerEvents.NotificationEvent);
                  },
                ),
                DrawerItem(
                  text: 'About',
                  onPressed: () {},
                ),
                Spacer(),
                // SizedBox(height: 50,),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _openSignOutDrawer(context);
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Not Laura? ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: "Sign out?",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      )
                    ]),
                  ),
                ),
                // Text('Profile'),
                // Text('Notifications'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();

    // Offset st = Offset(0,0);

    // path.moveTo(50, 0);
    // path.lineTo(0, size.height/2);
    // path.lineTo(50, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.close();
    const double x_offset = 50;
    path.moveTo(x_offset, 0);
    path.quadraticBezierTo(0, size.height / 2, x_offset, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
