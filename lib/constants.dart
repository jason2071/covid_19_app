import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF473F97);
const kSecondaryColor = Color(0xFF979797);
const kBackgroundColor = Color(0xFFF2F2F2);
const kActiveColor = Color(0xFF4C79FF);

const kGradientColor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFFAEA1E5), Color(0xFF56549E)],
);

final kShadow = BoxShadow(
  spreadRadius: 1,
  blurRadius: 20,
  color: Colors.black12,
);

const kAnimationDuration = Duration(milliseconds: 250);
