// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class OutLinedButtonTheme {
  OutLinedButtonTheme._(); //to avoid create instances

  /*---Light theme-- */

  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    foregroundColor: kprimaryColour,
    side: const BorderSide(color: kprimaryColour),
    padding: const EdgeInsets.symmetric(vertical: 10),
  ));

  static final darkOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    foregroundColor: kprimaryColourInDark,
    side: const BorderSide(color: kprimaryColourInDark),
    padding: const EdgeInsets.symmetric(vertical: 10),
  ));
}
