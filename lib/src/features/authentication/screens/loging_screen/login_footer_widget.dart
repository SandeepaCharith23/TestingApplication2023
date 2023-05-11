import 'package:flutter/material.dart';

import '../../../../constants/image_path.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {},
            icon: const Image(
              image: AssetImage(loginScreenGooglelogo1),
              width: 20,
            ),
            label: const Text("Sign-In With Google"),
          ),
        ),
        TextButton(
          onPressed: () {
            // AuthServices().signInWithGoogle();
          },
          child: const Text.rich(
            TextSpan(
              text: "Already have an account?",
              children: [
                TextSpan(
                  text: "Sign-Up",
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
