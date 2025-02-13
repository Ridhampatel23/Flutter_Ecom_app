import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/images/ecom_rounded_banner.dart';
import 'package:ecom_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_price.dart';
import 'package:ecom_store/common/widgets/texts/ecom_brand_title_text_with_verified_icon.dart';
import 'package:ecom_store/common/widgets/texts/product_title_text.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
 import '../../icons/ecom_circular_icon.dart';

class ecomProductCardHorizontal extends StatelessWidget {
  const ecomProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(ecomSizes.productImageRadius),
    color: dark ? ecomColors.darkGreyColor : ecomColors.lightContainer,
    ),
    child: Row(
      children: [
        ///Thumbnail
        ecomRoundedContainer(
          height: 120,
          padding: const EdgeInsets.all(ecomSizes.small),
          bgColor: dark ? ecomColors.dark : ecomColors.light,
          child: Stack(
            children: [
              /// -- Thumbnail Image
              const SizedBox(height:120,
                  width: 120,
                  child: ecomRoundedBanners(imageUrl: ecomImages.nikeDunkGreen, applyImageRadius: true),),

              /// -- Sale Tag
              Positioned(
                top: 12,
                child: ecomRoundedContainer(
                  radius: ecomSizes.small,
                  bgColor: ecomColors.secondaryColor.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: ecomSizes.small,
                      vertical: ecomSizes.xsmall),
                  child: Text("25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black)),
                ),
              ),

              /// Wishlist
               const Positioned(
                top: 0,
                right: 0,
                child: ecomFavouriteIcon(productId: ''),
              ),
            ],
          ),
        ),
        
        /// Details
        SizedBox(
          width: 172,
          child: Padding(
            padding: const EdgeInsets.only(top: ecomSizes.small, left: ecomSizes.small),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ecomProductTitleText(title: "Green Nike Dunk Low", smallSize: true),
                    SizedBox(height: ecomSizes.spaceBtwnItems/ 2),
                    ecomBrandTitleWithVerifiedIcon(title: "Nike"),
                  ],
                ),

                const Spacer(),
                //If we use the space as it is, it is going to cause an error becuase
                //it takes up the whole page, so to overcome this issue, we will wrap the horizontal
                //cards with a list view first and make the scroll direction horizontal and then
                //wrap it with a sizedbox with a specific height so the whole card can only take upto
                // upto a certain height even with the spacer.

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Pricing
                    const Flexible(child: ecomProductPriceText(price: "250")),
                    //We wrapped the upper widget with with flexible because if we put a huge price
                    // range it will cause an error, so to overcome that error, we wrapped it with
                    //Flexible widget.

                    /// -- Add to Cart Button --
                    Container(
                      decoration: const BoxDecoration(
                          color: ecomColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ecomSizes.cardRadiusMedium),
                            bottomRight:
                            Radius.circular(ecomSizes.cardRadiusMedium),
                          )),

                      child: const SizedBox(
                          width: ecomSizes.iconLarge * 1.2,
                          height: ecomSizes.iconLarge * 1.2,
                          child: Icon(Iconsax.add, color: ecomColors.whiteColor)),
                    ),



                  ],
                )

              ]
            ),
          ),
        )
      ],
    ),
    );
  }
}
