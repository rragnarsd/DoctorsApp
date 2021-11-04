import 'package:flutter/material.dart';

class NavGoBack extends StatelessWidget {
  final String title;
  const NavGoBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 20.0),
      )
    ]);
  }
}