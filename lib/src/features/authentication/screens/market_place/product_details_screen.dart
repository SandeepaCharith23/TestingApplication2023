import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/components/productdetailsbody.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'widgets/productdetailsappbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: ProductDetailsAppBar(product: product),
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }
}
