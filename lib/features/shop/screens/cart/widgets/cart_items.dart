import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_cards/product_price.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomCartItems extends StatelessWidget {
  const ecomCartItems({super.key, this.showAddRemoveButtons = true});

  final bool  showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
      const SizedBox(height: ecomSizes.spaceBtwnSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const ecomCartItem(),
          if (showAddRemoveButtons) const SizedBox(height: ecomSizes.spaceBtwnItems),

          /// Add Remove Buttons
          if (showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),


                  ecomProductQuantityWithAddRemoveButtons(),
                ],
              ),
              ecomProductPriceText(price: "256"),
            ],
          ),
        ],
      ),
    );
  }
}
