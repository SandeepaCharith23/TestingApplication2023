//main categories

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Plants", "Flowers", "Fruits", "Pets", "others"];
  int selectedIndex = 0;

  //var selectedCategory; //which category will selected default
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategories(index),
        ),
      ),
    );
  }

  Widget buildCategories(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (kDebugMode) {
              print(categories[index]);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categories[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kprimaryColour,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2.0),
                height: 2,
                width: 30,
                color: selectedIndex == index
                    ? kprimaryColour
                    : Colors.transparent,
              ),
            ],
          ),
        ),
      );
}
