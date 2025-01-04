import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomCategoryTab extends StatelessWidget {
  const ecomCategoryTab({
    super.key, required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
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
            const ecomBrandShowcase(images: [ecomImages.nikeDunkGreen, ecomImages.nikeDunkGreen, ecomImages.nikeDunkGreen]),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            const ecomBrandShowcase(images: [ecomImages.nikeDunkGreen, ecomImages.nikeDunkGreen, ecomImages.nikeDunkGreen]),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            /// - Products
            ecomSectionHeading(title: "You might like", onPressed: () {}),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            ecomGridLayout(itemCount: 4, itemBuilder: (_, index) => const ecomProductCardVertical()),
            const SizedBox(height: ecomSizes.spaceBtwnSections),
          ],
        ),
      ),
      ],
    );

  }
}
