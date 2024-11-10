import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class ecomSortableProducts extends StatelessWidget {
  const ecomSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Drop Down
        DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items: [
            "Name",
            "Price: High - Low",
            "Price: Low - high",
            "Sale",
            "New Arrivals",
            "Most Popular"
          ]
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: ecomSizes.spaceBtwnSections),

        /// Products
        ecomGridLayout(itemCount: 5, itemBuilder: (_, index) => ecomProductCardVertical()),
      ],
    );
  }
}
