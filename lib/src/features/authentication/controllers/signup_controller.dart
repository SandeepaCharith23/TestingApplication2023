import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:ecommerseapp2023/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecommerseapp2023/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final userRepository = Get.put(UserRepository());

  //Method-createnewUserWithPhoneAuthentication-create a new method for creating new user using sign in with Email and Password ,then User mobile phone number authentiaction
  Future<void> createnewUserWithPhoneAuthentication(UserModel userModel) async {
    //1.use the method which create in Authentication Repo
    await userRepository.createUser(userModel);

    //2.veify phone number and signIn with phone Number
    registerNewUserfromPhoneAuthentication(userModel);

    //4.forward to OTP Screen
    Get.to(() => const OTPScreen());
  }

  /////////////////////////////////////////////////////////////

  //Method-createnewUserWithEmailandPasswordAuthentication-method for creating new user with their email address and password
  Future<void> createnewUserWithEmailandPasswordAuthentication(
      UserModel userModel) async {
    //1.use the method which create in Authentication Repo
    await userRepository.createUser(userModel);

    //2.create a new user using emai and password
    registerNewUserFromUsernameandPassword(
        userModel.emailAddress, userModel.passWord);
  }

  ////////////////////////////////////////////////////////////////

  //Method-registerNewUserfromPhoneAuthentication-method for mobile phone number authentication
  void registerNewUserfromPhoneAuthentication(UserModel userModel) {
    //use the method which create in Authentication Repo+verify phone number
    AuthenticationRepository.instance
        .phoneAuthentication(userModel.phoneNumber);
  }

  //////////////////////////////////////////////////////////////////////
  //Method-registerNewUserFromUsernameandPassword-method for creating new user using their emailaddress and password
  void registerNewUserFromUsernameandPassword(String email, String password) {
    //use the method which create in Authentication Repo
    try {
      AuthenticationRepository.instance
          .createUserWithEmailandPassword(email, password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
  }
}
