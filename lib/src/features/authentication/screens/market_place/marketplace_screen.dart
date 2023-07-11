import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/components/marketplacebody.dart';
import 'package:ecommerseapp2023/src/features/authentication/screens/market_place/widgets/marketplaceappbar.dart';
import 'package:flutter/material.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MarketPlaceAppBar(),
      body: MarketplaceBody(),
    );
  }
}
