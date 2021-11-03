import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/models/doctors.dart';
import 'package:hairsaloon/widgets/reusable_appointment_tile.dart';
import 'package:hairsaloon/widgets/reusable_time_btn.dart';

import 'constants.dart';

class ContactDoctorScreen extends StatelessWidget {
  const ContactDoctorScreen({Key? key}) : super(key: key);

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
                  decoration: kBoxDecoWhite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(radius: 40.0),
                      const SizedBox(height: 10.0,),
                      Text('Jane Andrews', style: TextStyle(fontSize: 20.0),),
                      const SizedBox(height: 20.0,),
                      ReusableTimeBtn(btnText: 'Start Conversation', btnColor: Colors.white70, textColor: Colors.black87,),
                      const SizedBox(height: 20.0,),
                      ReusableTimeBtn(btnText: 'Join Live Video Call', btnColor: Colors.blue, textColor: Colors.white,),
                    ],
                  ),
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
