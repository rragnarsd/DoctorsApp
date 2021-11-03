import 'package:flutter/material.dart';

import '../about_doctor.dart';

class ReusableAppointmentTile extends StatelessWidget {
  const ReusableAppointmentTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Upcoming schedule',
            style: TextStyle(fontSize: 20.0, letterSpacing: 1.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.0,
          ),
          UpcomingTile()
        ],
      ),
    );
  }
}