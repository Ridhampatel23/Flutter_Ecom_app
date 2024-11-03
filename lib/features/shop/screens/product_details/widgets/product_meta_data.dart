import 'package:ecom_store/common/widgets/images/ecom_circular_image.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/common/widgets/texts/ecom_brand_title_text_with_verified_icon.dart';
import 'package:ecom_store/common/widgets/texts/product_title_text.dart';
import 'package:ecom_store/utils/constants/enums.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomProductMetaData extends StatelessWidget {
  const ecomProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            ecomRoundedContainer(
              radius: ecomSizes.small,
              bgColor: ecomColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: ecomSizes.small,
                vertical: ecomSizes.xsmall,
              ),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.black),
              ),
            ),
            const SizedBox(width: ecomSizes.spaceBtwnItems),

            /// Price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            const Expanded(child: ecomProductPriceText(price: "175", isLarge: true)),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 1.5),

        /// Title
        const ecomProductTitleText(title: "Green Nike Dunk Low Shoes"),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 1.5),

        /// Stock
        Row(
          children: [
            const ecomProductTitleText(title: "Availability"),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2 ),

        /// Brand
        const Row(
          children: [
            ecomCircularImage(
              image: ecomImages.nikeDunkGreen,
              width: 32,
              height: 32,
            ),
             SizedBox(width: ecomSizes.spaceBtwnItems),
             ecomBrandTitleWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
