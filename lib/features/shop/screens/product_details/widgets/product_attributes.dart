import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/common/widgets/texts/product_title_text.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/controllers/product/variation_controller.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../models/product_model.dart';

class ecomProductAttributes extends StatelessWidget {
  const ecomProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());

    return Obx(
        () => Column(
        children: [
          /// -- Selected Attribute Pricing and Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            ecomRoundedContainer(
              padding: const EdgeInsets.all(ecomSizes.medium),
              bgColor: dark ? ecomColors.darkerGreyColor : ecomColors.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title, Price and Availability
                  Row(
                    children: [
                      const ecomSectionHeading(
                          title: "Variation", showActionButton: false),
                      const SizedBox(width: ecomSizes.spaceBtwnItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ecomProductTitleText(
                                  title: "Price : ", smallSize: true),

                              ///Actual price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                "\$${controller.selectedVariation.value.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),

                              const SizedBox(width: ecomSizes.spaceBtwnItems),
                              /// Sale Price
                               ecomProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock Status
                          Row(
                            children: [
                              const ecomProductTitleText(
                                  title: "Stock : ", smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium!.apply(color: controller.variationStockStatus.value == 'In Stock' ? Colors.green : Colors.red)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  /// Variation Description
                  ecomProductTitleText(
                      title: controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLines: 4),
                ],
              ),
            ),
          const SizedBox(height: ecomSizes.spaceBtwnItems),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ecomSectionHeading(
                            title: attribute.name ?? '', showActionButton: false),
                        const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected =
                                    controller.selectedAttributes[attribute.name] ==
                                        attributeValue;
                                final available = controller
                                    .getAttributeAvailabilityInVariation(
                                        product.productVariations!, attribute.name!)
                                    .contains(attributeValue);

                                return ecomChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
