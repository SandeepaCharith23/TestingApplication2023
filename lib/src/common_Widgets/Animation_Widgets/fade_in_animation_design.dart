import 'package:ecommerseapp2023/src/common_Widgets/Animation_Widgets/fade_in_animation_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fade_in_animation_controller.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.animation,
    required this.customChild,
  }) : super(key: key);

  final controller1 = Get.put(FadeInAnimationController());
//  final FadeInAnimationController splashControllerScreen;
  final int durationInMs;
  final TAnimationPosition? animation;
  final Widget customChild;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        bottom: controller1.animate.value
            ? animation!.bottomAfter
            : animation!.bottomBefore,
        top: controller1.animate.value
            ? animation!.topAfter
            : animation!.topBefore,
        left: controller1.animate.value
            ? animation!.leftAfter
            : animation!.leftBefore,
        right: controller1.animate.value
            ? animation!.rightAfter
            : animation!.rightBefore,
        duration: Duration(milliseconds: durationInMs),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller1.animate.value ? 1 : 0,
          child: customChild,
        ),
      ),
    );
  }
}
