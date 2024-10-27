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
    super.key, this.showBorder = true, this.onTap,
  });

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
                image: ecomImages.clothingIcon,
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
                  const ecomBrandTitleWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSize: TextSizes.large),
                  Text(
                    "256 Products",
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
