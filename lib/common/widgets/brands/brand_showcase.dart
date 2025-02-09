import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class ecomBrandShowcase extends StatelessWidget {
  const ecomBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: ecomRoundedContainer(
        showBorder: true,
        borderColor: ecomColors.darkGreyColor,
        bgColor: Colors.transparent,
        padding: const EdgeInsets.all(ecomSizes.medium),
        margin: const EdgeInsets.only(bottom: ecomSizes.spaceBtwnItems),
        child: Column(
          children: [
            /// Brand with Products Count
            ecomBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            Row(
              children: images
                  .map((image) => ecomTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget ecomTopProductImageWidget(String image, context) {
    return Expanded(
      child: ecomRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(ecomSizes.medium),
        margin: const EdgeInsets.only(right: ecomSizes.small),
        bgColor: ecomHelperFunctions.isDarkMode(context)
            ? ecomColors.darkerGreyColor
            : ecomColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ecomShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
