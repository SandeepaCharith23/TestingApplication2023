import 'package:ecommerseapp2023/src/utils/theme/widget_themes/outlinedbutton_theme.dart';
import 'package:ecommerseapp2023/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:ecommerseapp2023/src/utils/theme/widget_themes/text_thems.dart';
import 'package:flutter/material.dart';

class CustomAppTheme {
  //1.Using Material colour as a LightThemeData
  // static ThemeData lightThemeData = ThemeData(
  //   brightness: Brightness.light,
  //   //primarySwatch: Colors.deepPurple,
  //   primarySwatch: const MaterialColor(
  //     0xFF3232ED,
  //     <int, Color>{
  //       50: Color(0xFFC6C6EB),
  //       100: Color(0xFFB0B0EB),
  //       200: Color(0xFF9494ED),
  //       300: Color(0xFF6969EC),
  //       400: Color(0xFF4747EB),
  //       500: Color(0xFF3232ED),
  //       600: Color(0xFF1D1DEB),
  //       700: Color(0xFF07078D),
  //       800: Color(0xFF07076B),
  //       900: Color(0xFF01011F),
  //     },
  //   ),
  // );

  //2.Using Material colour as a DarkThemeData
  // static ThemeData darkThemeData = ThemeData(
  //   brightness: Brightness.light,
  //   //primarySwatch: Colors.deepPurple,
  //   primarySwatch: const MaterialColor(
  //     0xFF3232ED,
  //     <int, Color>{
  //       50: Color(0xFFC6C6EB),
  //       100: Color(0xFFB0B0EB),
  //       200: Color(0xFF9494ED),
  //       300: Color(0xFF6969EC),
  //       400: Color(0xFF4747EB),
  //       500: Color(0xFF3232ED),
  //       600: Color(0xFF1D1DEB),
  //       700: Color(0xFF07078D),
  //       800: Color(0xFF07076B),
  //       900: Color(0xFF01011F),
  //     },
  //   ),
  // );

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
    outlinedButtonTheme: OutLinedButtonTheme.lightOutLinedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.darkTextTheme,
    outlinedButtonTheme: OutLinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );
}
