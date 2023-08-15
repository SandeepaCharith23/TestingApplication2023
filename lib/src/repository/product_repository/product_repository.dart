import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  TextEditingController productTitleController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productOwnerNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuentityController = TextEditingController();
  TextEditingController productDisplayBackgroundController =
      TextEditingController();
  TextEditingController productImageController = TextEditingController();

  final _dbinstance = FirebaseFirestore.instance;

  Future<void> addNewProduct(String customId, Product product) async {
    await _dbinstance
        .collection("Products")
        .doc(customId)
        .set(product.toJson())
        .whenComplete(() => Get.snackbar(
              "Product Saved",
              "SuccessFully Saved your product",
              colorText: Colors.amber,
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 2),
            ))
        .catchError((error, stackTrace) {
      Get.snackbar("Something Error", "Please Double Check your data");
    });

    //clear all text fields
    productTitleController.clear();
    productDescriptionController.clear();
    productNameController.clear();
    productPriceController.clear();
    productQuentityController.clear();
    productImageController.clear();
  }
}
