import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/drawer_bloc.dart';

import './widgets/drawer_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile Setting App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          // primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white)),
      home: BlocProvider<DrawerBloc>(
        create: (context) => DrawerBloc(),
        child: DrawerLayout(),
      ),
    );
  }
}
