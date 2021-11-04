import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/utils/appointment_lists.dart';
import 'package:hairsaloon/widgets/nav_go_back.dart';
import 'package:hairsaloon/widgets/reusable_raw_btn.dart';

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
          Text(month, style: Theme.of(context).textTheme.headline2),
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
          decoration: kBoxDecoWithBoxShadow.copyWith(color: color, boxShadow: [
            BoxShadow(color: color),
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appointDate,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600),
              ),
              Text(
                appointMonth,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600),
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
            Text(doctorType, style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              appointTime,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black38),
            ),
          ],
        ),
        const Spacer(),
         ReusableRawBtn(
          icon: Icons.phone,
          iconColor: iconColor,
        ),
      ],
    );
  }
}
