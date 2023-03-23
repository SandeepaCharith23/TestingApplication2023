import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_model.dart';
import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

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

    // FadeInAnimationController.find.startAnimation();

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
              durationInMs: 1600,
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
              durationInMs: 1600,
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
                    style: GoogleFonts.lobster(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                      fontSize: 35,
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //////////////////////////////////
                  Text(
                    testAppTagLine,
                    style: GoogleFonts.aboreto(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                  ),
                ],
              ),
            ),

            // /////////////////////

            TFadeInAnimation(
              durationInMs: 1600,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
