import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:ecommerseapp2023/src/repository/authentication_repository/exception/signupwithemailandpassword_failure_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance; //its a private variable
  late final Rx<User?>
      firebaseCurrentUser; //this User is in Strem because,User details can change
  var verificationId = ""
      .obs; //verificationId is null ,but it will obsernable,when it change value will automatically update

  @override
  void onReady() {
    //1.set reactive current user as our variable
    firebaseCurrentUser = Rx<User?>(
        _auth.currentUser); //This method will invoke at the very beginning

    //2.update the current user immediately ,when user signin or signout from app
    firebaseCurrentUser.bindStream(_auth
        .userChanges()); //This means that whenever the user's authentication status changes, the firebaseCurrentUser variable will automatically update with the new user object or null value.
    //3.what to do when current user changes,listen to the firebasecurrent user
    ever(firebaseCurrentUser, _setInitialScreen);
  }

  //4.This method shows -If user sign in to app ,he will redirect to welcomeScreen otherwise he will rediredt to Dashboard screen
  _setInitialScreen(User? user) {
    debugPrint("Inside authentication_repository._setInitialScreen method");
    user == null
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => const DashboardScreen());
  }

  Future<void> createUserWithEmailandPassword(
      String email1, String password1) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email1, password: password1);

      firebaseCurrentUser.value != null
          ? Get.offAll(() => const DashboardScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpwithEmailAndPasswordFailures.code(e.code);
      // ignore: avoid_print
      print('Firebase Auth Exception -${ex.errormsg}');
    } catch (_) {
      const ex = SignUpwithEmailAndPasswordFailures();
      // ignore: avoid_print
      print(' Exception -${ex.errormsg}');
      throw ex;
    }
  }

  Future<void> loginWithEmailandPassword(
      String email1, String password1) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email1, password: password1);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpwithEmailAndPasswordFailures.code(e.code);

      if (kDebugMode) {
        print('Firebase Auth Exception -----${ex.errormsg}');
      }
    } catch (_) {
      const ex = SignUpwithEmailAndPasswordFailures();
      // ignore: avoid_print
      print(' Exception -${ex.errormsg}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  //funtion -OTP verification and send it to create a new user
  Future<void> phoneAuthentication(String phonenumber) async {
    //1.Verify phone number through OTP msg
    await _auth.verifyPhoneNumber(
      phoneNumber: phonenumber,

      //2.create a new user using credentials or show up a message
      verificationCompleted: (credentials) async {
        await _auth.signInWithCredential(credentials);

        Get.snackbar("signIn Method", "SuccessFully sign With Phone Number");
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar(
              'Error', "The provided Mobile phone number is not valid");
        } else {
          Get.snackbar('Error', "Something went wrong,Try again");
        }
      },
    );
  }

  //funtion -OTP verification
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
