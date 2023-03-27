import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._(); //to avoid creating instance

  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: GoogleFonts.openSans(
      color: ktextColourinLight,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: ktextColourinLight,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
    titleMedium: GoogleFonts.poppins(
      color: ktextColourinLight,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinLight,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineMedium: const TextStyle(
      color: ktextColourinDark,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: ktextColourinDark,
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
    titleMedium: const TextStyle(
      color: ktextColourinDark,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: ktextColourinDark,
    ),
  );
}
