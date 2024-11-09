import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ecomBillingPaymentSection extends StatelessWidget {
  const ecomBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        ecomSectionHeading(title: "Payment Method", buttonTitle: "Change Payment", onPressed: (){}),
        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
        Row(
          children: [
            ecomRoundedContainer(
              width: 60,
              height: 35,
              bgColor: dark ? ecomColors.light : ecomColors.whiteColor,
              padding: EdgeInsets.all(ecomSizes.small),
              child: const Image(image: AssetImage(ecomImages.GoogleLogo), fit: BoxFit.contain),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
            Text("Google Pay", style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
