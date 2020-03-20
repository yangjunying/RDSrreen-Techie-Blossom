import 'package:flutter/material.dart';

import './ui/homepage/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xFFFF4700),
      ),
      home: HomePage(),
    );
  }
}
