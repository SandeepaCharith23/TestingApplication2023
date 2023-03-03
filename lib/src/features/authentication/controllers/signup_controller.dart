import 'package:ecommerseapp2023/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance =>
      Get.find(); //find where to need this SignUpController class

  //textEditing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  //create a function -which call at UI
  void registerNewUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailandPassword(email, password);
  }
}
