import 'package:ecommerseapp2023/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onbordingcontroller = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Liquid Swip Screen
          LiquidSwipe(
            pages: onbordingcontroller.pages,
            liquidController: onbordingcontroller.controller,
            onPageChangeCallback:
                onbordingcontroller.onPageChangeCallBackmethod,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),

          //Outline Button
          Positioned(
            bottom: 30,
            child: OutlinedButton(
              onPressed: () {
                onbordingcontroller.animateTonextSlide();
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black12),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),

          //Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.offAll(() => const WelcomeScreen());
                // onbordingcontroller.skip();
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          //Animated Indicator
          Obx(
            () => Positioned(
              bottom: 5,
              child: AnimatedSmoothIndicator(
                activeIndex: onbordingcontroller.currentPagenumber.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
