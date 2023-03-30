import 'package:ecommerseapp2023/src/features/authentication/screens/welcome_screen/welcome_screen.dart';

import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimationSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 5000));

    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));

    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 5600));

    //Get.to(() => const WelcomeScreen());
    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 5000));

    animate.value = true;

    //Get.to(() => const WelcomeScreen());
    // Get.offAll(() => const WelcomeScreen());
  }
}
