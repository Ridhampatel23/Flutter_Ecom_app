import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class ecomBrandShowcase extends StatelessWidget {
  const ecomBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return ecomRoundedContainer(
      showBorder: true,
      borderColor: ecomColors.darkGreyColor,
      bgColor: Colors.transparent,
      padding: const EdgeInsets.all(ecomSizes.medium),
      margin: const EdgeInsets.only(bottom: ecomSizes.spaceBtwnItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const ecomBrandCard(showBorder: false),
          const SizedBox(height: ecomSizes.spaceBtwnItems),

          Row(
            children: images
                .map((image) => ecomTopProductImageWidget(image, context))
                .toList(),
          )
        ],
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
          child:  Image(
              image: AssetImage(image), fit: BoxFit.contain),
        ));
  }
}
