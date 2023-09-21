import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/features/authentication/controllers/profile_controller.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/loging_screen/login_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/profile/update_profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';

import '../../models/user_model.dart';
import '../all_shop_owners/allshopowners_screen.dart';
import 'common_widgets/menu_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final UserModel userModel = Get.arguments;
    final profilecontroller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const DashboardScreen());
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          "Profile",
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
        child: FutureBuilder(
          future: profilecontroller.getUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userModeldata = snapshot.data as UserModel;
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
                              child: userModeldata.userprofileImage != null
                                  ? Image.network(
                                      userModeldata.userprofileImage!)
                                  : Image.asset(profileImage1),
                              // child: const Image(
                              //   image: AssetImage(profileImage),
                              // ),
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
                                LineAwesomeIcons.edit,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        userModeldata.firstName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        userModeldata.emailAddress,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const UpdateProfileScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kprimaryColour1,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Edit profile"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.cog,
                        textMain: 'Setting',
                        trailingIconOnPressed: () {},
                        listTileonpress: () {},
                        endIcon: true,
                      ),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.shopping_bag,
                        textMain: 'Your Shop',
                        trailingIconOnPressed: () {},
                        listTileonpress: () {},
                        endIcon: true,
                      ),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.user,
                        textMain: 'User Managemnet',
                        trailingIconOnPressed: () {},
                        listTileonpress: () {},
                        endIcon: true,
                      ),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.home,
                        textMain: 'All Shops Details',
                        trailingIconOnPressed: () {
                          Get.to(() => const AllShopOwners());
                        },
                        listTileonpress: () {
                          Get.to(() => const AllShopOwners());
                        },
                        endIcon: true,
                      ),
                      const Divider(),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.info_circle,
                        textMain: 'Information',
                        trailingIconOnPressed: () {},
                        listTileonpress: () {},
                        endIcon: true,
                      ),
                      MenuListTile(
                        leadingIcon: LineAwesomeIcons.alternate_sign_out,
                        textMain: 'Sign out',
                        trailingIconOnPressed: () {},
                        listTileonpress: () {
                          AuthenticationRepository.instance.logout();
                          Get.to(() => const LoginScreen());
                        },
                        endIcon: false,
                        textColor: Colors.redAccent,
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Wait for loading data..."),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
