import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ecomSingleAddress extends StatelessWidget {
  const ecomSingleAddress({super.key, required this.selectedAdress});

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return ecomRoundedContainer(
      padding: const EdgeInsets.all(ecomSizes.medium),
      width: double.infinity,
      showBorder: true,
      bgColor: selectedAdress
          ? ecomColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : dark
              ? ecomColors.darkerGreyColor
              : ecomColors.greyColor,
      margin: const EdgeInsets.only(bottom: ecomSizes.spaceBtwnItems),
      child: Stack(
        children: [
          //Once you add the positioned widget it will throw an error as there is nothing else in the stack for the position to be relative. Just go ahead with your
          //Original plan and add a bunch of addresses and it will work just fine
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle : null,
              color: selectedAdress
                  ? dark
                      ? ecomColors.light
                      : ecomColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ridham Patel",
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ecomSizes.small / 2),
              const Text("(+123) 456 7890", maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ecomSizes.small / 2),
              const Text("9820 Reseda Blvd , Northridge, CA", softWrap: true),

            ],
          )
        ],
      ),
    );
  }
}
