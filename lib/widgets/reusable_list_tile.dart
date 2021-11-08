import 'package:flutter/material.dart';

import '../appointment_screen.dart';
import '../constants.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Schedule',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20.0,),
          AppointmentTile(
            color: const Color(0xffff6f00),
            appointDate: '11',
            doctorType: 'Heart Surgeon',
            iconColor: const Color(0xffff6f00),
            textColor: Colors.white,
            appointTime: '09:00 AM',
            appointMonth: 'Dec',
          ),
        ],
      ),
    );
  }
}

