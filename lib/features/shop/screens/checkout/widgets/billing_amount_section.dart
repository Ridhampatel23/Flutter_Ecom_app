import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ecomBillingAmountSection extends StatelessWidget {
  const ecomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$100", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),

        /// Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$10.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: ecomSizes.spaceBtwnItems),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$110.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

      ],
    );
  }
}
