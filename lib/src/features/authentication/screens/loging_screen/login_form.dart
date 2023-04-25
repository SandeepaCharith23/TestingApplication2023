import 'package:ecommerseapp2023/src/features/authentication/controllers/signin_contrllers.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/forgetpassword_screen/forgetpassword_options/forgetpassword_model_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(SignInController());

    final formkey1 = GlobalKey<FormState>();

    return Form(
      key: formkey1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            //Email Address field
            TextFormField(
              controller: controllers.firstNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: "Email address",
                hintText: "Enter Your Email address",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your Email address';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),

            //Password TextField
            //PassWordTextField(controllers: controllers),
            Obx(
              () => TextFormField(
                controller: controllers.passwordController,
                obscureText: SignInController.instance.ispasswordHidden.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  labelText: "Password",
                  hintText: "Enter Your Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      SignInController.instance.ispasswordHidden.value =
                          !SignInController.instance.ispasswordHidden.value;
                    },
                    icon: Icon(SignInController.instance.ispasswordHidden.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  // if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                  //   return 'Password must contain at least one letter';
                  // }
                  // if (!RegExp(r'[0-9]').hasMatch(value)) {
                  //   return 'Password must contain at least one number';
                  // }
                  // if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                  //   return 'Password must contain at least one special character';
                  // }
                  return null;
                },
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
                  if (formkey1.currentState!.validate()) {
                    SignInController.instance.usersignInWithEmailandPassword(
                        controllers.firstNameController.text.trim(),
                        controllers.passwordController.text.trim());
                  }
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

class PassWordTextField extends StatefulWidget {
  const PassWordTextField({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  final SignInController controllers;

  @override
  State<PassWordTextField> createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllers.passwordController,
      obscureText: SignInController.instance.ispasswordHidden.value,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
        ),
        labelText: "Password",
        hintText: "Enter Your Password",
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              SignInController.instance.ispasswordHidden.value =
                  !SignInController.instance.ispasswordHidden.value;
            },
            icon: Icon(SignInController.instance.ispasswordHidden.value
                ? Icons.visibility
                : Icons.visibility_off)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Your Password';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        // if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
        //   return 'Password must contain at least one letter';
        // }
        // if (!RegExp(r'[0-9]').hasMatch(value)) {
        //   return 'Password must contain at least one number';
        // }
        // if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
        //   return 'Password must contain at least one special character';
        // }
        return null;
      },
    );
  }
}
