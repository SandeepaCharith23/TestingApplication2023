import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/features/authentication/controllers/splash_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/image_path.dart';
import '../../../../constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  //Connect Splash Screen Controller with this page
  final splashControllerScreen = Get.put(SplashControllerScreen());

  @override
  Widget build(BuildContext context) {
    splashControllerScreen.startAnimation();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.amber,
        body: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                bottom: splashControllerScreen.animate.value ? 100 : -100,
                left: splashControllerScreen.animate.value ? 0 : -30,
                duration: const Duration(milliseconds: 1600),
                child: const Image(
                  image: AssetImage(
                    splashScreenpath1,
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                top: splashControllerScreen.animate.value ? 100 : -50,
                left: splashControllerScreen.animate.value ? 100 : -50,
                duration: const Duration(milliseconds: 1600),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashControllerScreen.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testAppName,
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        testAppTagLine,
                        style: GoogleFonts.aboreto(
                          textStyle: Theme.of(context).textTheme.headline5,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                bottom: splashControllerScreen.animate.value ? 40 : -40,
                right: splashControllerScreen.animate.value ? 40 : -40,
                duration: const Duration(milliseconds: 1600),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kprimaryColour,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
