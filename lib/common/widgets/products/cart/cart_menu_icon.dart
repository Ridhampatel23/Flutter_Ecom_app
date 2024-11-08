import 'package:ecom_store/features/shop/screens/cart/cart.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ecomCartCounterIcon extends StatelessWidget {
  const ecomCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: dark ?ecomColors.whiteColor : ecomColors.blackColor.withOpacity(1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? ecomColors.dark :  ecomColors.whiteColor, fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
