import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController
{
 static UserRepository get instance =>Get.find();

 final _dbinstance=FirebaseFirestore.instance;
 
 createUser(UserModel usermodel){

  _dbinstance.collection("User").add(usermodel.toJson());
 }

}