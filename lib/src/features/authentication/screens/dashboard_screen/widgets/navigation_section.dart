import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/marketplace_screen.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/my_shop/myshop_screen.dart';
import 'package:flutter/material.dart';

class NavigationSection extends StatelessWidget {
  const NavigationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //first row
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-chat-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Chat Screen',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const MarketPlaceScreen();
                          }));

                          //Get.to(() => const MarketPlaceScreen());
                        },
                        icon: Image.asset(
                          'assets/icons/icons-market-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'MarketPlace',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-cart-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'MyCart',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          //second row
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-knowledge-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Knowledge',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-advertisement-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Advertisemnet',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-profile-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Myprofile',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          ///third row
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const MyShopScreen();
                          }));
                        },
                        icon: Image.asset(
                          'assets/icons/icons-shop-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Myshop',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-car-driver-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'MyTransport',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          blurRadius: 7,
                          spreadRadius: 3.0,
                          color: Colors.grey.withOpacity(0.5)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/icons-about-us-64.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'AboutUs',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
