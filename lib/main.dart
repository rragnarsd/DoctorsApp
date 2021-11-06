import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline4: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline2: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(fontSize: 18.0, letterSpacing: 1.0),
          headline5: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
        ),
      ),
      home: const CustomNavBar(),
    );
  }
}
