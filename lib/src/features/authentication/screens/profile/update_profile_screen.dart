import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/features/authentication/controllers/profile_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController emailAddressController;
  late TextEditingController locationProvinceController;
  late TextEditingController locationDistrictController;
  late TextEditingController mobilePhoneController;
  late TextEditingController passwordController;

  late Future<UserModel?> userData;
  late Stream<UserModel?> userModelStream;

  @override
  void initState() {
    userData = ProfileController().getUserData();
    userModelStream = Stream.fromFuture(userData);

    super.initState();

    // Initialize the controllers with initial values
    firstNameController = TextEditingController();
    emailAddressController = TextEditingController();
    locationProvinceController = TextEditingController();
    locationDistrictController = TextEditingController();
    mobilePhoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    firstNameController.dispose();
    emailAddressController.dispose();
    locationProvinceController.dispose();
    locationDistrictController.dispose();
    mobilePhoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
          // future: profilecontroller.getUserData(),
          future: userData,
          // stream: userModelStream,

          builder: (context, snapshot) {
            if (kDebugMode) {
              print("Usermodal is regenerated");
            }
            //First check that snapshot fetch process is Finished
            if (snapshot.connectionState == ConnectionState.done) {
              //secondly check that snapshot has Data
              if (snapshot.hasData) {
                UserModel userModeldata = snapshot.data as UserModel;

                //test editing controllers
                final firstNameController =
                    TextEditingController(text: userModeldata.firstName);
                final emailAddressController =
                    TextEditingController(text: userModeldata.emailAddress);
                final locationProvinceController =
                    TextEditingController(text: userModeldata.province);
                final locationDistrictController =
                    TextEditingController(text: userModeldata.district);
                final mobilePhoneController =
                    TextEditingController(text: userModeldata.phoneNumber);
                final passwordController =
                    TextEditingController(text: userModeldata.passWord);

                //load all data to display
                return Padding(
                  padding: const EdgeInsets.all(kDefaultpaddingSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          Positioned(
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
                                LineAwesomeIcons.camera,
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
                              controller: firstNameController,
                              onChanged: (value) {
                                value = firstNameController.text.toString();
                              },
                              //initialValue: userModeldata.firstName,
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
                              //initialValue: userModeldata.emailAddress,
                              controller: emailAddressController,
                              onChanged: (value) {
                                value = emailAddressController.text.toString();
                              },
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
                              onChanged: (value) {
                                value =
                                    locationDistrictController.text.toString();
                              },
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
                              //initialValue: userModeldata.phoneNumber,
                              controller: mobilePhoneController,
                              onChanged: (value) {
                                value = mobilePhoneController.text.toString();
                              },
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
                              // initialValue: userModeldata.passWord,
                              controller: passwordController,
                              onChanged: (value) {
                                value = passwordController.text.toString();
                              },
                              enabled: false,
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
                                  //collect data-create a Data model
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
                                  );

                                  //update user records using Data Tree
                                  await profilecontroller
                                      .updateUserRecord(userDataTree);
                                  Get.snackbar("Update Succeess",
                                      "Update Process is successful");
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Wait for loading data..."),
                      Text(snapshot.error.toString()),
                    ],
                  ),
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
}
