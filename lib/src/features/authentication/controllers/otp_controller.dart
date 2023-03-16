import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  //1.create an instance
  static OTPController get instance => Get.find();

  //2.create method for verify otp
  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashboardScreen()) : Get.back();
  }
}
