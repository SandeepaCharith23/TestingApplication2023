import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstName;
  final String emailAddress;
  final String phoneNumber;
  final String passWord;
  final String province;
  final String district;
  final String? userId;

  const UserModel({
    required this.firstName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.passWord,
    required this.district,
    required this.province,
    this.userId,
  });

  toJson() {
    return {
      "Firstname": firstName,
      "EmailAddress": emailAddress,
      "PhoneNumber": phoneNumber,
      "Password": passWord,
      "Province": province,
      "District": district,
      "UserId": userId,
    };
  }

  ///process-fetch Data from FirebaseDB-step-1-Map data which fetch from firebase to usermodel
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return UserModel(
      userId: documentSnapshot.id,
      firstName: data["Firstname"],
      emailAddress: data["EmailAddress"],
      phoneNumber: data["PhoneNumber"],
      passWord: data["Password"],
      district: data["District"],
      province: data["Province"],
    );
  }
}
