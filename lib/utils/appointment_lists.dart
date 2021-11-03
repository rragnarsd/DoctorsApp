import 'package:flutter/material.dart';

import '../models/appointments.dart';

List<AppointmentList> novAppointments = [
  AppointmentList(
      appointTime: '09:30 AM',
      appointMonth: 'November',
      textColor: Colors.white,
      color: Colors.pink,
      iconColor: Colors.pink,
      doctorType: 'Heart Surgeon',
      appointDate: '10'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'November',
      textColor: Colors.white,
      color: Colors.blue,
      iconColor: Colors.blue,
      doctorType: 'ECG TEST',
      appointDate: '16'),
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'November',
      textColor: Colors.white,
      color: Colors.amber,
      iconColor: Colors.amber,
      doctorType: 'Medicine Doctor',
      appointDate: '25'),
];

List<AppointmentList> decAppointments = [
  AppointmentList(
      appointTime: '10:30 AM',
      appointMonth: 'December',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Dentist',
      appointDate: '12'),
  AppointmentList(
      appointTime: '11:30 AM',
      appointMonth: 'December',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Physiologist',
      appointDate: '20'),
  AppointmentList(
      appointTime: '14:00 PM',
      appointMonth: 'December',
      textColor: Colors.black87,
      color: Colors.white,
      iconColor: Colors.black87,
      doctorType: 'Neurologists',
      appointDate: '29'),
];

List<String> bookingTime = [
  '09:00 AM',
  '09:30 AM',
  '10:00 AM',
  '10:30 AM',
  '11:00 AM',
  '11:30 AM',
];
