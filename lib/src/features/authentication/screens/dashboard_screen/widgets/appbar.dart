import 'package:ecommerseapp2023/src/constants/colors.dart';

import 'package:ecommerseapp2023/src/constants/text_string.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DashBoardAppBar extends StatelessWidget implements PreferredSize {
  const DashBoardAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu_rounded),
      ),
      title: Text(
        dashboardAppBarAppTitle,
        style: TextStyle(
          fontStyle: Theme.of(context).textTheme.titleMedium?.fontStyle,
          fontFamily: "Lobster",
          fontSize: 25,
          // color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
            top: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kprimaryColourInDark,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen(), arguments: User);
            },
            // icon: const Image(
            //   image: AssetImage(dashbaordScreenImages3),
            //   width: 50,
            //   height: 50,
            // ),

            icon: const Icon(
              LineAwesomeIcons.users_cog,
              color: kprimaryColour,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget get child => const DashBoardAppBar();
}
