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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  DoctorGridView(),
                ]),
          ),
        ),
      ),
    );
  }
}

class DoctorGridView extends StatelessWidget {
  const DoctorGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: List.generate(
          doctors.length,
          (index) => Container(
            decoration: kBoxDecoWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(doctors[index].doctorImage),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      doctors[index].doctorName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      doctors[index].doctorType,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14.0, color: Colors.black38),
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
                      child: Text('About',style: Theme.of(context).textTheme.bodyText1,),
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutDoctor(),
                      settings: RouteSettings(arguments: doctors[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
