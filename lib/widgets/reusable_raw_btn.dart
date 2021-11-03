import 'package:flutter/material.dart';

class ReusableRawBtn extends StatelessWidget {
  const ReusableRawBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(10.0),
      shape: const CircleBorder(),
      fillColor: Colors.white,
      elevation: 3.0,
      child: const Icon(
        Icons.phone,
        size: 26.0,
        color: Colors.pink,
      ),
      onPressed: () {},
    );
  }
}