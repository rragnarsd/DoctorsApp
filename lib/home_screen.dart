import 'dart:ui';

import 'package:doctors_app/widgets/cached_image.dart';
import 'package:doctors_app/widgets/reusable_material_btn.dart';
import 'package:doctors_app/widgets/reusable_raw_btn.dart';
import 'package:doctors_app/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        height: MediaQuery.of(context).size.height,
        decoration: kBoxDecoIndigo,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: HomeWidgets(),
        ),
      ),
    );
  }
}

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        SizedBox(
          height: 50.0,
        ),
        HomeSearchBar(),
        SizedBox(
          height: 20.0,
        ),
        HomeCalendar(),
        SizedBox(
          height: 20.0,
        ),
        HomeDoctorTile(
          doctorName: 'Dr. ChatBot',
          doctorImage:
              'https://images.pexels.com/photos/5733421/pexels-photo-5733421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          doctorType: 'Assistant',
        )
      ]),
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: kBoxDecoWhite,
      child: Column(
        children: [
          Text(
            'Let\'s find your doctor',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const RawBtnRow(),
          const SizedBox(
            height: 20.0,
          ),
          const SearchField(),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class RawBtnRow extends StatelessWidget {
  const RawBtnRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableRawBtn(
          icon: Icons.medication,
          iconColor: const Color(0xffff6f00),
          size: 26.0,
        ),
        ReusableRawBtn(
          icon: Icons.medical_services,
          iconColor: const Color(0xffDA165E),
          size: 26.0,
        ),
        ReusableRawBtn(
          icon: Icons.favorite,
          iconColor: const Color(0xff1565C0),
          size: 26.0,
        ),
        ReusableRawBtn(
          icon: Icons.accessible,
          iconColor: const Color(0xff0E7723),
          size: 26.0,
        ),
      ],
    );
  }
}

class HomeCalendar extends StatelessWidget {
  const HomeCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    firstDay: DateTime.utc(2021, 11, 7),
                    lastDay: DateTime.utc(2021, 11, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: GoogleFonts.yantramanav(
                        color: Colors.black87,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      headerPadding: const EdgeInsets.all(20),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        color: Color(0xff1651DA),
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle:
                          GoogleFonts.yantramanav(color: Colors.white),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: GoogleFonts.yantramanav(
                          color: const Color(0xff1651DA),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                      weekdayStyle: GoogleFonts.yantramanav(
                          color: Colors.black87, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
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
                style: Theme.of(context).textTheme.headline3,
              ),
              subtitle: Text(
                doctorType,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black38),
              ),
              trailing: CachedImage(
                doctorImage: doctorImage,
                height: 70.0,
                width: 70.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                'Available for your need',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color(0xff1651DA),
                    ),
              ),
              const Spacer(),
             ReusableMaterialBtn(text: 'Contact', width: 0.25, color: Colors.white,  function: (){},),
            ],
          )
        ],
      ),
    );
  }
}


