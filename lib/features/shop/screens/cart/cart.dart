import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/ecom_circular_icon.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ecomAppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(ecomSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ecomSizes.spaceBtwnSections),
          itemCount: 11,
          itemBuilder: (_, index) => Column(
            children: [
              const ecomCartItem(),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),

                      /// Add Remove Buttons
                      ecomProductQuantityWithAddRemoveButtons(),
                    ],
                  ),
                  ecomProductPriceText(price: "256"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text("Checkout \$256.0")),
      ),
    );
  }
}
