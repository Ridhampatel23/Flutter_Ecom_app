import 'package:ecom_store/common/widgets/images/ecom_circular_image.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/common/widgets/texts/ecom_brand_title_text_with_verified_icon.dart';
import 'package:ecom_store/common/widgets/texts/product_title_text.dart';
import 'package:ecom_store/features/shop/controllers/product/product_controller.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/constants/enums.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomProductMetaData extends StatelessWidget {
  const ecomProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.black),
              ),
            ),
            const SizedBox(width: ecomSizes.spaceBtwnItems),

            /// Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text("\$${product.price}",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: ecomSizes.spaceBtwnItems),
            Expanded(child: ecomProductPriceText(price: controller.getProductPrice(product), isLarge: true)),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 1.5),

        /// Title
        const ecomProductTitleText(title: "Green Nike Dunk Low Shoes"),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 1.5),

        /// Stock
        Row(
          children: [
            ecomProductTitleText(title: product.title),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2 ),

        /// Brand
         Row(
          children: [
            const ecomCircularImage(
              image: ecomImages.nikeDunkGreen,
              width: 32,
              height: 32,
            ),
             const SizedBox(width: ecomSizes.spaceBtwnItems),
             ecomBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
