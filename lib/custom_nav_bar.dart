import 'package:flutter/material.dart';
import 'package:hairsaloon/booking_screen.dart';
import 'package:hairsaloon/chat_screen.dart';
import 'package:hairsaloon/constants.dart';
import 'package:hairsaloon/doctor_screen.dart';
import 'package:hairsaloon/home_screen.dart';
import 'package:unicons/unicons.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> pages = [
    HomeScreen(),
    ChatScreen(),
    DoctorScreen(),
    BookingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: kBoxDecoIndigo,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.pink,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.medical_square),
              label: 'Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.hospital),
              label: 'Book',
            ),
          ],
        ),
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
