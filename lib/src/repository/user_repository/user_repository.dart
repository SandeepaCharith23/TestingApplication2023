import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/text_string.dart';

class UserRepository extends GetxController {
  //static instance of UserRepository
  static UserRepository get instance => Get.find();

  //create a Firebase Firestore instance
  final _dbinstance = FirebaseFirestore.instance;

  //create a method -For creating a new User
  createUser(UserModel usermodel) async {
    await _dbinstance
        .collection("User")
        .add(usermodel.toJson())
        .whenComplete(() => Get.snackbar(
              titleUserAccountSuccessfullycreated,
              messageUserAccountSuccessfullycreated,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.3),
              colorText: Colors.green,
            ))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar(
        titleUserAccountFailed,
        messageUserAccountFailed,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.3),
        colorText: Colors.red,
      );
      // print(error);
    });
  }

  //process-fetch Data from FirebaseDB-step2-Fetch single User Details
  Future<UserModel> getSingleUserDetails(String currentuseremail) async {
    //1.get the DataSnapshots of Users
    final datasnapshotuser = await _dbinstance
        .collection("User")
        .where("EmailAddress", isEqualTo: currentuseremail)
        .get();

    //2.convert snapshot to Map using method in User model class
    final singleuserData =
        datasnapshotuser.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return singleuserData;
  }

  //process-fetch Data from FirebaseDB-step2-Fetch all USers  Details
  Future<List<UserModel>> getMultipleUserDetails() async {
    //1.get the DataSnapshots of Users
    final datasnapshotsuser = await _dbinstance.collection("User").get();

    //2.convert snapshot to Map using method in User model class
    final multipleuserData =
        datasnapshotsuser.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    return multipleuserData;
  }

  //create a method to update user details after user change own information
  Future<void> updateUserDetails(UserModel userModel) async {
    await _dbinstance
        .collection("User")
        .doc(userModel.firstName)
        .update(userModel.toJson());
  }
}
