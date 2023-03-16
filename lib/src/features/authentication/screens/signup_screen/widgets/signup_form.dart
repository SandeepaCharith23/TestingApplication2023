import 'package:ecommerseapp2023/src/features/authentication/controllers/signup_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_otp/forgetpassword_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenForm extends StatelessWidget {
  const SignUpScreenForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1.call to the controller
    final controller = Get.put(SignUpController());

    //2.give a Global Key for Form
    // ignore: no_leading_underscores_for_local_identifiers
    final _formkey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Form(
        //3.Initialized the form key
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.firstNameController,
              decoration: const InputDecoration(
                label: Text("First Name"),
                hintText: "Enter Your First Name",
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter your First Name';
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: "Email address",
                hintText: "Enter Your Email address",
                border: OutlineInputBorder(),
              ),

              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter Your Email Address';
              //   }
              //   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
              //       .hasMatch(value)) {
              //     return 'Please enter a valid email';
              //   }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.phoneNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your Mobile Phone Number';
                }
                if (!RegExp(r'^\+?\d{10,12}$').hasMatch(value)) {
                  return 'Please enter a valid mobile phone number';
                }

                return null;
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android_rounded,
                ),
                labelText: "Phone Number",
                hintText: "Enter Your Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.password_outlined,
                ),
                labelText: "Password",
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
              ),

              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter Your Password';
              //   }
              //   if (value.length < 8) {
              //     return 'Password must be at least 8 characters long';
              //   }
              //   // if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
              //   //   return 'Password must contain at least one letter';
              //   // }
              //   // if (!RegExp(r'[0-9]').hasMatch(value)) {
              //   //   return 'Password must contain at least one number';
              //   // }
              //   // if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
              //   //   return 'Password must contain at least one special character';
              //   // }
              //   return null;
              // },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //5.First check the formkey had Validated
                  if (_formkey.currentState!.validate()) {
                    //SignUpController.instance.registerNewUser(controller.emailController.text.trim(),controller.passwordController.text.trim());

                    SignUpController.instance
                        .registerNewUserfromPhoneAuthentication(
                            controller.phoneNumberController.text.trim());
                    Get.to(() => const OTPScreen());
                  }
                },
                child: const Text("Sign Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
