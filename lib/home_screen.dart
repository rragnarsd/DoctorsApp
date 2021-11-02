import 'package:flutter/material.dart';
import 'package:hairsaloon/appointment_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat format = CalendarFormat.twoWeeks;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<String> bookingTime = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTableCalendar(),
                const SizedBox(height: 40.0),
                const Text(
                  'Test',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20.0),
                TimeGrid(bookingTime: bookingTime),
                const SizedBox(height: 40.0),
                const TimeBookingBtn()
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
      firstDay: DateTime.utc(2021, 11, 1),
      lastDay: DateTime.utc(2021, 11, 9),
      calendarFormat: format,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      onFormatChanged: (CalendarFormat _format) {
        setState(() {
          format = _format;
        });
      },
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
            BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        todayDecoration:
            BoxDecoration(color: Colors.blue.shade600, shape: BoxShape.circle),
      ),
    );
  }
}

class TimeBookingBtn extends StatelessWidget {
  const TimeBookingBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.amber.shade600,
        ),
        child: const Center(
          child: Text(
            'Book Appoinment',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ), onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AppointmentScreen(),
      ),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (3 / 1),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            for (var x in bookingTime)
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text(
                      x,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                onTap: () => {}
              )
          ]),
    );
  }
}
