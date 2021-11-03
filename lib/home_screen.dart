import 'package:flutter/material.dart';
import 'package:hairsaloon/widgets/reusable_raw_btn.dart';
import 'package:table_calendar/table_calendar.dart';

import 'constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 60.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: kBoxDecoWhite,
                child: Column(
                  children: [
                    const Text(
                      'Let\'s find your doctor',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        ReusableRawBtn(
                          icon: Icons.medication,
                          iconColor: Colors.amber.shade600,
                        ),
                        const ReusableRawBtn(
                          icon: Icons.medical_services,
                          iconColor: Colors.pink,
                        ),
                        const ReusableRawBtn(
                          icon: Icons.favorite,
                          iconColor: Colors.blue,
                        ),
                        const ReusableRawBtn(
                          icon: Icons.accessible,
                          iconColor: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {

                          },
                        ),
                        hintText: 'Search...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 1.0, color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: kBoxDecoWhite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TableCalendar(
                              firstDay: DateTime.utc(2021, 11, 1),
                              lastDay: DateTime.utc(2021, 11, 7),
                              focusedDay: DateTime.now(),
                              /*calendarController: _calendarController,*/
                              calendarFormat: CalendarFormat.week,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              headerStyle: const HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false,
                                titleTextStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                ),
                                leftChevronVisible: false,
                                rightChevronVisible: false,
                                headerPadding: EdgeInsets.all(20),
                              ),
                              calendarStyle: CalendarStyle(
                                todayDecoration: BoxDecoration(
                                    color: Colors.amber.shade600,
                                    shape: BoxShape.circle),
                                todayTextStyle: const TextStyle(color: Colors.white),
                              ),
                              daysOfWeekStyle: const DaysOfWeekStyle(
                                weekendStyle: TextStyle(color: Colors.blue),
                                weekdayStyle: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const HomeDoctorTile(
                doctorName: 'Dr. ChatBot',
                doctorImage:
                    'https://images.pexels.com/photos/5733421/pexels-photo-5733421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                doctorType: 'Assistant',
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class HomeDoctorTile extends StatelessWidget {
  const HomeDoctorTile({
    Key? key,
    required this.doctorName,
    required this.doctorType,
    required this.doctorImage,
  }) : super(key: key);

  final String doctorName;
  final String doctorType;
  final String doctorImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                doctorName,
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0),
              ),
              subtitle: Text(
                doctorType,
                style: const TextStyle(fontSize: 16.0),
              ),
              trailing: Hero(
                tag: 'doctorHero',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(doctorImage),
                  radius: 30.0,
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                'Available for your need',
                style: TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              OutlinedButton(onPressed: () {}, child: const Text('Contact'))
            ],
          )
        ],
      ),
    );
  }
}
