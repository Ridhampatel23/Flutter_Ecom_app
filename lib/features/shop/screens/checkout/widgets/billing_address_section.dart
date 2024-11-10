import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ecomBillingAddressSection extends StatelessWidget {
  const ecomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ecomSectionHeading(title: "Shipping Address", buttonTitle: "Change Address", onPressed: (){}),
        Text("Ridham's Home", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

        Row(
          children: [
          const Icon(Icons.phone, color: ecomColors.greyColor, size: 16),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            Text("123-456-7890", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

        Row(
          children: [
          const Icon(Icons.location_history, color: ecomColors.greyColor, size: 16),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            Expanded(child: Text("98000 Reseda Blvd, 91324, USA", style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

      ],
    );
  }
}
