import 'package:ecommerseapp2023/src/features/authentication/screens/my_shop/addnewproduct_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/my_shop/components/shop_product_detailstile.dart';
import 'package:flutter/material.dart';

class MyShopScreen extends StatelessWidget {
  const MyShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyShop",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            //1.Tile which displayed product details of current user/Product owner
            SizedBox(
              // You can also use a Container with a fixed height instead of SizedBox
              height: MediaQuery.of(context).size.height,
              // Specify a fixed height or adjust according to your needs
              //height: 400,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const ShopProductDetailsTile();
                },
              ),
            ),

            //2.Elevated Button-Add a new product to shop
            ElevatedButton(
              onPressed: () {
                // Add button click functionality here
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AddNewProductScreen();
                }));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                margin: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 20.0,
                  top: 20,
                  right: 20,
                ),

                child: const Icon(Icons.add), // Adjust the margin as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
