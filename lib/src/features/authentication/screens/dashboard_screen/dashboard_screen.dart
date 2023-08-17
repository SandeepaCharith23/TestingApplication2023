import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/widgets/navigation_section.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/widgets/appbar.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/widgets/banners.dart';

import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/widgets/search.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/dashboard_screen/widgets/top_products.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get user details from route arguments
    //final user = Get.arguments;
    return Scaffold(
      appBar: const DashBoardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultpaddingSize),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dashboardIntroductionMainTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Text(
                // user.firstName,
                dashboardIntroductionSubTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),

              //Search Results
              DashBoardSearch(),

              //categories
              // const DashBoardCategories(),

              const SizedBox(
                height: 10,
              ),

              const NavigationSection(),
              const SizedBox(
                height: 10,
              ),
              //Banners
              const DashBoardBanners(),
              const SizedBox(
                height: 20,
              ),

              //High demand Products
              Text(
                "Top Products",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(fontSizeFactor: 1.6),
              ),
              const DashBoardTopProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
