import 'package:ecommerseapp2023/src/features/authentication/screens/splash_screen/splash_screen.dart';

import 'package:ecommerseapp2023/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightThemeData,
      darkTheme: CustomAppTheme.darkThemeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
