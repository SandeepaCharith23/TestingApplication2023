import 'package:ecommerseapp2023/login_page.dart';
import 'package:ecommerseapp2023/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomAppTheme.lightThemeData,
      darkTheme: CustomAppTheme.darkThemeData,
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}
