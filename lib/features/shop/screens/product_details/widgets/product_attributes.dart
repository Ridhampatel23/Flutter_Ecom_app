import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/common/widgets/texts/product_title_text.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ecomProductAttributes extends StatelessWidget {
  const ecomProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing and Description
        ecomRoundedContainer(
          padding: EdgeInsets.all(ecomSizes.medium),
          bgColor: dark ? ecomColors.darkerGreyColor : ecomColors.greyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title, Price and Availability
              Row(
                children: [
                  const ecomSectionHeading(
                      title: "Variation", showActionButton: false),
                  SizedBox(width: ecomSizes.spaceBtwnItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ecomProductTitleText(
                              title: "Price : ", smallSize: true),

                          ///Actual price

                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: ecomSizes.spaceBtwnItems),

                          const ecomProductPriceText(price: "20"),
                        ],
                      ),
                      Row(
                        children: [
                          const ecomProductTitleText(
                              title: "Stock : ", smallSize: true),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  )
                ],
              ),

              /// Variation Description
              const ecomProductTitleText(
                  title:
                      "This is the Description of the Product and it can go upto maximum 4 lines",
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ecomSectionHeading(title: "Colors", showActionButton: false),
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
           Wrap(
             spacing: 8,
             children: [
               ecomChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
               ecomChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
               ecomChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
               ecomChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'Yellow', selected: false, onSelected: (value){}),
             ],
           )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ecomSectionHeading(title: "Sizes", showActionButton: false,),
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
           Wrap(
             spacing: 5,
             children: [
               ecomChoiceChip(text: 'US S', selected: true, onSelected: (value){}),
               ecomChoiceChip(text: 'US M', selected: false, onSelected: (value){}),
               ecomChoiceChip(text: 'US L', selected: false, onSelected: (value){}),
             ],
           )
          ],
        ),
      ],
    );
  }
}

