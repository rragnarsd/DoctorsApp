import 'dart:ui';

class AppointmentList {
  String appointTime;
  String appointMonth;
  Color textColor;
  Color color;
  Color iconColor;
  String doctorType;
  String appointDate;

  AppointmentList(
      {required this.appointTime,
        required this.appointMonth,
        required this.textColor,
        required this.color,
        required this.iconColor,
        required this.doctorType,
        required this.appointDate});
}