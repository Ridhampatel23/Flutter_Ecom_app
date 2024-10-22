import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ecomSearchContainer extends StatelessWidget {
  const ecomSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBG = true,
    this.showBorder = true, this.onTap, this.padding =  const EdgeInsets.symmetric(horizontal: ecomSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBG, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = ecomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ecomDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ecomSizes.medium),
          decoration: BoxDecoration(
            color: showBG
                ? darkMode
                ? ecomColors.dark
                : ecomColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ecomSizes.cardRadiusLarge),
            border: showBorder ? Border.all(color: ecomColors.greyColor) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: ecomColors.darkerGreyColor),
              const SizedBox(width: ecomSizes.spaceBtwnItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
