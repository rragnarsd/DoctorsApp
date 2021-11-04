import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/booking_screen.dart';
import 'package:hairsaloon/chat_screen.dart';
import 'package:hairsaloon/widgets/reusable_appointment_tile.dart';
import 'package:hairsaloon/widgets/reusable_time_btn.dart';

import 'constants.dart';

class ContactDoctorScreen extends StatelessWidget {
  final String image;
  final String doctorName;
  const ContactDoctorScreen(
      {Key? key, required this.image, required this.doctorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: kBoxDecoWhite.copyWith(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.02),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ContactDoctor(image: image, doctorName: doctorName),
                ),
                const ReusableAppointmentTile()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactDoctor extends StatelessWidget {
  const ContactDoctor({
    Key? key,
    required this.image,
    required this.doctorName,
  }) : super(key: key);

  final String image;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: 'doctorHero',
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(image),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          doctorName,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReusableTimeBtn(
          btnText: 'Start Conversation',
          btnColor: Colors.white70,
          textColor: Colors.black87,
          widget: const ChatScreen(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ReusableTimeBtn(
          btnText: 'Book Appointment',
          btnColor: Colors.blue,
          textColor: Colors.white,
          widget: const BookingScreen(),
        ),
      ],
    );
  }
}
