import 'package:ecommerseapp2023/src/common_Widgets/Form/form_header.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          onPressed: () {},
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
