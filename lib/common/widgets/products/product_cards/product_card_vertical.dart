import 'package:ecom_store/common/styles/shadows.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/images/ecom_rounded_banner.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/features/shop/controllers/product/product_controller.dart';
import 'package:ecom_store/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/enums.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../icons/ecom_circular_icon.dart';
import '../../texts/ecom_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../favourite_icon/favourite_icon.dart';

class ecomProductCardVertical extends StatelessWidget {
  const ecomProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = ecomHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailPage(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ecomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ecomSizes.productImageRadius),
          color: dark
              ? ecomColors.greyColor.withOpacity(0.1)
              : ecomColors.whiteColor,
        ),
        child: Column(
          children: [
            ///Thumbnail, wishlist Button, Discount Tag
            ecomRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(ecomSizes.small),
              bgColor: dark ? ecomColors.dark : ecomColors.light,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  Center(
                    child: ecomRoundedBanners(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  ),

                  /// -- Sale Tag
                  if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: ecomRoundedContainer(
                      radius: ecomSizes.small,
                      bgColor: ecomColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: ecomSizes.small,
                          vertical: ecomSizes.xsmall),
                      child: Text("$salePercentage%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.black)),
                    ),
                  ),

                  /// Wishlist
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: ecomFavouriteIcon(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

            /// -- Details --
            Padding(
              padding: const EdgeInsets.all(ecomSizes.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ecomProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
                  ecomBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price  --
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: ecomSizes.small),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist
                      Padding(
                          padding: const EdgeInsets.only(left: ecomSizes.small),
                          child: ecomProductPriceText(
                            price: controller.getProductPrice(product),
                          )),
                    ],
                  ),
                ),

                /// -- Add to Cart Button --
                Container(
                  decoration: const BoxDecoration(
                      color: ecomColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ecomSizes.cardRadiusMedium),
                        bottomRight:
                            Radius.circular(ecomSizes.cardRadiusMedium),
                      )),
                  child: const SizedBox(
                      width: ecomSizes.iconLarge * 1.2,
                      height: ecomSizes.iconLarge * 1.2,
                      child: Icon(Iconsax.add, color: ecomColors.whiteColor)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

