import 'package:ecom_store/features/shop/controllers/all_products_controller.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class ecomSortableProducts extends StatelessWidget {
  const ecomSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());

    return Column(
      children: [
        /// Drop Down
        DropdownButtonFormField(
          decoration: const InputDecoration(
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
        Obx(() => ecomGridLayout(itemCount: 5, itemBuilder: (_, index) => ecomProductCardVertical(product: controller.products[index]))),
      ],
    );
  }
}
