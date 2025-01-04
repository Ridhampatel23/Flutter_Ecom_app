import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/features/shop/controllers/banner_controller.dart';
import 'package:ecom_store/features/shop/controllers/home_controller.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/ecom_rounded_banner.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomPromoSlider extends StatelessWidget {
  const ecomPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) {
        return const ecomShimmerEffect(width: double.infinity, height: 190);
      }

      //No Data Found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else{
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map(
                    (banner) => ecomRoundedBanners(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onPressed: () => Get.toNamed(banner.targetScreen),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnItems),
            Center(
              child: Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      ecomCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        bgColor: controller.carousalCurrentIndex.value == i
                            ? ecomColors.primaryColor
                            : ecomColors.greyColor,
                      )
                  ],
                ),
              ),
            )
          ],
        );
      }


    });
  }
}
