import 'package:ecommerseapp2023/src/common_Widgets/Form/form_header.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/loging_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final formkey2 = GlobalKey<FormState>();

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
                  key: formkey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("Enter Email address"),
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a your email address';
                          }
                          if (!isValidEmail(value)) {
                            return 'Please enter a Valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey2.currentState!.validate()) {
                              if (isValidEmail(emailController.text)) {
                                _sendPasswordResetEmail(
                                    context, emailController.text);
                              }
                            }
                            // Get.to(() => const OTPScreen());
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

  bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  Future<void> _sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // ignore: use_build_context_synchronously
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text(
      //         'Password reset email sent successfully,Please response to that email'),
      //     backgroundColor: Colors.green,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );

      Get.snackbar(
        "Password reset email sent successfully",
        "Please response to that email",
        //colorText: Colors.green,
        backgroundColor: Colors.greenAccent.shade100,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(LineAwesomeIcons.envelope_open_text),
      );

      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Failed to send password reset email: ${e.message}'),
      //     backgroundColor: Colors.red,
      //     behavior: SnackBarBehavior.floating,
      //   ),
      // );

      Get.snackbar(
        "Failed to send password reset email",
        ": ${e.message}",
        //colorText: Colors.green,
        backgroundColor: Colors.redAccent.shade100,
        snackPosition: SnackPosition.TOP,
        icon: const Icon(LineAwesomeIcons.exclamation_triangle),
      );

      Get.offAll(() => const LoginScreen());
    }
  }
}
