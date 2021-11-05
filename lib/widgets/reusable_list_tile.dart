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
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 20.0,),
          AppointmentTile(
            color: Colors.amber.shade600,
            appointDate: '11',
            doctorType: 'Heart Surgeon',
            iconColor: Colors.amber.shade600,
            textColor: Colors.white,
            appointTime: '09:00 AM',
            appointMonth: 'Dec',
          ),
        ],
      ),
    );
  }
}

