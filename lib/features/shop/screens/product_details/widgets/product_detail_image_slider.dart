import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/ecom_circular_icon.dart';
import '../../../../../common/widgets/images/ecom_rounded_banner.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ecomProductImageSlider extends StatelessWidget {
  const ecomProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final isDarkMode = ecomHelperFunctions.isDarkMode(context);

    return ecomCurvedEdgesWidget(
      child: Container(
        color:
        isDarkMode ? ecomColors.darkerGreyColor : ecomColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            const SizedBox(
                height: 400,
                child: Padding(
                    padding:
                    EdgeInsets.all(ecomSizes.productImageRadius),
                    child: Center(
                        child: Image(
                            image: AssetImage(
                                ecomImages.nikeDunkGreen))))),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 20,
              left: ecomSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: ecomSizes.spaceBtwnItems),
                  itemBuilder: (_, index) => ecomRoundedBanners(
                    imageUrl: ecomImages.nikeDunkGreen,
                    bgColor:
                    isDarkMode ? ecomColors.dark : Colors.white,
                    border: Border.all(color: ecomColors.primaryColor),
                    padding: const EdgeInsets.all(ecomSizes.small),
                    width: 80,
                  ),
                ),
              ),
            ),

            ///Appbar Icons
            const ecomAppBar(
              showBackArrow: true,
              actions: [
                ecomCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
