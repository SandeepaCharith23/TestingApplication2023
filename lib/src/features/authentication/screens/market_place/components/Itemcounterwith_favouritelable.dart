// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'itemcounter.dart';

class Itemcounterwithfavouritelable extends StatelessWidget {
  const Itemcounterwithfavouritelable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: ItemCounter(),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              // ignore: deprecated_member_use
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
