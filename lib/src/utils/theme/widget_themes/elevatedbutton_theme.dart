import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ElevatedButtonTheme {
  ElevatedButtonTheme._(); //to avoid create instances

  /*---Light theme-- */

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: kprimaryColour,
      foregroundColor: kprimaryColourWhite,
      side: const BorderSide(color: kprimaryColour),
      padding: const EdgeInsets.symmetric(vertical: 10),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: kprimaryColour,
      foregroundColor: kprimaryColourWhite,
      side: const BorderSide(color: kprimaryColour),
      padding: const EdgeInsets.symmetric(vertical: 10),
    ),
  );
}
