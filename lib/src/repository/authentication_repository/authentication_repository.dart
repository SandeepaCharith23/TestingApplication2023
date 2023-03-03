import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:ecommerseapp2023/src/repository/authentication_repository/exception/signupwithemailandpassword_failure_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance; //its a private variable
  late final Rx<User?>
      firebaseCurrentUser; //this User is in Strem because,User details can change

  @override
  void onReady() {
    firebaseCurrentUser = Rx<User?>(
        _auth.currentUser); //This method will invoke at the very beginning
    firebaseCurrentUser.bindStream(_auth
        .userChanges()); //This means that whenever the user's authentication status changes, the firebaseCurrentUser variable will automatically update with the new user object or null value.
    ever(firebaseCurrentUser, _setInitialScreen);
  }

  //If user sign in to app ,he wii redirect to welcomeScreen otherwise he will rediredt to Dashboard screen
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
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
      // ignore: avoid_print
      print('Firebase Auth Exception -${ex.errormsg}');
    } catch (_) {
      const ex = SignUpwithEmailAndPasswordFailures();
      // ignore: avoid_print
      print(' Exception -${ex.errormsg}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
