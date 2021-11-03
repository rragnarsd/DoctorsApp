import 'package:flutter/material.dart';

var kBoxDecoIndigo = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.indigo.withOpacity(0.10),
      Colors.white.withOpacity(0.05),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topCenter,
  ),
);

var kBoxDecoWhite = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Colors.white.withOpacity(0.08)),
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.6),
      Colors.white.withOpacity(0.05),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  ),
);

var kBoxDecoWithBoxShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.white.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ],
);

const kTextStyleSmall = TextStyle(fontSize: 14.0, letterSpacing: 1.0);

const kTextStyleNormal = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.0,
  color: Colors.black87
);

const kTextStyleBtnText = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w600,
  color: Colors.white,
  letterSpacing: 1.0,
);