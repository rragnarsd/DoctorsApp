import 'package:flutter/material.dart';

import 'package:doctors_app/models/models.dart';

List<AppointmentList> novAppointments = [
  AppointmentList(
      appointTime: '09:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xffDA165E),
      iconColor: const Color(0xffDA165E),
      doctorType: 'Heart Surgeon',
      appointDate: '10'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xff1651DA),
      iconColor: const Color(0xff1651DA),
      doctorType: 'ECG TEST',
      appointDate: '16'),
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'Nov',
      textColor: Colors.white,
      color: const Color(0xffff6f00),
      iconColor: const Color(0xffff6f00),
      doctorType: 'Radiologist',
      appointDate: '25'),
];

List<AppointmentList> decAppointments = [
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Dentist',
      appointDate: '12'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Physiologist',
      appointDate: '20'),
  AppointmentList(
      appointTime: '14:00 PM',
      appointMonth: 'Dec',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Neurologists',
      appointDate: '29'),
];


