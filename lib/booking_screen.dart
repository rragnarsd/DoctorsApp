import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hairsaloon/custom_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'constants.dart';
import 'utils/appointment_lists.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: kBoxDecoWhite,
                child: buildTableCalendar(),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Available Times',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              TimeGrid(bookingTime: bookingTime),
              const SizedBox(height: 20.0),
              InkWell(
                  child: Container(
                    height: 45.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.shade600
                    ),
                    child: Center(
                      child: Text(
                        'Book Appointment',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Appointment Confirmed'),
                            content: SingleChildScrollView(
                              child: Column(children: [
                                Image.asset(
                                  'assets/confirm.gif',
                                  height: 200.0,
                                ),
                                /*  ListBody(
                                  children: [
                                    const Text('Hello'),
                                    Text(
                                      'Date ${selectedDay.toString().substring(0, 10)}',
                                    ),
                                  ],
                                ),*/
                              ]),
                            ),
                            actions: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomNavBar(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Continue',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              )
                            ],
                          );
                        });
                  }),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  TableCalendar<dynamic> buildTableCalendar() {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime.utc(2021, 11, 1),
      lastDay: DateTime.utc(2021, 11, 9),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDay, date);
      },
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false,
        headerPadding: EdgeInsets.all(20),
        titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration:
            BoxDecoration(color: Colors.amber.shade600, shape: BoxShape.circle),
        todayDecoration:
            BoxDecoration(color: Colors.blue.shade600, shape: BoxShape.circle),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.blue, fontSize: 16.0),
        weekdayStyle: TextStyle(color: Colors.black87, fontSize: 16.0),
      ),
    );
  }
}

class TimeGrid extends StatefulWidget {
  const TimeGrid({
    Key? key,
    required this.bookingTime,
  }) : super(key: key);

  final List<String> bookingTime;

  @override
  State<TimeGrid> createState() => _TimeGridState();
}

class _TimeGridState extends State<TimeGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: kBoxDecoWhite,
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (3.5 / 1),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            for (var x in widget.bookingTime)
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  x,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
          ]),
    );
  }
}
