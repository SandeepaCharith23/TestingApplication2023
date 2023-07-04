import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_model.dart';
import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/onboarding_screen/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_Widgets/Animation_Widgets/fade_in_animation_design.dart';
import '../../../../constants/image_path.dart';
import '../../../../constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  //Connect Splash Screen Controller with this page

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    // var height = mediaquery.size.height;

    var brightness = mediaquery.platformBrightness;

    final isDarkModeActivated = brightness == Brightness.dark;
    debugPrint("splashScrenn initialized");

    //FadeInAnimationController.find.startAnimation();

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimationSplashScreen();

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkModeActivated
            ? kBackgroundColorinDarkMode
            : kBackgroundColorinLightMode,
        // backgroundColor: Colors.amber,
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 5000,
              animation: TAnimationPosition(
                bottomAfter: 100,
                bottomBefore: -100,
                leftAfter: 0,
                leftBefore: -30,
              ),
              customChild: const Image(
                image: AssetImage(
                  splashScreenpath1,
                ),
              ),
            ),

            ///////////////////
            TFadeInAnimation(
              durationInMs: 5000,
              animation: TAnimationPosition(
                topAfter: 100,
                topBefore: -50,
                leftAfter: 100,
                leftBefore: -50,
              ),
              customChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testAppName,
                    style: TextStyle(
                      fontStyle:
                          Theme.of(context).textTheme.headlineSmall?.fontStyle,
                      fontFamily: "Lobster",
                      fontSize: 35,
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //////////////////////////////////
                  const Text(
                    testAppTagLine,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Aboreto",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),

                  const Text(
                    testAppTagLine1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Aboreto",
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      wordSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            // /////////////////////

            TFadeInAnimation(
              durationInMs: 5000,
              animation: TAnimationPosition(
                bottomAfter: 40,
                bottomBefore: -40,
                rightAfter: 40,
                rightBefore: -40,
              ),
              customChild: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kprimaryColour,
                ),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const OnBoardingScreen());
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
