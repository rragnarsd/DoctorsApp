import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hairsaloon/doctor_screen.dart';
import 'package:hairsaloon/widgets/reusable_time_btn.dart';
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: kBoxDecoWhite,
                child: buildTableCalendar(),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Test',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              TimeGrid(bookingTime: bookingTime),
              const SizedBox(height: 20.0),
              ReusableTimeBtn(widget: const DoctorScreen(), btnText: 'Book Appointment', btnColor: Colors.amber.shade600, textColor: Colors.white,),
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




class TimeGrid extends StatelessWidget {
  const TimeGrid({
    Key? key,
    required this.bookingTime,
  }) : super(key: key);

  final List<String> bookingTime;

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
            for (var x in bookingTime)
              InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        x,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  onTap: () => {})
          ]),
    );
  }
}
