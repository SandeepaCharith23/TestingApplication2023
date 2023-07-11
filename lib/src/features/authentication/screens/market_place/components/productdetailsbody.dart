import 'package:ecommerseapp2023/src/constants/colors.dart';

import 'package:ecommerseapp2023/src/features/authentication/models/product.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/components/productdescriptiontile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/sizes.dart';
import 'Itemcounterwithfavouritelable.dart';

class ProductDetailsBody extends StatelessWidget {
  final Product product;
  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                //Main Product description  banner
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 10,
                  ),
                  height: size.height * 0.65,
                  width: size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: kprimaryColourWhite),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: ProductDescriptionTile(product: product)),
                      const Itemcounterwithfavouritelable(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 16),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  //color: kprimaryColour2,
                                  border: Border.all(
                                    color: kbuttonborderColorinLight,
                                  )),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/Cart Icon.svg",
                                    // ignore: deprecated_member_use
                                    color: Colors.black,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kprimaryColour2),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          kDefaultpaddingSizeinButtons),
                                      child: Text(
                                        "Buy Now".toUpperCase(),
                                        style: const TextStyle(
                                          color: kprimaryColourWhite,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                //Image Banner
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.15, left: size.width * 0.45),
                  height: size.height * 0.30,
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: kprimaryColourWhite),
                  child: Hero(
                    tag: "${product.id}",
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //Product details-Price
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Price",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: kprimaryColourInDark,
                                    fontFamily: 'Aboreto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Text(
                          "Rs ${product.price}",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: kprimaryColourInDark,
                                    fontFamily: 'Aboreto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Product details-Product name and Product Title
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          product.title,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: kprimaryColourInDark,
                                    fontFamily: 'Aboreto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Text(
                          product.productName,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: kprimaryColourInDark,
                                    fontFamily: 'Aboreto',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          product.productOwnersname,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: kprimaryColourInDark,
                                    fontFamily: 'Aboreto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
