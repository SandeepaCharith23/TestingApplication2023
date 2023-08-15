import 'package:ecommerseapp2023/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/sizes.dart';
import '../../../models/product.dart';

class ProductDetailsAppBar extends StatelessWidget implements PreferredSize {
  const ProductDetailsAppBar({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColorinDarkMode,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          // ignore: deprecated_member_use
          color: kprimaryColourInDark,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: kprimaryColourWhite,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // ignore: deprecated_member_use
            color: kprimaryColourWhite,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/Cart Icon.svg",
            // ignore: deprecated_member_use
            color: kprimaryColourWhite,
          ),
          highlightColor: kprimaryColourWhite,
          color: kprimaryColourWhite,
        ),
        const SizedBox(
          width: kDefaultmarginSize / 2,
        ),
      ],
    );
  }

  @override
  Widget get child => ProductDetailsAppBar(
        product: product,
      );

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
