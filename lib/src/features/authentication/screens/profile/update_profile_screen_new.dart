import 'dart:io';

import 'package:ecommerseapp2023/src/constants/sizes.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../../constants/colors.dart';
import '../../../../constants/image_path.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';

class UpdateProfileScreenNew extends StatefulWidget {
  const UpdateProfileScreenNew({super.key});

  @override
  State<UpdateProfileScreenNew> createState() => _UpdateProfileScreenNewState();
}

class _UpdateProfileScreenNewState extends State<UpdateProfileScreenNew> {
  // Create controllers for text fields
  final firstNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final locationProvinceController = TextEditingController();
  final locationDistrictController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  final passwordController = TextEditingController();

  late String pickedImageFile;
  @override
  Widget build(BuildContext context) {
    final profilecontroller = Get.put(ProfileController());

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          "Upadate Profile Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //warp the Screen with a future builder -Display with values in the Future
        child: FutureBuilder(
          //pass the profile controller class-getUserData method
          future: profilecontroller.getUserData(),

          builder: (context, snapshot) {
            if (kDebugMode) {
              print("Usermodal is regenerated");
            }
            //First check that snapshot fetch process is Finished
            if (snapshot.connectionState == ConnectionState.done) {
              //secondly check that snapshot has Data
              if (snapshot.hasData) {
                UserModel userModeldata = snapshot.data as UserModel;

                //1. Set initial values for controllers
                firstNameController.text = userModeldata.firstName;
                locationProvinceController.text = userModeldata.province;
                locationDistrictController.text = userModeldata.district;
                mobilePhoneController.text = userModeldata.phoneNumber;
                passwordController.text = userModeldata.passWord;

                //2.load all data to display
                return Padding(
                  padding: const EdgeInsets.all(kDefaultpaddingSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Profile Image section
                      Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(profileImage),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Show a dialog or use a button to prompt the user to choose between gallery or camera
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Select Image Source'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _pickImage(ImageSource.camera);
                                      },
                                      child: const Text('Camera'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _pickImage(ImageSource.gallery);
                                      },
                                      child: const Text('Gallery'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kprimaryColour1.withOpacity(0.8),
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.edit,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              //controller: firstNameController,
                              initialValue: userModeldata.firstName,
                              decoration: const InputDecoration(
                                hintText: "Enter your First Name",
                                label: Text("First Name"),
                                prefixIcon: Icon(LineAwesomeIcons.user_circle),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: userModeldata.emailAddress,
                              // controller: profilecontroller.emailnewcontroller,
                              enabled: false,
                              decoration: const InputDecoration(
                                hintText: "Cannot edit your email address",
                                label: Text("Email address"),
                                prefixIcon: Icon(LineAwesomeIcons.envelope),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // initialValue: userModeldata.province,
                              controller: locationProvinceController,
                              decoration: const InputDecoration(
                                hintText: "Select your Location-Province",
                                label: Text("Location-Province"),
                                prefixIcon: Icon(LineAwesomeIcons.globe),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              //initialValue: userModeldata.district,
                              controller: locationDistrictController,
                              decoration: const InputDecoration(
                                hintText: "Select your Location-District",
                                label: Text("Location-District"),
                                prefixIcon: Icon(LineAwesomeIcons.globe),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: userModeldata.phoneNumber,
                              // controller: profilecontroller.mobilenumbercontroller,
                              decoration: const InputDecoration(
                                hintText: "Enter your Mobile phone Number",
                                label: Text("Mobile Number"),
                                prefixIcon: Icon(LineAwesomeIcons.globe),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: userModeldata.passWord,
                              // controller: profilecontroller.passwordnewcontroller,
                              decoration: const InputDecoration(
                                hintText: "Enter a suitable password",
                                label: Text("Password"),
                                prefixIcon: Icon(LineAwesomeIcons.fingerprint),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  //1.collect data-create a Data model
                                  final userDataTree = UserModel(
                                    firstName:
                                        firstNameController.text.toString(),
                                    emailAddress:
                                        emailAddressController.text.toString(),
                                    phoneNumber:
                                        mobilePhoneController.text.toString(),
                                    passWord:
                                        passwordController.text.toString(),
                                    district: locationDistrictController.text
                                        .toString(),
                                    province: locationProvinceController.text
                                        .toString(),
                                    userId: userModeldata.userId,
                                    userprofileImage: '',
                                  );

                                  //2.update user records using Data Tree and Redirect User
                                  await profilecontroller
                                      .updateUserRecord(userDataTree);

                                  //3.Showing snackbar after updating task is completed
                                  Get.snackbar(
                                    "Update Succeess",
                                    "Update Process is successful",
                                    colorText: Colors.green,
                                    backgroundColor: Colors.white,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kprimaryColour1,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text("Update profile"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: "Joined on 16th March 2023",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    foregroundColor: Colors.red,
                                  ),
                                  child: const Text("Delete Account"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const Center(
                //child: Text("snapshot connectionstate is not done"),
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      String imageurl = await uploadImageIntoFirebaseStorage(pickedFile);
      setState(() {
        pickedImageFile = imageurl;
        //controllers.productImageController.text = pickedImageFile.toString();
        if (kDebugMode) {
          print(pickedImageFile);
        }
      });
    }
  }

  Future<String> uploadImageIntoFirebaseStorage(XFile pickedFile) async {
    //upload the image to firebase Storage
    final imageRef = firebase_storage.FirebaseStorage.instance.ref().child(
        'profileImages/images/${DateTime.now().millisecondsSinceEpoch}.jpg');

    final uploadTask = imageRef.putFile(File(pickedFile.path));
    final imageurl = await (await uploadTask).ref.getDownloadURL();
    if (kDebugMode) {
      print(imageurl);
    }
    return imageurl;
  }
} //end of the class
