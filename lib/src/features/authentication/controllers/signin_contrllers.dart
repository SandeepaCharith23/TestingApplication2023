import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:ecommerseapp2023/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static SignInController get instance => Get.find();

  //create a variable to find that user is already assigned or not
  var isSignIn = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  var ispasswordHidden = true.obs;

  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> usersignInWithEmailandPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Login Successfully",
        "You have Login successfully to this App",
        backgroundColor: Colors.greenAccent,
      );
      Get.offAll(() => const DashboardScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("user-not-found", "This user cannot find in Database");
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            "Wrong Password", "Please check your Username and Password");
      }
    }
  }

  void handleAuthStateChanged(bool isLoggedInAlrady) {
    if (isLoggedInAlrady) {
      Get.offAll(const DashboardScreen(), arguments: firebaseAuth.currentUser);
    } else {
      Get.offAll(const SignUpScreen());
    }
  }
}
