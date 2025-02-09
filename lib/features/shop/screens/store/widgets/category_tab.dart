import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/controllers/category_controller.dart';
import 'package:ecom_store/features/shop/models/category_model.dart';
import 'package:ecom_store/features/shop/screens/all_products/all_products.dart';
import 'package:ecom_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecom_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class ecomCategoryTab extends StatelessWidget {
  const ecomCategoryTab({
    super.key, required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [ Padding(
        //We can only scroll the tab bar view but not the grid layout, the max it will reach
        // is upto first column only , the seocnd column will only be half visible, to overcome this
        //issue we will wrap the Padding with a ListView widget and make shrinkwrap to true, which only uses
        //available space and physics to NaverScrollable.
        padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Brands
            CategoryBrands(category: category),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            /// - Products
            FutureBuilder(
              future: controller.getCategoryProducts(categoryId: category.id),
              builder: (context, snapshot) {

                /// Helper functions to Handle Loader, No record, or Error Messages
                final response = ecomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const ecomVerticalProductShimmer());
                if (response != null) return response;

                /// Record Found!
                final products = snapshot.data!;

                return Column(
                  children: [
                    ecomSectionHeading(title: "You might like", onPressed: () => Get.to(AllProductsScreen(title: category.name,
                    futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                    ))),
                    const SizedBox(height: ecomSizes.spaceBtwnItems),
                    ecomGridLayout(itemCount: products.length, itemBuilder: (_, index) => ecomProductCardVertical(product: products[index])),
                  ],
                );
              }
            ),
          ],
        ),
      ),
      ],
    );

  }
}
