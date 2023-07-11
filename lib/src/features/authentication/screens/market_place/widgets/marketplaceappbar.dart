import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class MarketPlaceAppBar extends StatelessWidget implements PreferredSize {
  const MarketPlaceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Cart Icon.svg"),
          color: kprimaryColour,
        ),
        const SizedBox(
          width: kDefaultmarginSize / 2,
        ),
      ],
    );
  }

  @override
  Widget get child => const MarketPlaceAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
