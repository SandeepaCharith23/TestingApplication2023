import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: kColorofTextInputinLightMode,
    floatingLabelStyle: TextStyle(
      color: kColorofTextInputinLightMode,
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      width: 2.0,
      color: kColorofTextInputinLightMode,
    )),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: kColorofTextInputinDarkMode,
    floatingLabelStyle: TextStyle(
      color: kColorofTextInputinDarkMode,
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      width: 2.0,
      color: kColorofTextInputinDarkMode,
    )),
  );
}
