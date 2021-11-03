import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/utils/appointment_lists.dart';
import 'package:hairsaloon/widgets/reusable_raw_btn.dart';

import 'about_doctor.dart';
import 'constants.dart';
import 'models/appointments.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20.0,
              ),
              const NavGoBack(
                title: 'Appointments',
              ),
              AppointmentsColumn(
                list: novAppointments,
                month: 'November',
              ),
              const SizedBox(
                height: 20.0,
              ),
              AppointmentsColumn(
                list: decAppointments,
                month: 'December',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class AppointmentsColumn extends StatelessWidget {
  final List<AppointmentList> list;
  final String month;
  const AppointmentsColumn({
    Key? key,
    required this.list,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              children: [
                for (var i in list)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: AppointmentTile(
                      appointDate: i.appointDate,
                      appointMonth: i.appointMonth,
                      textColor: i.textColor,
                      iconColor: i.iconColor,
                      appointTime: i.appointTime,
                      doctorType: i.doctorType,
                      color: i.color,
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final String appointDate;
  final String appointMonth;
  final Color textColor;
  final Color color;
  final Color iconColor;
  final String doctorType;
  final String appointTime;
  const AppointmentTile({
    Key? key,
    required this.appointDate,
    required this.appointMonth,
    required this.textColor,
    required this.iconColor,
    required this.appointTime,
    required this.doctorType,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 90.0,
          width: 90,
          decoration: kBoxDecoWithBoxShadow
              .copyWith(color: color, boxShadow: [BoxShadow(color: color)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appointDate,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Text(
                appointMonth,
                style: TextStyle(fontSize: 16.0, color: textColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorType,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(appointTime,
                style: kTextStyleNormal.copyWith(
                    color: Colors.black38, fontWeight: FontWeight.normal)),
          ],
        ),
        const Spacer(),
        const ReusableRawBtn(icon: Icons.phone, iconColor: Colors.pink,),
      ],
    );
  }
}
