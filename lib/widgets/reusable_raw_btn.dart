import 'package:flutter/material.dart';

class ReusableRawBtn extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  const ReusableRawBtn({
    Key? key,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(10.0),
      shape: const CircleBorder(),
      fillColor: Colors.white,
      elevation: 3.0,
      child: Icon(
        icon,
        size: 26.0,
        color: iconColor,
      ),
      onPressed: () {},
    );
  }
}