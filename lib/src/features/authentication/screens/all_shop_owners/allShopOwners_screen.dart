// ignore: file_names
import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/features/authentication/controllers/profile_controller.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/user_model.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AllShopOwners extends StatelessWidget {
  const AllShopOwners({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => const ProfileScreen());
          },
          icon: const Icon(LineAwesomeIcons.arrow_circle_left),
        ),
        title: const Text("All Shop owners"),
        backgroundColor: kprimaryColour.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<UserModel>>(
              future: controller.getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTileTheme(
                                iconColor: Colors.blue.withOpacity(0.8),
                                tileColor: Colors.blueAccent.withOpacity(0.5),
                                textColor: kprimaryColour,
                                dense: true,
                                child: ListTile(
                                  leading:
                                      const Icon(LineAwesomeIcons.user_circle),
                                  trailing: const Icon(
                                      LineAwesomeIcons.arrow_circle_right),
                                  title: Text(
                                      "Name: ${snapshot.data![index].firstName.capitalizeFirst}"),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Email: ${snapshot.data![index].emailAddress}"),
                                      Text(
                                          "Location: ${snapshot.data![index].district}"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
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
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
