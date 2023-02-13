import 'package:flutter/material.dart';

import '../../../../constants/image_path.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage(onboardScreen1Image),
      ),
    );
  }
}
