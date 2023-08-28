import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/text_string.dart';

class UserRepository extends GetxController {
  //Instance-static instance of UserRepository
  static UserRepository get instance => Get.find();

  //Instance-create a Firebase Firestore instance
  final _dbinstance = FirebaseFirestore.instance;

  //Instance-reactive varible which have user details
  Rxn<UserModel> user = Rxn<UserModel>();

  //   @override
  // void onInit() {
  //   super.onInit();
  //   _dbinstance.authSta teChanges().listen((user) {
  //     if (user == null) {
  //       this.user.value = null;
  //     } else {
  //       this.user.value = UserModel(uid: user.uid, email: user.email);
  //     }
  //   });
  // }

  //Method-createUser-create a method -For creating a new User
  createUser(UserModel usermodel) async {
    Future<String> userId = generateCutomUserId(Timestamp.now());
    usermodel.userId = await userId;
    final documentreference =
        _dbinstance.collection("User").doc(usermodel.userId);
    await documentreference
        .set(usermodel.toJson())
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

  //Method-getSingleUserDetails-process-fetch Data from FirebaseDB-step2-Fetch single User Details
  Future<UserModel> getSingleUserDetails(String currentuseremail) async {
    //1.get the DataSnapshots of Users
    final datasnapshotuser = await _dbinstance
        .collection("User")
        .where("EmailAddress", isEqualTo: currentuseremail)
        .limit(1) //limit only one user which have emailaddress
        .get();

    //2.convert snapshot to Map using method in User model class
    final singleuserData =
        datasnapshotuser.docs.map((e) => UserModel.fromSnapShot(e)).single;
    return singleuserData;
  }

  //Method-getMultipleUserDetails-process-fetch Data from FirebaseDB-step2-Fetch all USers  Details
  Future<List<UserModel>> getMultipleUserDetails() async {
    //1.get the DataSnapshots of Users
    final datasnapshotsuser = await _dbinstance.collection("User").get();

    //2.convert snapshot to Map using method in User model class
    final multipleuserData =
        datasnapshotsuser.docs.map((e) => UserModel.fromSnapShot(e)).toList();
    return multipleuserData;
  }

  //Method-updateUserDetails-create a method to update user details after user change own information
  Future<void> updateUserDetails(UserModel userModel) async {
    await _dbinstance
        .collection("User")
        .doc(userModel.userId)
        .update(userModel.toJson());
  }

  //Method-generateCutomUserId-Generate Custom User Id as primary key of data
  Future<String> generateCutomUserId(Timestamp timestamp) async {
    DateTime dateTime = timestamp.toDate();
    String customProductId =
        '${dateTime.year}${dateTime.month}${dateTime.day}${dateTime.hour}${dateTime.minute}${dateTime.second}';
    return customProductId;
  }
}
