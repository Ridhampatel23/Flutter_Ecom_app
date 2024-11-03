import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ecomBottonAddToCart extends StatelessWidget {
  const ecomBottonAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ecomSizes.defaultSpace, vertical: ecomSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? ecomColors.darkerGreyColor : ecomColors.light,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ecomSizes.cardRadiusLarge),
          topLeft: Radius.circular(ecomSizes.cardRadiusLarge),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ecomCircularIcon(icon: Iconsax.minus,
              bgColor: ecomColors.darkGreyColor,
                width: 40,
                height: 40,
                color: ecomColors.whiteColor,
              ),
              const SizedBox(width: ecomSizes.spaceBtwnItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: ecomSizes.spaceBtwnItems),
              const ecomCircularIcon(icon: Iconsax.add,
                bgColor: ecomColors.blackColor,
                width: 40,
                height: 40,
                color: ecomColors.whiteColor,
              ),

            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("Add to Cart"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(ecomSizes.medium),
            backgroundColor: ecomColors.blackColor,
            side: BorderSide(color: Colors.black)
          ),
          )
        ],
      ),
    );
  }
}
