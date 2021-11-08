import 'dart:ui';

import 'package:doctors_app/widgets/reusable_material_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'constants.dart';
import 'custom_nav_bar.dart';

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
              const TimeGrid(),
              const SizedBox(height: 20.0),
              InkWell(
                  child: Container(
                    height: 45.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color(0xff1651DA),
                    ),
                    child: Center(
                      child: Text(
                        'Book Appointment',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const CustomDialog();
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
      firstDay: DateTime.utc(2021, 11, 7),
      lastDay: DateTime.utc(2021, 11, 14),
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
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false,
        headerPadding: const EdgeInsets.all(20),
        titleTextStyle: GoogleFonts.yantramanav(
            fontSize: 24.0, fontWeight: FontWeight.w600),
      ),
      calendarStyle: const CalendarStyle(
        selectedDecoration:
            BoxDecoration(color: Color(0xffff6f00), shape: BoxShape.circle),
        todayDecoration:
            BoxDecoration(color: Color(0xff1651DA), shape: BoxShape.circle),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: GoogleFonts.yantramanav(
            color: const Color(0xff1651DA),
            fontSize: 16.0,
            fontWeight: FontWeight.w600),
        weekdayStyle:
            GoogleFonts.yantramanav(color: Colors.black87, fontSize: 16.0),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Appointment Confirmed',
        style: Theme.of(context).textTheme.headline2,
      ),
      content: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/confirm.gif',
            height: 200.0,
          ),
        ]),
      ),
      actions: [
        Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xff1651DA),
          child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              child: SizedBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomNavBar(),
                  ),
                );
              }),
        )
      ],
    );
  }
}

class TimeGrid extends StatefulWidget {
  const TimeGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeGrid> createState() => _TimeGridState();
}

class _TimeGridState extends State<TimeGrid> {
  bool hasBeenClicked = false;
  int clickedIndex = 0;

  List bookingTime = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: kBoxDecoWhite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Available Times',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: GridView.builder(
              itemCount: bookingTime.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: (3.5 / 1),
              ),
              itemBuilder: (context, index) {
                bool hasBeenClicked = index == clickedIndex;
                return Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(5.0),
                  color: hasBeenClicked ? const Color(0xffff6f00) : Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            bookingTime[index],
                            style: hasBeenClicked ? Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.white) : Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black87
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => setState(() {
                      clickedIndex = index;
                    })
                  ),
                );

                /*ReusableMaterialBtn(
                  text: bookingTime[index],
                  width: double.infinity,
                  color:
                      hasBeenClicked ? const Color(0xffff6f00) : Colors.white,
                  function: () {
                    setState(() {
                      clickedIndex = index;
                    });
                  },
                );*/
              }),
        ),
      ]),
    );
  }
}
