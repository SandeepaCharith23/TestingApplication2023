import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../features/authentication/screens/splash_screen/splash_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimationSplashScreen() async {
    debugPrint("Inside FadeInAnimationController.startAnimationSplashScreen");
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = true;
    // await Future.delayed(const Duration(milliseconds: 3000));
    // animate.value = false;
    // await Future.delayed(const Duration(milliseconds: 3000));
    // animate.value = true;
    Get.to(() => const SplashScreen());
    //Get.to(() => const WelcomeScreen());
    //Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    debugPrint("Inside FadeInAnimationController.startAnimation");
    await Future.delayed(const Duration(milliseconds: 2000));

    animate.value = true;

    //Get.to(() => const WelcomeScreen());
    // Get.offAll(() => const WelcomeScreen());
  }
}
