import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/ecom_rounded_banner.dart';
import '../../texts/ecom_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class ecomCartItem extends StatelessWidget {
  const ecomCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ecomRoundedBanners(
          imageUrl: ecomImages.nikeDunkGreen,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ecomSizes.small),
          bgColor: ecomHelperFunctions.isDarkMode(context)
              ? ecomColors.darkerGreyColor
              : ecomColors.light,
        ),
        const SizedBox(width: ecomSizes.spaceBtwnItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ecomBrandTitleWithVerifiedIcon(title: "Nike"),
              const Flexible(
                  child: ecomProductTitleText(
                      title: "Nike Green Dunks", maxLines: 1)),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "Color",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "Green",
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: "Size",
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: "US 9.5",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
