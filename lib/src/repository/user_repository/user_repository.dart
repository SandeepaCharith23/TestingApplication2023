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
}
