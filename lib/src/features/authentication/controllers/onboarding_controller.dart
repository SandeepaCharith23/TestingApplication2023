import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../common_Widgets/onboard_screen_view.dart';
import '../../../constants/image_path.dart';
import '../../../constants/text_string.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPagenumber = 0.obs;

  final pages = [
    //firt Page
    const OnBoardScreenWidget(
      color: Colors.white,
      imageSizeRatio: 0.3,
      imagepath: onboardScreen1Image,
      mainText: testOnboardingScreen1MainText,
      subText: testOnboardingScreen1SubText,
      count: testOnboardingScreen1count1,
    ),
    //Second Page
    const OnBoardScreenWidget(
      color: Colors.lightBlue,
      imageSizeRatio: 0.5,
      imagepath: onboardScreen2Image,
      mainText: testOnboardingScreen2MainText,
      subText: testOnboardingScreen2SubText,
      count: testOnboardingScreen2count1,
    ),

    //Third Page
    const OnBoardScreenWidget(
      color: Colors.white,
      imageSizeRatio: 0.6,
      imagepath: onboardScreen3Image,
      mainText: testOnboardingScreen3MainText,
      subText: testOnboardingScreen3SubText,
      count: testOnboardingScreen3count1,
    ),
  ];

  void onPageChangeCallBackmethod(int activePageIndex) {
    currentPagenumber.value = activePageIndex;
  }

  skip() => controller.jumpToPage(page: 2);
  animateTonextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
