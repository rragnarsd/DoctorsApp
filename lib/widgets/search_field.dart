import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          prefixIcon: const Icon(UniconsLine.search),
          suffixIcon: IconButton(
            icon: const Icon(UniconsLine.multiply),
            onPressed: () {},
          ),
          hintText: 'Search...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1.0,
              color: Color(0xff1651DA),
            ),
          ),
        ),
      ),
    );
  }
}
