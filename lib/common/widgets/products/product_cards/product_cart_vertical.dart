import 'package:ecom_store/common/styles/shadows.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/images/ecom_rounded_banner.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/ecom_circular_icon.dart';
import '../../texts/product_title_text.dart';

class ecomProductCardVertical extends StatelessWidget {
  const ecomProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ecomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ecomSizes.productImageRadius),
          color: dark ? ecomColors.darkGreyColor : ecomColors.whiteColor,
        ),
        child: Column(
          children: [
            ///Thumbnail, wishlist Button, Discount Tag
            ecomRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ecomSizes.small),
              bgColor: dark ? ecomColors.dark : ecomColors.light,
              child:Stack(
                children: [
                  ///Thumbnail Image
                  const ecomRoundedBanners(imageUrl: ecomImages.nikeDunkGreen, applyImageRadius: true),


                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: ecomRoundedContainer(
                      radius: ecomSizes.small,
                      bgColor: ecomColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: ecomSizes.small, vertical: ecomSizes.xsmall),
                      child: Text("25%" , style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    ),
                  ),

                  /// Wishlist
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: ecomCircularIcon(icon: Iconsax.heart5, color: Colors.red))
                ],
              ),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
            ///Details
              Padding(padding: const EdgeInsets.all(ecomSizes.small),
            child: Column(
              children: [
                const ecomProductTitleText(title: 'Nike Dunk Green', smallSize: true),
                const SizedBox(height: ecomSizes.spaceBtwnItems/2),
                Row(
                  children: [
                    Text("data" , overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(width: ecomSizes.xsmall),
                    const Icon(Iconsax.verify5, color: ecomColors.primaryColor, size: ecomSizes.iconXs),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Price
                    const ecomProductPriceText(price: '35.0',),
                    Container(
                      decoration: const BoxDecoration(
                        color: ecomColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ecomSizes.cardRadiusMedium),
                          bottomRight: Radius.circular(ecomSizes.cardRadiusMedium),
                        )
                      ),
                      child: SizedBox(
                          width: ecomSizes.iconLarge * 1.2,
                          height: ecomSizes.iconLarge *1.2,
                          child: const Icon(Iconsax.add, color: ecomColors.whiteColor)),
                    )
                  ],
                )
              ],
            ),
            )

          ],



        ),
      ),
    );
  }
}



