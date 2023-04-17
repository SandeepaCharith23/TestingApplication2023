import 'package:ecommerseapp2023/src/common_Widgets/Form/form_header.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_otp/forgetpassword_otp_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/loging_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.to(() => const LoginScreen());
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            "Back",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(kDefaultpaddingSize),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const FormHeader(
                  imageheightratio: 0.3,
                  imagepath: forgetpasswordScreenImage1,
                  text1: forgetPasswordthroughMailtext01,
                  text2: forgetPasswordthroughMailtext02,
                  heightbetween: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Enter Email address"),
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const OTPScreen());
                          },
                          child: const Text("Next"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
