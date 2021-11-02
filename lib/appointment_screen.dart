import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('My Appointment', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const AppointmentsColumn(),
              const SizedBox(height: 20.0,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white70
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 10.0,),
                  const Text(
                    'December',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: ListView(
                      children: const [
                        AppointmentTile(
                          appointDate: '12',
                          appointMonth: 'December',
                          doctorType: 'Dentist',
                          appointTime: '08:30 AM',
                          color: Colors.white,
                          textColor: Colors.black87,
                          iconColor: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class AppointmentsColumn extends StatelessWidget {
  const AppointmentsColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,  vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white70
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0,),
          const Text(
            'November',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              children: const [
                AppointmentTile(
                  appointDate: '10',
                  appointMonth: 'November',
                  doctorType: 'Heart Surgeon',
                  appointTime: '09:30 AM',
                  color: Colors.pink,
                  textColor: Colors.white,
                  iconColor: Colors.pink,
                ),
                SizedBox(
                  height: 20.0,
                ),
                AppointmentTile(
                  appointDate: '16',
                  appointMonth: 'November',
                  doctorType: 'ECG TEST',
                  appointTime: '11:30 AM',
                  color: Colors.blue,
                  textColor: Colors.white,
                  iconColor: Colors.blue,
                ),
                SizedBox(
                  height: 20.0,
                ),
                AppointmentTile(
                  appointDate: '25',
                  appointMonth: 'November',
                  doctorType: 'Medicine Doctor',
                  appointTime: '10:30 AM',
                  color: Colors.amber,
                  textColor: Colors.white,
                  iconColor: Colors.amber,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appointDate,
                style: TextStyle(
                  fontSize: 26.0,
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
            Text(
              appointTime,
              style: const TextStyle(fontSize: 16.0, color: Colors.black38),
            ),
          ],
        ),
        const Spacer(),
        RawMaterialButton(
          padding: const EdgeInsets.all(10.0),
          shape: const CircleBorder(),
          fillColor: Colors.white,
          elevation: 3.0,
          child: Icon(
            Icons.phone,
            size: 26.0,
            color: iconColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
