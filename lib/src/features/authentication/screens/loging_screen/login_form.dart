import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_options/forgetpassword_model_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: "Email address",
                hintText: "Enter Your Email address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.password_outlined,
                ),
                labelText: "Password",
                hintText: "Enter Your Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Get.to(() => const ForgetPasswordScreen());
                  ForgetPasswordModelBottomSheet.buildShowModalBottomSheet(
                      context);
                },
                child: const Text("Forget Password ?"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const DashboardScreen());
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
