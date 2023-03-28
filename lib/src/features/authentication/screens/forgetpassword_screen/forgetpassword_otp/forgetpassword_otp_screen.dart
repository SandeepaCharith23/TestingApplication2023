import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';
import 'package:ecommerseapp2023/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OTPController());
    // ignore: prefer_typing_uninitialized_variables
    var otp;
    var mediaquery1 = MediaQuery.of(context);
    var brightness1 = mediaquery1.platformBrightness;
    final isDarkModeActivated1 = brightness1 == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkModeActivated1
          ? kBackgroundColorinDarkMode
          : kBackgroundColorinLightMode,
      body: Container(
        padding: const EdgeInsets.all(kDefaultpaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(forgetPasswordthroughOTPtext01,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                )),
            Text(
              forgetPasswordthroughOTPtext02.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "$forgetPasswordthroughOTPtext03 +94******** ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black12,
              filled: true,
              cursorColor: Colors.black,
              onSubmit: (code) {
                //print("OTP is => $code");

                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text("Next"),
                ))
          ],
        ),
      ),
    );
  }
}
