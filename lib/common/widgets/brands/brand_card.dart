import 'package:ecom_store/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/ecom_circular_image.dart';
import '../texts/ecom_brand_title_text_with_verified_icon.dart';

class ecomBrandCard extends StatelessWidget {
  const ecomBrandCard({
    super.key, this.showBorder = true, this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ecomRoundedContainer(
        padding: const EdgeInsets.all(ecomSizes.small),
        showBorder: showBorder,
        bgColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: ecomCircularImage(
                image: ecomImages.clothingIcon, //Todo : Change the static image to brand image once you're done uploading data in Firebase, and also add isNetworkImage to true
                bgColor: Colors.transparent,
                overlayColor: ecomHelperFunctions
                    .isDarkMode(context)
                    ? ecomColors.whiteColor
                    : ecomColors.blackColor,
              ),
            ),
            const SizedBox(
                width: ecomSizes.spaceBtwnItems / 2),

            /// --Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  ecomBrandTitleWithVerifiedIcon(
                      title: brand.name,
                      brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
