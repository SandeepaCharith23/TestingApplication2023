import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._(); //to avoid creating instance

  static TextTheme lightTextTheme = TextTheme(
    headline5: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: kprimaryColour,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: kprimaryColour,
    ),
    subtitle1: const TextStyle(
      color: kprimaryColour,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline5: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: kprimaryColourInDark,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: kprimaryColourInDark,
    ),
    subtitle1: const TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
