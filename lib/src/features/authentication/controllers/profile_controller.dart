import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';

import 'package:ecommerseapp2023/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecommerseapp2023/src/repository/user_repository/user_repository.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //Method-getUserData()-method for fetch Data from FirebaseDB-step-3-Get Emailaddress and password from current user to userRepository to fetch user records
  Future<UserModel?> getUserData() async {
    //get the email address of current user
    final currentuseremailaddress = _authRepo.firebaseCurrentUser.value?.email;

    //get the details using given email address
    if (currentuseremailaddress != null) {
      return await _userRepo.getSingleUserDetails(currentuseremailaddress);
    } else {
      Get.snackbar(
          "Error in finding Current User", "Please Login to Continue Process");
    }
    return null;
  }

  //Method-getAllUser()-method for  getting information of all current available users in firebase Database
  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.getMultipleUserDetails();
  }

  //Method-updateUserRecord-method for  update user Details
  updateUserRecord(UserModel usermodel) async {
    await _userRepo.updateUserDetails(usermodel);
    // Get.back();
    // Get.to(() => const DashboardScreen());
  }
}
