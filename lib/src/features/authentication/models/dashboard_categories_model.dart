import 'package:flutter/animation.dart';

class DashboardCategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
      this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> categorieslist = [
    DashboardCategoriesModel("A Shop", "Gampaha", "Clothings", null),
    DashboardCategoriesModel("B Shop", "Colombo", "Clothings", null),
    DashboardCategoriesModel("C Shop", "Kegalle", "Clothings", null),
  ];
}
