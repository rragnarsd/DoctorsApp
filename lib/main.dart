import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'custom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     /* builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 800,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),*/
      debugShowCheckedModeBanner: false,
      title: 'Doctors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.yantramanav(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline4: GoogleFonts.yantramanav(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline3: GoogleFonts.yantramanav(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          headline2: GoogleFonts.yantramanav(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            color: Colors.black87,
          ),
          bodyText1: GoogleFonts.yantramanav(
            fontSize: 16.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
          bodyText2:
              GoogleFonts.yantramanav(fontSize: 18.0, letterSpacing: 1.0),
          headline5:
              GoogleFonts.yantramanav(fontSize: 20.0, letterSpacing: 1.0),
        ),
      ),
      home: const CustomNavBar(),
    );
  }
}
