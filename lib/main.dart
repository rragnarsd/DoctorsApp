import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                TableCalendar(
                  firstDay: DateTime.utc(2021, 11, 1),
                  lastDay: DateTime.utc(2021, 11, 9),
                  focusedDay: DateTime.now(),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Test',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (3 / 1),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        for (var x in bookingTime)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(x),
                            ),
                          )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
