import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../models/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;

  const ItemCard({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.productName,
                style: const TextStyle(
                  color: ktextColourinLight,
                  fontFamily: 'Aboreto',
                  fontSize: 14,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              "Rs ${product.price}",
              style: const TextStyle(
                fontFamily: 'Aboreto',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
