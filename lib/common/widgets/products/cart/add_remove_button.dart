import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/ecom_circular_icon.dart';

class ecomProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const ecomProductQuantityWithAddRemoveButtons({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ecomCircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ecomSizes.medium,
          color: dark ? Colors.white : Colors.black,
          bgColor: dark ? ecomColors.darkerGreyColor : ecomColors.light,
        ),
        const SizedBox(width: ecomSizes.spaceBtwnItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ecomSizes.spaceBtwnItems),

        const ecomCircularIcon(icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ecomSizes.medium,
          color: ecomColors.whiteColor,
          bgColor: ecomColors.primaryColor,
        ),
      ],
    );
  }
}
