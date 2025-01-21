import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_store/features/shop/controllers/product/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/ecom_circular_icon.dart';
import '../../../../../common/widgets/images/ecom_rounded_banner.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class ecomProductImageSlider extends StatelessWidget {
  const ecomProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ecomHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return ecomCurvedEdgesWidget(
      child: Container(
        color: isDarkMode ? ecomColors.darkerGreyColor : ecomColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(ecomSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnalargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: ecomColors.primaryColor),
                    ),
                  );
                })),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ecomSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: images.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: ecomSizes.spaceBtwnItems),
                  itemBuilder: (_, index) => Obx((){
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return ecomRoundedBanners(
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      imageUrl: images[index],
                      isNetworkImage: true,
                      bgColor: isDarkMode ? ecomColors.dark : Colors.white,
                      border: Border.all(color: imageSelected ? ecomColors.primaryColor : Colors.transparent),
                      padding: const EdgeInsets.all(ecomSizes.small),
                      width: 80,
                    );
                  },
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
