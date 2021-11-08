import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:doctors_app/screens/screens.dart';
import 'package:doctors_app/utils/utils.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      padding: EdgeInsets.all(2.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Schedule',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20.0,),
          const AppointmentTile(
            color: Color(0xffff6f00),
            appointDate: '11',
            doctorType: 'Heart Surgeon',
            iconColor: Color(0xffff6f00),
            textColor: Colors.white,
            appointTime: '09:00 AM',
            appointMonth: 'Dec',
          ),
        ],
      ),
    );
  }
}

