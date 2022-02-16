import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:doctors_app/utils/utils.dart';

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
        height: MediaQuery.of(context).size.height * 1,
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  height: 34.h,
                  padding: EdgeInsets.all(2.h),
                  decoration: kBoxDecoWhite,
                  child: buildTableCalendar(),
                ),
                SizedBox(height: 2.0.h),
                const TimeGrid(),
                SizedBox(height: 2.0.h),
                InkWell(
                    child: Container(
                      height: 7.0.h,
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
                SizedBox(height: 2.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableCalendar<dynamic> buildTableCalendar() {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime.utc(2022, 01, 17),
      lastDay: DateTime.utc(2022, 01, 25),
      calendarFormat: CalendarFormat.twoWeeks,
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
        headerPadding: EdgeInsets.all(2.0.h),
        titleTextStyle: GoogleFonts.yantramanav(
            fontSize: 18.0.sp, fontWeight: FontWeight.w600),
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
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w600),
        weekdayStyle:
            GoogleFonts.yantramanav(color: Colors.black87, fontSize: 12.0.sp),
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
                    padding: EdgeInsets.all(2.h),
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
      height: 45.h,
      padding: EdgeInsets.all(2.0.h),
      decoration: kBoxDecoWhite,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(top: 2.0.h),
          child: Text(
            'Available Times',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: 32.h,
          child: GridView.builder(
              itemCount: bookingTime.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: (3.0 / 1),
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
                          padding: EdgeInsets.all(2.0.h),
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
              }),
        ),
      ]),
    );
  }
}
