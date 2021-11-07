import 'package:doctors_app/utils/doctor_lists.dart';
import 'package:doctors_app/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_doctor.dart';
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
      height: MediaQuery.of(context).size.height * 0.87,
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
                CachedImage(doctorImage: doctors[index].doctorImage, height: 70.0, width: 70.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      doctors[index].doctorName,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      doctors[index].doctorType,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black38),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: OutlinedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutDoctor(),
                        settings: RouteSettings(arguments: doctors[index]),
                      ),
                    ),
                    child: Text(
                      'About',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
