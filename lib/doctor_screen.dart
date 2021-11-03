import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairsaloon/about_doctor.dart';
import 'package:hairsaloon/utils/doctor_lists.dart';

import 'constants.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Doctors',
                  style: TextStyle(fontSize: 22.0),
                )
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: GridView.count(
                  childAspectRatio: 2 / 2.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    for (var i in doctors)
                      DoctorTile(
                        doctorName: i.doctorName,
                        doctorType: i.doctorType,
                        doctorImage: i.doctorImage,
                      )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final String doctorName;
  final String doctorType;
  final String doctorImage;
/*  final String doctorLocation;
  final int doctorExperience;
  final int doctorPatients;
  final String doctorAbout;*/
  const DoctorTile({
    Key? key,
    required this.doctorName,
    required this.doctorType,
    required this.doctorImage,
/*    required this.doctorLocation,
      required this.doctorExperience,
      required this.doctorPatients,
      required this.doctorAbout*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(doctorImage),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                doctorName,
                style: kTextStyleNormal,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                doctorType,
                style: kTextStyleSmall
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                  child: Text(
                'About',
                style: kTextStyleNormal
              )),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutDoctor(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
