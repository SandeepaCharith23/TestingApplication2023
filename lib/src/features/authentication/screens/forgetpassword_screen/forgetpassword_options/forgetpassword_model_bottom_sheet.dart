import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_mail/forgetpassword_mail.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_options/forgetpassword_banner_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordModelBottomSheet {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(kDefaultpaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              forgetPasswordScreenText01,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              forgetPasswordScreenText02,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            ForgetPasswordBanner(
              forgetPasswordBanner1text01: forgetPasswordBanner1text01,
              forgetPasswordBanner1text02: forgetPasswordBanner1text02,
              icon1: Icons.email_outlined,
              pressedmethod: () {
                Navigator.pop(context); //close the Bottom sheet
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),

            // ForgetPasswordBanner(
            //   forgetPasswordBanner1text01: forgetPasswordBanner2text01,
            //   forgetPasswordBanner1text02: forgetPasswordBanner2text02,
            //   icon1: Icons.mobile_friendly_outlined,
            //   pressedmethod: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
