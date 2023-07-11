import 'package:ecommerseapp2023/src/features/authentication/models/product.dart';
import 'package:flutter/material.dart';

class ProductDescriptionTile extends StatelessWidget {
  const ProductDescriptionTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Product Description",
          style: TextStyle(
            fontFamily: "Lobster",
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            product.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
