import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ecomOrderListItems extends StatelessWidget {
  const ecomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      // The separator builder , we used sizedbox with spacebetween items to add the
      // same space to all the elements to be added inside the list view
      separatorBuilder: (_, __) => const SizedBox(height: ecomSizes.spaceBtwnItems),
      itemBuilder: (_, index) => ecomRoundedContainer(
        padding: const EdgeInsets.all(ecomSizes.medium),
        showBorder: true,
        bgColor: dark ? ecomColors.dark : ecomColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      
            /// Row 1
            Row(
              children: [
                /// 1 - Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: ecomSizes.spaceBtwnItems / 2),
      
                /// 2 - Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: ecomColors.primaryColor, fontWeightDelta: 1),
                      ),
                      Text("11 August 2024",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3 Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34, size: ecomSizes.iconSmall),
                ),
              ],
            ),
      
            const SizedBox(height: ecomSizes.spaceBtwnItems),
      
            /// Row 2
            Row(
              //Since we have two rows inside 1 they will try to take up the full
              //Full Space and create an error, thus we wrap both the children with expanded to make them behave like 
              // a flexbox and take equal space!
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: ecomSizes.spaceBtwnItems / 2),
                  
                      /// 2 - Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text("#123456",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                  
                    ],
                  ),
                ),
      
      
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ecomSizes.spaceBtwnItems / 2),
                  
                      /// 2 - Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text("07 August 2024",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
