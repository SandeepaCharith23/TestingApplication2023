import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:ecommerseapp2023/src/constants/image_path.dart';
import 'package:ecommerseapp2023/src/constants/text_string.dart';
import 'package:flutter/material.dart';

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
        style: Theme.of(context).textTheme.titleLarge,
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
            onPressed: () {},
            icon: const Image(
              image: AssetImage(dashbaordScreenImages3),
              width: 50,
              height: 50,
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
