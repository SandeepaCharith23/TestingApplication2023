import 'package:ecommerseapp2023/src/constants/sizes.dart';
import 'package:ecommerseapp2023/src/features/authentication/models/product.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/components/categories.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/components/itemcard.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/product_details_screen.dart';
import 'package:flutter/material.dart';

class MarketplaceBody extends StatelessWidget {
  const MarketplaceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kDefaultpaddingSize),
          child: Text(
            "MarketPlace",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        //product categories bar
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Categories(),
        ),
        //Available products in Marketplace
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => ItemCard(
                press: () {
                  //Get.to(() => const ProductDetailsScreen());
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProductDetailsScreen(
                      product: products[index],
                    );
                  }));
                },
                product: products[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
