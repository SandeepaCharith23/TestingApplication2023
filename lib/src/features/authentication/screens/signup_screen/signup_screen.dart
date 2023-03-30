import 'package:ecommerseapp2023/src/common_Widgets/Form/form_header.dart';
import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/signup_screen/widgets/signup_form.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_path.dart';
import '../../../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery1 = MediaQuery.of(context);
    var brightness1 = mediaquery1.platformBrightness;

    final isDarkModeActivated1 = brightness1 == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkModeActivated1
            ? kBackgroundColorinDarkMode
            : kBackgroundColorinLightMode,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultpaddingSize),
              child: Column(
                children: [
                  const FormHeader(
                    imageheightratio: 0.3,
                    imagepath: sighUpScreenImage1,
                    text1: sighUpScreenText01,
                    text2: sighUpScreenText02,
                    heightbetween: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  /////////////////
                  const SignUpScreenForm(),

                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("OR"),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage(googlelogopath),
                            width: 20,
                            height: 20,
                          ),
                          label: const Text("Sign With Google"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Already have an Account?",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: "login",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ])),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
