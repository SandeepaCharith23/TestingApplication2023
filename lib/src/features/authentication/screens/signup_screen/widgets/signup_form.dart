import 'package:flutter/material.dart';

class SignUpScreenForm extends StatelessWidget {
  const SignUpScreenForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("First Name"),
              hintText: "Enter Your First address",
              prefixIcon: Icon(Icons.person_outline_outlined),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.password_outlined,
              ),
              labelText: "Password",
              hintText: "Enter Your Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
