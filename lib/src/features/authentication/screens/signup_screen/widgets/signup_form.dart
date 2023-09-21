import 'package:ecommerseapp2023/src/features/authentication/controllers/signup_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreenForm extends StatefulWidget {
  const SignUpScreenForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenForm> createState() => _SignUpScreenFormState();
}

class _SignUpScreenFormState extends State<SignUpScreenForm> {
  String initialCountry = 'LK';
  PhoneNumber number = PhoneNumber(isoCode: 'LK');

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
            //1.First Name TextField
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.firstNameController,
              decoration: const InputDecoration(
                label: Text("First Name"),
                hintText: "Enter Your First Name",
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
            ),

            const SizedBox(
              height: 10,
            ),

            //2.Email address TextField
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

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your Email Address';
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

            //3.Mobile Phone TextField
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.phoneNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your Mobile Phone Number';
                }
                if (!RegExp(r'^\+?\d{11}$').hasMatch(value)) {
                  return 'Please enter a valid mobile phone number of 11 with +94 ';
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

            //3.Mobile Phone TextField
            // InternationalPhoneNumberInput(
            //   onInputChanged: (PhoneNumber value) {
            //     // print(value);
            //   },
            //   onInputValidated: (bool value) {
            //     // print(value);
            //   },
            //   hintText: "Phone Number",
            //   errorMessage: "Invalid phone Number",
            //   selectorConfig: const SelectorConfig(
            //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            //   ),
            //   ignoreBlank: false,
            //   autoValidateMode: AutovalidateMode.disabled,
            //   selectorTextStyle: const TextStyle(color: Colors.black),
            //   initialValue: number,
            //   textFieldController: controller.phoneNumberController,
            //   formatInput: true,
            //   keyboardType: TextInputType.phone,
            //   inputBorder: const OutlineInputBorder(),
            //   onSaved: (PhoneNumber number) {
            //     print('On Saved: $number');
            //   },
            // ),

            //////////////////////////
            const SizedBox(
              height: 10,
            ),

            //4.Password TextField
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
            const SizedBox(
              height: 10,
            ),

            //5.Province TextField
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.provinceName,
              decoration: const InputDecoration(
                label: Text("Province"),
                hintText: "Enter Your Province",
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //6.District TextField
            TextFormField(
              //4.Assign Controllers to every TextForm Filed
              controller: controller.districtName,
              decoration: const InputDecoration(
                label: Text("District"),
                hintText: "Enter Your District",
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //1.Sign with username and Password -Normal way
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //5.First check the formkey had Validated
                  if (_formkey.currentState!.validate()) {
                    //create a User Model and pass it to controller use SignwithEmaiandPassword form Auth
                    final usermodel = UserModel(
                      firstName: controller.firstNameController.text.trim(),
                      emailAddress: controller.emailController.text.trim(),
                      phoneNumber: controller.phoneNumberController.text.trim(),
                      passWord: controller.passwordController.text.trim(),
                      district: controller.districtName.text.trim(),
                      province: controller.districtName.text.trim(),
                      userId: '',
                      userprofileImage: null,
                    );

                    SignUpController.instance
                        .createnewUserWithEmailandPasswordAuthentication(
                            usermodel);
                  }
                },
                child: const Text("Sign Up with email and Password"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //2.Sign up with your Mobile Number Button-Mobile OTP verification
            const SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                // onPressed: () {
                //   //5.First check the formkey had Validated
                //   if (_formkey.currentState!.validate()) {
                //     //3.create a User Model and pass it to controller
                //     final usermodel = UserModel(
                //       firstName: controller.firstNameController.text.trim(),
                //       emailAddress: controller.emailController.text.trim(),
                //       phoneNumber: controller.phoneNumberController.text.trim(),
                //       passWord: controller.passwordController.text.trim(),
                //       district: controller.districtName.text.trim(),
                //       province: controller.districtName.text.trim(),
                //       userId: '',
                //     );

                //     //print number
                //     Get.snackbar(
                //         signUpWithMobileOTPsnackbarText, usermodel.phoneNumber);

                //     SignUpController.instance
                //         .createnewUserWithPhoneAuthentication(usermodel);
                //   }
                // },
                child: Text("Sign Up with Your Mobile Number"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //This method is used in InternationalPhoneNumberInput
  // void getPhoneNumber(PhoneNumber phoneNumber) async {
  //   PhoneNumber number1 = await PhoneNumber.getRegionInfoFromPhoneNumber(
  //       phoneNumber as String, 'LK');

  //   setState(() {
  //     number = number1;
  //   });
  // }

  // Future<String> formatPhoneNumber(String phoneNumber, String isoCode) {
  //   final phoneNumberUtil = PhoneNumberUtil();
  //   final parsedNumber =
  //       phoneNumberUtil.parse(phoneNumber, regionCode: isoCode) as String;
  //   return phoneNumberUtil.format(parsedNumber, "PhoneNumberFormat.E164");
  // }
}
