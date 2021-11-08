import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReusableTimeBtn extends StatelessWidget {
  Widget? widget;
  final String btnText;
  final Color btnColor;
  final Color textColor;
  ReusableTimeBtn({
    Key? key,
    this.widget,
    required this.btnText,
    required this.btnColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 7.5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: btnColor,
        ),
        child: Center(
          child: Text(
              btnText,
              style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor)
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget!,
        ),
      ),
    );
  }
}