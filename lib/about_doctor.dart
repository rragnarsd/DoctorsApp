import 'package:doctors_app/widgets/cached_image.dart';
import 'package:doctors_app/widgets/reusable_list_tile.dart';
import 'package:doctors_app/widgets/reusable_time_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'constants.dart';
import 'models/doctors.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  DoctorWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  DoctorAbout(),
                  SizedBox(
                    height: 20.0,
                  ),
                  ReusableListTile()
                ]),
          ),
        ),
      ),
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(children: [
        const AboutTile(),
        const SizedBox(
          height: 20.0,
        ),
        const DoctorPatientCard(),
        const SizedBox(
          height: 30.0,
        ),
        //ATH
        ReusableTimeBtn(
          btnText: 'Book Appointment',
          btnColor: const Color(0xff1651DA),
          textColor: Colors.white,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ]),
    );
  }
}

class DoctorPatientCard extends StatelessWidget {
  const DoctorPatientCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorCard(
          title: 'Patients',
          color: const Color(0xffff6f00),
          number: '${doctor.doctorPatients}',
        ),
        DoctorCard(
          title: 'Experience',
          color: const Color(0xffDA165E),
          number: '${doctor.doctorExperience}',
        ),
      ],
    );
  }
}

class AboutTile extends StatelessWidget {
  const AboutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return SizedBox(
      width: 95.w,
   /*   width: MediaQuery.of(context).size.width * 0.95,*/
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          doctor.doctorName,
          style: Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text(
          doctor.doctorType,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.black38),
        ),
        trailing: CachedImage(doctorImage: doctor.doctorImage, height: 60.0, width: 60.0,),
      ),
    );
  }
}

class UpcomingDate extends StatelessWidget {
  const UpcomingDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wed'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '11',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ]);
  }
}

class DoctorAbout extends StatelessWidget {
  const DoctorAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctors;
    return Container(
      height: 20.h,
      /*height: MediaQuery.of(context).size.height * 0.18,*/
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About ${doctor.doctorName}',
              style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            doctor.doctorAbout,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String title;
  final String number;
  final Color color;
  const DoctorCard(
      {Key? key,
      required this.title,
      required this.number,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 5.0,
      decoration: kBoxDecoWithBoxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${number}+',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
