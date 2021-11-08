import 'package:flutter/material.dart';

var kBoxDecoIndigo = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.30),
      Colors.indigo.withOpacity(0.10),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    stops: const [0.0, 1.0],
  ),

);

var kBoxDecoWhite = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Colors.white.withOpacity(0.08)),
  gradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(0.5),
        Colors.white.withOpacity(0.2),
      ],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      stops: const [0.0, 1.0],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.indigo.withOpacity(0.02),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);

var kBoxDecoWithBoxShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);
