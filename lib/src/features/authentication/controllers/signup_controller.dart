import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:ecommerseapp2023/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecommerseapp2023/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/forgetpassword_screen/forgetpassword_otp/forgetpassword_otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance =>
      Get.find(); //find where to need this SignUpController class

  //textEditing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final provinceName = TextEditingController();
  final districtName = TextEditingController();

  //create a function -which call at UI
  void registerNewUserFromUsernameandPassword(String email, String password) {
    //use the method which create in Authentication Repo
    String? error = AuthenticationRepository.instance
        .createUserWithEmailandPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  final userRepository = Get.put(UserRepository());

  Future<void> createnewUser(UserModel userModel) async {
    //use the method which create in Authentication Repo
    await userRepository.createUser(userModel);
    registerNewUserfromPhoneAuthentication(userModel.phoneNumber);
    //registerNewUserFromUsernameandPassword(userModel.emailAddress, userModel.passWord);
    Get.to(() => const OTPScreen());
  }

  void registerNewUserfromPhoneAuthentication(String phonenumber) {
    //use the method which create in Authentication Repo
    AuthenticationRepository.instance.phoneAuthentication(phonenumber);
  }
}
