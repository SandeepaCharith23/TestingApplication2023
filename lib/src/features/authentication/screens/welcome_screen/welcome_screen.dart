import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_design.dart';
import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_model.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/loging_screen/login_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_Widgets/Animation_Widgets/fade_in_animation_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_path.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var height = mediaquery.size.height;

    var brightness = mediaquery.platformBrightness;

    final isDarkModeActivated = brightness == Brightness.dark;

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    return Scaffold(
      backgroundColor: isDarkModeActivated
          ? kBackgroundColorinDarkMode
          : kBackgroundColorinLightMode,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animation: TAnimationPosition(
              bottomAfter: 0,
              bottomBefore: -100,
              topAfter: 0,
              topBefore: 0,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            customChild: Container(
              padding: const EdgeInsets.all(kDefaultpaddingSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: const AssetImage(welcomeScreenImage1),
                    height: height * 0.6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        welcomeScreenText01,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        welcomeScreenText02,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              login.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              signUp.toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
