import 'package:ecommerseapp2023/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';

class SplashControllerScreen extends GetxController {
  static SplashControllerScreen get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 3000));
    // ignore: use_build_context_synchronously
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const WelcomeScreen(),
    //     ));

    //Using GetX package to navigate
    Get.to(const WelcomeScreen());
  }
}
