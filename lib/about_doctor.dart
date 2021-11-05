import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/models/doctors.dart';
import 'package:hairsaloon/widgets/reusable_list_tile.dart';
import 'package:hairsaloon/widgets/reusable_raw_btn.dart';
import 'package:unicons/unicons.dart';

import 'constants.dart';

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
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
     /*   const SizedBox(
          height: 30.0,
        ),
        ReusableTimeBtn(
          widget: const CustomNavBar(),
          btnText: 'Book Appointment',
          btnColor: Colors.blue.shade600,
          textColor: Colors.white,
        ),*/
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
          color: Colors.amber.shade600,
          number: '${doctor.doctorPatients}',
        ),
        DoctorCard(
          title: 'Experience',
          color: Colors.pink.shade600,
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
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          doctor.doctorName,
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          doctor.doctorType,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black38),
        ),
        trailing: CircleAvatar(
          backgroundImage: NetworkImage(doctor.doctorImage),
          radius: 25.0,
        ),
      ),
    );
  }
}

class UpcomingTile extends StatelessWidget {
  const UpcomingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      child: Row(children: [
        Container(
          width: 80,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.amber.shade600,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const UpcomingDate(),
        ),
        const SizedBox(
          width: 15.0,
        ),
        const UpcomingTextTile(),
        const Spacer(),
        const ReusableRawBtn(
          icon: UniconsLine.phone,
          iconColor: Colors.blue,
        ),
      ]),
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

class UpcomingTextTile extends StatelessWidget {
  const UpcomingTextTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Heart Surgeon', style: Theme.of(context).textTheme.headline5),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          '09:00 AM',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black38),
        ),
      ],
    );
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
      height: MediaQuery.of(context).size.height * 0.20,
      padding: const EdgeInsets.all(15.0),
      decoration: kBoxDecoWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Doctor', style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            doctor.doctorAbout,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5),
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
