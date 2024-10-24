import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/features/shop/screens/home/home.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ecomAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ecomCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              ecomGridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const ecomProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
