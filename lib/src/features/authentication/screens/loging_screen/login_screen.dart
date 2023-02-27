import 'package:ecommerseapp2023/src/common_Widgets/Form/form_header.dart';
import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_path.dart';
import '../../../../constants/text_string.dart';
import 'login_footer_widget.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery1 = MediaQuery.of(context);
    var brightness1 = mediaquery1.platformBrightness;

    final isDarkModeActivated1 = brightness1 == Brightness.dark;
    var size = MediaQuery.of(context).size;

    var height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkModeActivated1
            ? kBackgroundColorinDarkMode
            : kBackgroundColorinLightMode,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormHeader(
                  height: height,
                  imagepath: loginScreenImage1,
                  text1: signUpHeaderText01,
                  text2: signUpHeaderText02,
                ),
                const LoginForm(),
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
