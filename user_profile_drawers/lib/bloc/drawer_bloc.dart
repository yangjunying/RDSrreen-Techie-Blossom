// import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../pages/user_profile_screen.dart';
import '../pages/notification_screen.dart';

enum DrawerEvents {
  ProfileEvent,
  NotificationEvent,
  MyAppEvent,
  MyLocationEvent
}

abstract class DrawerStates {}

class DrawerBloc extends Bloc<DrawerEvents, DrawerStates> {
  @override
  // TODO: implement initialState
  DrawerStates get initialState => UserProfileScreen();

  @override
  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case DrawerEvents.ProfileEvent:
        yield UserProfileScreen();
        break;
      case DrawerEvents.NotificationEvent:
        yield NotificationScreen();
        break;
      case DrawerEvents.MyAppEvent:
        break;
      case DrawerEvents.MyLocationEvent:
        break;
    }
    // return null;
  }
}
