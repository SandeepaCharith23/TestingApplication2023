import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._(); //to avoid creating instance

  static TextTheme lightTextTheme = TextTheme(
    headline4: GoogleFonts.openSans(
      color: ktextColourinLight,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: ktextColourinLight,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
    subtitle1: GoogleFonts.poppins(
      color: ktextColourinLight,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline4: const TextStyle(
      color: ktextColourinDark,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: ktextColourinDark,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
    subtitle1: const TextStyle(
      color: ktextColourinDark,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
    bodyText1: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
  );
}
